'use strict';

describe('Service: usersAllLoader', function () {

  // load the service's module
  beforeEach(module('frontEndApp'));

  // instantiate service
  var usersAllLoader;
  beforeEach(inject(function (_usersAllLoader_) {
    usersAllLoader = _usersAllLoader_;
  }));

  it('should do something', function () {
    expect(!!usersAllLoader).toBe(true);
  });

});
