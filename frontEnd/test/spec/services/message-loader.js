'use strict';

describe('Service: messageLoader', function () {

  // load the service's module
  beforeEach(module('frontEndApp'));

  // instantiate service
  var messageLoader;
  beforeEach(inject(function (_messageLoader_) {
    messageLoader = _messageLoader_;
  }));

  it('should do something', function () {
    expect(!!messageLoader).toBe(true);
  });

});
