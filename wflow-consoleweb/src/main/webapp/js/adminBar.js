var AdminBar = {
    cookiePath: "/",
    currentPageTitle: "",
    webConsole: false,
    builderMode: false,
    isDefaultUserview: false,
    setCookiePath: function(path) {
        AdminBar.cookiePath = path;
    },
    showQuickOverlay: function(url) {
        if (AdminBar.builderMode && typeof AdvancedTools !== "undefined") {
            AdvancedTools.hideQuickOverlay();
        }
        
        url = UrlUtil.updateUrlParam(url, "_ov", (new Date().getTime()));
        
        var $quickOverlayFrame = $(parent.document).find("#quickOverlayFrame");
        if ($quickOverlayFrame.length === 0) {
            var overlayContainer = 
                '<div id="quickOverlayContainer" class="quickOverlayContainer"><div id="quickOverlay" class="quickOverlay"></div>\
                <div id="quickOverlayButton" class="quickOverlayButton"><a href="#" onclick="AdminBar.hideQuickOverlay()"><i class="fa fa-remove"></i></a></div>\
                <iframe id="quickOverlayFrame" name="quickOverlayFrame" src="about:blank"></iframe></div>';
            $(document.body).append(overlayContainer);
            $(document.body).addClass("stop-scrolling");
            $quickOverlayFrame = $(document.body).find("#quickOverlayFrame");
        }
        $quickOverlayFrame.attr("src", "about:blank");
        $quickOverlayFrame.attr("src", url);
        $("#overlay, #quickOverlayButton, #quickOverlayFrame").fadeIn();
        $quickOverlayFrame.on("load", function() {
            AdminBar.currentPageTitle = document.title;
            var frameTitle = $quickOverlayFrame[0].contentDocument.title;
            if (frameTitle !== "") {
                document.title = frameTitle;
            }
            $("#quickOverlayContainer").removeClass("minimize");
        });
        $("#quickOverlayFrame, #adminBar, #adminControl, #quickOverlayButton").off("mouseenter mouseleave");
        $("#quickOverlayFrame, #adminBar, #adminControl, #quickOverlayButton").on( "mouseenter", function() {
            $("#quickOverlayContainer").removeClass("minimize");
        }).on("mouseleave", function(event) {
            if ((event.relatedTarget === null || event.relatedTarget === undefined) && event.pageY < 0) {
                $("#quickOverlayContainer").addClass("minimize");
            }
        });
        $("#quickOverlay").off("mouseenter");
        $("#quickOverlay").on( "mouseenter", function() {
            $("#quickOverlayContainer").addClass("minimize");
        });
        
        $("#quickOverlay").off("click");
        $("#quickOverlay").on("click", function() {
            AdminBar.hideQuickOverlay();
        });
        
        return false;
    },
    hideQuickOverlay: function() {
        $("#adminBarButtons a").removeClass("current");
        $("#overlay, #quickOverlayButton, #quickOverlayFrame").fadeOut();
        $("#quickOverlayContainer").remove();
        $(document.body).removeClass("stop-scrolling");
        if (AdminBar.currentPageTitle !== "") {
            document.title = AdminBar.currentPageTitle;
        }
    },
    enableQuickEditMode: function() {
        if (AdminBar.isDefaultUserview) {
            return;
        }
        var path = AdminBar.cookiePath;
        $.cookie("quickEditModeActive", "true", {
            path: path
        });
        AdminBar.initQuickEditMode();
    },
    disableQuickEditMode: function() {
        var path = AdminBar.cookiePath;
        $.cookie("quickEditModeActive", "false", {
            path: path
        });
        AdminBar.initQuickEditMode();
    },
    isQuickEditMode: function() {
        var quickEditModeActive =  $.cookie("quickEditModeActive");
        return quickEditModeActive === "true";
    },
    isAdminBarHide: function() {
        var adminBarModeHide =  $.cookie("adminBarModeHide");
        return adminBarModeHide === "true";
    },
    showQuickEdit: function() {
        $(".analyzer-page").css("display", "inline-block");
        if (AdminBar.isDefaultUserview) {
            return;
        }
        $("#quickEditMode").removeClass("off");
        $(".quickEdit").fadeIn();
        $(".analyzer-label").css("display", "inline-block");
        $(".analyzer-disabled").addClass("analyzer").removeClass("analyzer-disabled");
        $("body").addClass("quickEditModeActive");
    },
    hideQuickEdit: function() {
        $("#quickEditMode").addClass("off");
        $(".quickEdit").css("display", "none");
        $(".analyzer-label, .analyzer-page").css("display", "none");
        $(".analyzer").addClass("analyzer-disabled").removeClass("analyzer");
        $("body").removeClass("quickEditModeActive");
    },
    initQuickEditMode: function() {
        var quickEditModeActive = AdminBar.isQuickEditMode();
        if (quickEditModeActive) {
            AdminBar.showQuickEdit();
        } else {
            AdminBar.hideQuickEdit();
        }
    },
    initAdminBar: function() {
        $("#quickEditMode").on('click', function() {
            if ($("#quickEditMode").hasClass("off")) {
                AdminBar.enableQuickEditMode();
            } else {
                AdminBar.disableQuickEditMode();
            }
            return false;
        });
        if (AdminBar.webConsole || AdminBar.isDefaultUserview) {
            $("#quickEditModeOption").hide();
        }
        if (AdminBar.isAdminBarHide()) {
            AdminBar.hideAdminBar();
        } else {
            AdminBar.showAdminBar();
        }
        // shortcut keys
        $(document).keyup(function (e) {
            if(e.which === 16){
                AdminBar.isShiftKeyPressed = false;
            } else if(e.which === 17){
                AdminBar.isCtrlKeyPressed = false;
            } else if(e.which === 18){
                AdminBar.isAltKeyPressed = false;
            }
        }).keydown(function (e) {
            if(e.which === 16){
                AdminBar.isShiftKeyPressed = true;
            } else if(e.which === 17){
                AdminBar.isCtrlKeyPressed = true;
            } else if(e.which === 18){
                AdminBar.isAltKeyPressed = true;
            }
            if(e.which === 48 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+0
                if ($("#quickEditMode").hasClass("off")) {
                    AdminBar.showAdminBar();
                    AdminBar.enableQuickEditMode();
                } else {
                    AdminBar.hideAdminBar()();
                    AdminBar.disableQuickEditMode();
                }
                return false;
            }  
            if(e.which === 49 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+1
                AdminBar.showAdminBar();
                $("#adminBarButtons a.adminBarButton:eq(0)").trigger("click");
		return false;
            }
            if(e.which === 50 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+2
                AdminBar.showAdminBar();
                $("#adminBarButtons a.adminBarButton:eq(1)").trigger("click");
		return false;
            }
            if(e.which === 51 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+3
                AdminBar.showAdminBar();
                $("#adminBarButtons a.adminBarButton:eq(2)").trigger("click");
		return false;
            }
            if(e.which === 52 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+4
                AdminBar.showAdminBar();
                $("#adminBarButtons a.adminBarButton:eq(3)").trigger("click");
		return false;
            }
            if(e.which === 53 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+5
                AdminBar.showAdminBar();
                $("#adminBarButtons a.adminBarButton:eq(4)").trigger("click");
		return false;
            }
            if(e.which === 54 && AdminBar.isCtrlKeyPressed && !AdminBar.isShiftKeyPressed && !AdminBar.isAltKeyPressed) { // CTRL+6
                AdminBar.showAdminBar();
                $("#adminBarButtons a.adminBarButton:eq(5)").trigger("click");
		return false;
            }
        });        
        $("#adminControl").on('click', function() {
            if (AdminBar.isAdminBarOpen()) {
                AdminBar.hideAdminBar();
            } else {
                AdminBar.showAdminBar();
            }
        });
        $("#adminBarButtons a").on('click', function() {
            $("#adminBarButtons a").removeClass("current");
            $(this).addClass("current");
        });
        if (window === parent) {
            $("#adminControl").fadeIn();
        }
    },
    showAdminBar: function() {
        $("body, html").addClass("adminBarShown");
        $("#adminBar").removeClass("adminBarInactive");
        $("#adminBar").addClass("adminBarActive");
        $("#adminControl").addClass("active");
        $("#adminControl").find("i").attr("class", "fa fa-angle-double-right");
        var path = AdminBar.cookiePath;
        $.cookie("adminBarModeHide", "false", {
            path: path
        });
        AdminBar.initQuickEditMode();
    },
    hideAdminBar: function() {
        $("body, html").removeClass("adminBarShown");
        $("#adminBar").removeClass("adminBarActive");
        $("#adminBar").addClass("adminBarInactive");
        $("#adminControl").removeClass("active");
        $("#adminControl").find("i").attr("class", "fa fa-pencil");
        var path = AdminBar.cookiePath;
        $.cookie("adminBarModeHide", "true", {
            path: path
        });
        AdminBar.hideQuickOverlay();
        AdminBar.hideQuickEdit();
    },
    isAdminBarOpen: function() {
        return ($("#adminBar").hasClass("adminBarActive"));
    }
};
$(window).on("load", function() {
    setTimeout(function () {
        AdminBar.initAdminBar();
    }, 0);
});

