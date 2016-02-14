'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.usersAllLoader
 * @description
 * # usersAllLoader
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('usersAllLoader', function ($q, user) {
    return function () {
      var delay = $q.defer();
      user.query(function(response) {
        delay.resolve(response);
      }, function() {
        delay.reject('Nie można pobrać danych użytkowników');
      });
      return delay.promise;
    };
  });
