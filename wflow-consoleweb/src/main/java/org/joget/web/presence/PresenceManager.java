package org.joget.web.presence;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import de.bripkens.gravatar.DefaultImage;
import de.bripkens.gravatar.Gravatar;
import de.bripkens.gravatar.Rating;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.joget.commons.util.DynamicDataSourceManager;
import org.joget.commons.util.LogUtil;
import org.joget.commons.util.SetupManager;
import org.joget.directory.model.User;

public class PresenceManager {
    
    private static boolean running;
        
    // Keeps all open connections from browsers
    private static final Map<String, AsyncContext> asyncContexts = new ConcurrentHashMap<>(); 
    
    // Map of profile->{path->{sessionId, User}}
    private static final Map<String, Map> profilePathMap = new ConcurrentHashMap<>();
    
    // Blocking queue to wake notifier
    private static BlockingQueue waitQueue = new LinkedBlockingQueue();

    // Thread that waits for new message and then redistribute it
    private static final Thread notifier = new Thread(new Runnable() {
        @Override
        public void run() {
            try {
                while (running) {
                    // Waits until a message arrives
                    Object msg = waitQueue.poll(30, TimeUnit.SECONDS);
                    LogUtil.debug(PresenceManager.class.getName(), (msg != null) ? "Notifier message received" : "Notifier poll timeout");
                
                    // Sends the message to all the AsyncContext's response
                    Collection<String> paths = PresenceManager.getPaths();
                    for (String path: paths) {                        
                        sendResponse(path);
                    }
                }
            } catch (InterruptedException e) {
                LogUtil.error(PresenceManager.class.getName(), e, e.getMessage());
            }
        }

    });    

    protected static void sendResponse(String path) {
        for (String key: asyncContexts.keySet()) {
            AsyncContext asyncContext = asyncContexts.get(key);
            try {
                Map<String, UserEntry> userMap = PresenceManager.getUsers(path);
                PrintWriter writer = asyncContext.getResponse().getWriter();
                writer.print("event: ");
                writer.println(path);
                writer.print("data: ");
                String output = "";
                for (String sessionId: userMap.keySet()) {
                    UserEntry userEntry = userMap.get(sessionId);
                    String url = (userEntry.getEmail() != null) ? 
                        new Gravatar()
                            .setSize(20)
                            .setHttps(true)
                            .setRating(Rating.PARENTAL_GUIDANCE_SUGGESTED)
                            .setStandardDefaultImage(DefaultImage.IDENTICON)
                            .getUrl(userEntry.getEmail())
                        : "//www.gravatar.com/avatar/default?d=identicon";
                    output += "<li class=\"user\"><img class=\"gravatar\" alt=\"gravatar\" src=\""+url+"\" title=\"" + userEntry.getUsername() + "\" /><span class=\"username\">" + userEntry.getUsername() + " (" + sessionId + ")</span></li>";
                }
                writer.println(output);
                writer.println();
                writer.flush();
            } catch (Exception e) {
                // In case of exception remove context from map
                asyncContexts.values().remove(asyncContext);
                String sessionId = key.substring(0, key.indexOf(":"));
                PresenceManager.leave(path, sessionId);
            }
        }
    }
    
    public static void startNotifier() {
        // Start thread
        running = true;
        notifier.setDaemon(true);
        notifier.start();        
    }

    public static void stopNotifier() {
        running = false;
        asyncContexts.clear();
    }
    
    public static void resumeNotifier() {
        try {
            if (waitQueue.isEmpty()) {
                waitQueue.put("resume");
            }
        } catch (InterruptedException ex) {
            LogUtil.error(PresenceManager.class.getName(), ex, ex.getMessage());
        }
    }
        
    public static String getPath(HttpServletRequest request) {
        String path;
        try {
            path = new URI(request.getHeader("referer")).getPath();
        } catch (URISyntaxException ex) {
            path = request.getRequestURI();
        }
        return path;
    }

    /**
     * 
     * @return Map of path->{sessionId, User}
     */
    public static Map<String, Map<String, UserEntry>> loadPathMap() {
        String profile = DynamicDataSourceManager.getCurrentProfile();
        Map<String, Map<String, UserEntry>> pathMap = profilePathMap.get(profile);
        if (pathMap == null) {
            pathMap = new ConcurrentHashMap<>();
            profilePathMap.put(profile, pathMap);
        }        
        // read from shared presence file
        String presenceFilePath = SetupManager.getBaseDirectory() + "/app_presence.json";
        try {
            String presenceJson = FileUtils.readFileToString(new File(presenceFilePath));
            Gson gson = new Gson();
            Map<String, Map<String, UserEntry>> pathMapFromJson = gson.fromJson(presenceJson, new TypeToken<Map<String, Map<String, UserEntry>>>(){}.getType());
//            LogUtil.debug(PresenceManager.class.getName(), "pathMapFromJson: " + pathMapFromJson);
            pathMap = pathMapFromJson;
            profilePathMap.put(profile, pathMapFromJson);
        } catch (Exception e) {
            LogUtil.debug(PresenceManager.class.getName(), "Error reading presence file: " + e.getMessage());
        }
        return pathMap;
    }
    
    public static void savePathMap(Map<String, Map<String, UserEntry>> pathMap) {
        // write to shared presence file
        String presenceFilePath = SetupManager.getBaseDirectory() + "/app_presence.json";
        try {
            Gson gson = new Gson();
            String pathMapJson = gson.toJson(pathMap);
            FileUtils.writeStringToFile(new File(presenceFilePath), pathMapJson, "UTF-8");
//            LogUtil.debug(PresenceManager.class.getName(), "pathMapJson: " + pathMapJson);
        } catch (Exception e) {
            LogUtil.debug(PresenceManager.class.getName(), "Error writing to presence file: " + e.getMessage());
        }        
    }
    
    public static Collection<String> getPaths() {
        Map<String, Map<String, UserEntry>> pathMap = loadPathMap();
        return pathMap.keySet();
    }
        
    public static void registerRequest(HttpServletRequest request) {
        // Start asynchronous context and add listeners to remove it in case of errors
        final AsyncContext ac = request.startAsync();
        final String path = getPath(request);
        final String sessionId = request.getSession().getId();
        final String key = sessionId + ":" + path;
        ac.addListener(new AsyncListener() {
            @Override
            public void onComplete(AsyncEvent event) throws IOException {
                asyncContexts.remove(key);
            }
            @Override
            public void onError(AsyncEvent event) throws IOException {
                asyncContexts.remove(key);
                PresenceManager.leave(path, sessionId);
                resumeNotifier();
            }
            @Override
            public void onStartAsync(AsyncEvent event) throws IOException {
                // Do nothing
            }
            @Override
            public void onTimeout(AsyncEvent event) throws IOException {
                asyncContexts.remove(key);
            }
        });

        // Put context in a map
        asyncContexts.put(key, ac);
        sendResponse(path);        
    }
    
    public static void join(String path, String sessionId, User user) {
        Map<String, Map<String, UserEntry>> pathMap = loadPathMap();
        Map<String, UserEntry> sessionMap = pathMap.get(path);
        if (sessionMap == null) {
            sessionMap = new HashMap<>();
            pathMap.put(path, sessionMap);
        }
        UserEntry userEntry = new UserEntry();
        userEntry.setUsername(user.getUsername());
        userEntry.setEmail(user.getEmail());
        sessionMap.put(sessionId, userEntry);
        savePathMap(pathMap);
        resumeNotifier();
        LogUtil.debug(PresenceManager.class.getName(), "join:" + path + ":" + user.getUsername() + ":" + sessionId);
    }

    public static void leave(String path, String sessionId) {
        Map<String, Map<String, UserEntry>> pathMap = loadPathMap();
        if (path != null) {
            Map<String, UserEntry> sessionMap = pathMap.get(path);
            if (sessionMap != null) {
                sessionMap.remove(sessionId);
                if (sessionMap.isEmpty()) {
                    pathMap.remove(path);
                }
            }
        } else {
            for (Map<String, UserEntry> sessionMap: pathMap.values()) {
                sessionMap.remove(sessionId);
                if (sessionMap.isEmpty()) {
                    pathMap.remove(path);
                }
            }
        }
        savePathMap(pathMap);
        resumeNotifier();
        LogUtil.debug(PresenceManager.class.getName(), "leave:" + path + ":" + sessionId);
    }

    public static Map<String, UserEntry> getUsers(String path) {
        Map<String, Map<String, UserEntry>> pathMap = loadPathMap();
        Map<String, UserEntry> sessionMap = pathMap.get(path);
        if (sessionMap == null) {
            sessionMap = new HashMap<>();
        }
        if (!sessionMap.isEmpty()) {
            LogUtil.debug(PresenceManager.class.getName(), "users:" + path + ":" + sessionMap.keySet());
        }
        return sessionMap;
    }
    
    public static class UserEntry {
        String username;
        String email;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        @Override
        public String toString() {
            return "{\"username:\"" + this.username + "\",\"email\":" + this.email + "\"}";
        }
        
    }
}
