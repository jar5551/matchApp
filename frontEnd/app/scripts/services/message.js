'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.message
 * @description
 * # message
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('message', function () {
    // Service logic
    // ...

    var meaningOfLife = 42;

    // Public API here
    return {
      someMethod: function () {
        return meaningOfLife;
      }
    };
  });
