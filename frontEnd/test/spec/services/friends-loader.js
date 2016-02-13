'use strict';

describe('Service: friendsLoader', function () {

  // load the service's module
  beforeEach(module('frontEndApp'));

  // instantiate service
  var friendsLoader;
  beforeEach(inject(function (_friendsLoader_) {
    friendsLoader = _friendsLoader_;
  }));

  it('should do something', function () {
    expect(!!friendsLoader).toBe(true);
  });

});
