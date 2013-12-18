describe 'Facebook init test', ->

  beforeEach module 'facebook-ng'

  compile_scope = (html) ->
    inject ($compile, $rootScope) =>
      elem = angular.element html
      compiled = $compile elem
      compiled $rootScope

      $rootScope.$digest()

  it 'Should parse appid to int', ->
    compile_scope '<facebook appId="123"></facebook>'

    inject (Facebook) ->
      expect(Facebook._config.appId).toBe(123)

  it 'Should parse booleans correctly', ->
    keys = ['status', 'cookie', 'xfbml', 'oauth', 'frictionlessRequests', 'hideFlashCallback']

    for key in keys
      for value in [true, false]
        compile_scope '<facebook '+key+'="'+value+'"></facebook>'
        inject (Facebook) ->
          expect(Facebook._config[key]).toBe(value)

  it 'Should initialise Facebook after fbAsyncInit gets called', ->
    window.FB = {
      init: ->
        return
    }
    spyOn(window.FB, 'init')
    compile_scope '<facebook appId="123"></facebook>'

    fbAsyncInit()
    expect(window.FB.init).toHaveBeenCalled()

  it 'Should resolve promise after fbAsyncInit gets called', ->
    compile_scope '<facebook appId="123"></facebook>'
    inject (Facebook) ->
      spyOn(Facebook._init_promise, 'resolve')
      fbAsyncInit()
      expect(Facebook._init_promise.resolve).toHaveBeenCalled()

  it 'Should return facebook SDK after fbAsyncInit is finished', ->
    window.FB = {
      init: ->
        return
    }

    compile_scope '<facebook appId="123"></facebook>'
    fbAsyncInit()
    inject (Facebook) ->
      Facebook.FB (FB) ->
        expect(FB).toBe(window.FB)