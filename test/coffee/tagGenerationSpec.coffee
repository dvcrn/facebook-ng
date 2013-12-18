describe 'Facebook tag generation test', ->

  html = null
  elem = null
  compiled = null
  scope = null

  beforeEach ($compile, $rootScope) ->
    module 'facebook-ng'

    html = '<facebook></facebook>'

    inject ($compile, $rootScope) ->
      scope = $rootScope

      elem = angular.element html
      compiled = $compile elem
      compiled $rootScope

      $rootScope.$digest()

  it 'Should get replaced by a element with fb-root id', ->
    expect(elem.attr 'id').toBe 'fb-root'

  it 'Should append a script tag to fb-root', ->
    script_tag = elem.contents()
    expect(script_tag.attr 'src').toBe 'http://connect.facebook.net/en_US/all.js'