(function() {
    "use strict";
    angular.module("facebook-ng", []).factory("Facebook", [ "$window", "$rootScope", "$q", function(a, b, c) {
        var d;
        return d = {
            _init_promise: c.defer(),
            _config: {
                appId: null,
                status: !1,
                cookie: !0,
                xfbml: !1,
                oauth: !0,
                frictionlessRequests: !1,
                hideFlashCallback: null
            },
            init: function(b) {
                var c = this;
                return b = angular.extend(this._config, b), a.fbAsyncInit = function() {
                    return FB.init(b), c._init_promise.resolve(FB);
                };
            },
            FB: function(a) {
                return this._init_promise.promise.then(function(b) {
                    return a(b);
                });
            }
        };
    } ]).directive("facebook", [ "Facebook", function(a) {
        var b;
        return b = function(b, c, d) {
            var e, f;
            return e = {}, "appid" in d && (e.appId = parseInt(d.appid)), "cookie" in d && (e.cookie = "true" === d.cookie), 
            "status" in d && (e.status = "true" === d.status), "xfbml" in d && (e.xfbml = "true" === d.xfbml), 
            "oauth" in d && (e.oauth = "true" === d.oauth), "frictionlessrequests" in d && (e.frictionlessRequests = "true" === d.frictionlessrequests), 
            "hideflashcallback" in d && (e.hideFlashCallback = "true" === d.hideflashcallback), 
            a.init(e), f = document.createElement("script"), f.async = !0, f.src = document.location.protocol + "//connect.facebook.net/en_US/all.js", 
            c[0].appendChild(f);
        }, {
            restrict: "E",
            template: '<div id="fb-root"></div>',
            replace: !0,
            scope: {
                facebook_id: "=fbid"
            },
            link: b
        };
    } ]);
}).call(this);