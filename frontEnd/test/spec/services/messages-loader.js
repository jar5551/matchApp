'use strict';

describe('Service: messagesLoader', function () {

  // load the service's module
  beforeEach(module('frontEndApp'));

  // instantiate service
  var messagesLoader;
  beforeEach(inject(function (_messagesLoader_) {
    messagesLoader = _messagesLoader_;
  }));

  it('should do something', function () {
    expect(!!messagesLoader).toBe(true);
  });

});
