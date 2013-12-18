'use strict'

angular.module('facebook-ng', [])
  .factory('Facebook', ['$window', '$rootScope', '$q', ($window, $rootScope, $q) ->
    Facebook = {
      _init_promise: $q.defer()
      _config: {
        appId: null,
        status: false,
        cookie: true,
        xfbml: false,
        oauth: true,
        frictionlessRequests: false,
        hideFlashCallback: null
      }
      init: (config) ->
        config = angular.extend(this._config, config)

        # Resolve promise and ping waiting scripts
        $window.fbAsyncInit = =>
          FB.init config
          this._init_promise.resolve(FB)

      # Wrap the original facebook sdk without touching it
      FB: (callback) ->
        this._init_promise.promise.then((FB) ->
          callback(FB)
        )
    }

    return Facebook
  ])
  .directive('facebook', ['Facebook', (Facebook) ->
    link = (scope, element, attr) ->
      config = {}
      if 'appid' of attr
        config['appId'] = parseInt(attr['appid'])
      if 'cookie' of attr
        config['cookie'] = (attr['cookie'] == 'true')
      if 'status' of attr
        config['status'] = (attr['status'] == 'true')
      if 'xfbml' of attr
        config['xfbml'] = (attr['xfbml'] == 'true')
      if 'oauth' of attr
        config['oauth'] = (attr['oauth'] == 'true')
      if 'frictionlessrequests' of attr
        config['frictionlessRequests'] = (attr['frictionlessrequests'] == 'true')
      if 'hideflashcallback' of attr
        config['hideFlashCallback'] = (attr['hideflashcallback'] == 'true')

      Facebook.init(config)

      #Load the FB api asynchronously
      e = document.createElement("script")
      e.async = true
      e.src = document.location.protocol + "//connect.facebook.net/en_US/all.js"
      element[0].appendChild e

    {
      restrict: 'E',
      template: '<div id="fb-root"></div>',
      replace: true,
      scope: {
        facebook_id: '=fbid'
      },
      link: link
    }
  ])