package org.joget.apps.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.joget.apps.app.model.AppDefinition;
import org.joget.apps.app.model.Message;
import org.joget.commons.util.LogUtil;
import org.springframework.orm.hibernate3.HibernateCallback;

public class MessageDaoImpl extends AbstractAppVersionedObjectDao<Message> implements MessageDao {

    public static final String ENTITY_NAME = "Message";
    public static Map<String, Message> cache = new HashMap<String, Message>();

    @Override
    public String getEntityName() {
        return ENTITY_NAME;
    }
    
    private String getCacheKey(String messageKey, String locale, String appId, String appVersion) {
        return messageKey + Message.ID_SEPARATOR + locale + Message.ID_SEPARATOR + appId + Message.ID_SEPARATOR + appVersion;
    }

    public Message loadByMessageKey(String messageKey, String locale, AppDefinition appDefinition) {
        String key = getCacheKey(messageKey, locale, appDefinition.getId(), appDefinition.getVersion().toString());
        
        if (cache.containsKey(key)) {
            return cache.get(key);
        } else {
            Message message = loadById(messageKey + Message.ID_SEPARATOR + locale, appDefinition);
            cache.put(key, message);
            return message;
        }
    }

    public Collection<Message> getMessageList(String filterString, String locale, AppDefinition appDefinition, String sort, Boolean desc, Integer start, Integer rows) {
        String conditions = "";
        List params = new ArrayList();

        if (filterString == null) {
            filterString = "";
        }
        conditions = "and (messageKey like ? or message like ?)";
        params.add("%" + filterString + "%");
        params.add("%" + filterString + "%");

        if (locale != null) {
            conditions += "and locale = ?";
            params.add(locale);
        }

        return this.find(conditions, params.toArray(), appDefinition, sort, desc, start, rows);
    }

    public Long getMessageListCount(String filterString, String locale, AppDefinition appDefinition) {
        String conditions = "";
        List params = new ArrayList();

        if (filterString == null) {
            filterString = "";
        }
        conditions = "and (messageKey like ? or message like ?)";
        params.add("%" + filterString + "%");
        params.add("%" + filterString + "%");

        if (locale != null) {
            conditions += "and locale = ?";
            params.add(locale);
        }

        return this.count(conditions, params.toArray(), appDefinition);
    }

    public Collection<String> getLocaleList(AppDefinition appDefinition) {
        final String condition = generateQueryCondition(appDefinition);
        final Object[] params = generateQueryParams(appDefinition).toArray();

        // execute query and return result
        Collection<String> resultList = (Collection) this.findHibernateTemplate().execute(
                new HibernateCallback() {

                    public Object doInHibernate(Session session) throws HibernateException, SQLException {
                        String query = "SELECT distinct e.locale FROM " + getEntityName() + " e " + condition + " ORDER BY e.locale";

                        Query q = session.createQuery(query);
                        q.setFirstResult(0);

                        if (params != null) {
                            int i = 0;
                            for (Object param : params) {
                                q.setParameter(i, param);
                                i++;
                            }
                        }

                        return q.list();
                    }
                });

        return resultList;
    }

    @Override
    public boolean delete(String id, AppDefinition appDef) {
        boolean result = false;
        try {
            Message obj = loadById(id, appDef);

            // detach from app
            if (obj != null) {
                Collection<Message> list = appDef.getMessageList();
                for (Message object : list) {
                    if (obj.getId().equals(object.getId())) {
                        String key = getCacheKey(object.getMessageKey(), object.getLocale(), object.getAppId(), object.getAppVersion().toString());
        
                        if (cache.containsKey(key)) {
                            cache.remove(key);
                        }
        
                        list.remove(obj);
                        break;
                    }
                }
                obj.setAppDefinition(null);

                // delete obj
                super.delete(getEntityName(), obj);
                result = true;
            }
        } catch (Exception e) {
            LogUtil.error(getClass().getName(), e, "");
        }
        return result;
    }
    
    @Override
    public boolean update(Message object) {
        String key = getCacheKey(object.getMessageKey(), object.getLocale(), object.getAppId(), object.getAppVersion().toString());
        
        if (cache.containsKey(key)) {
            cache.put(key, object);
        }
        return super.update(object);
    }
}
