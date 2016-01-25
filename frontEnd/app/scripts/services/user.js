'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.user
 * @description
 * # user
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('user', function () {
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
