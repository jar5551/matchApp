'use strict';

describe('Service: userMeLoader', function () {

  // load the service's module
  beforeEach(module('frontEndApp'));

  // instantiate service
  var userMeLoader;
  beforeEach(inject(function (_userMeLoader_) {
    userMeLoader = _userMeLoader_;
  }));

  it('should do something', function () {
    expect(!!userMeLoader).toBe(true);
  });

});
