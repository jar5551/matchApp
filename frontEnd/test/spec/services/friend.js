'use strict';

describe('Service: friend', function () {

  // load the service's module
  beforeEach(module('frontEndApp'));

  // instantiate service
  var friend;
  beforeEach(inject(function (_friend_) {
    friend = _friend_;
  }));

  it('should do something', function () {
    expect(!!friend).toBe(true);
  });

});
