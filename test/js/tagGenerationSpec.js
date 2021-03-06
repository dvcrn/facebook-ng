(function() {
  describe('Facebook tag generation test', function() {
    var compiled, elem, html, scope;
    html = null;
    elem = null;
    compiled = null;
    scope = null;
    beforeEach(function($compile, $rootScope) {
      module('facebook-ng');
      html = '<facebook></facebook>';
      return inject(function($compile, $rootScope) {
        scope = $rootScope;
        elem = angular.element(html);
        compiled = $compile(elem);
        compiled($rootScope);
        return $rootScope.$digest();
      });
    });
    it('Should get replaced by a element with fb-root id', function() {
      return expect(elem.attr('id')).toBe('fb-root');
    });
    return it('Should append a script tag to fb-root', function() {
      var script_tag;
      script_tag = elem.contents();
      return expect(script_tag.attr('src')).toBe('http://connect.facebook.net/en_US/all.js');
    });
  });

}).call(this);
