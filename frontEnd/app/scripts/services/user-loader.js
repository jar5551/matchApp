'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.userLoader
 * @description
 * # userLoader
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('userLoader', function ($q, $route, user) {
    return function () {
      var delay = $q.defer();
      user.get({id: $route.current.params.userId}, function(response) {
        delay.resolve(response);
      }, function() {
        delay.reject('Nie można pobrać danych użytkownika o id ' + $route.current.params.userId);
      });
      return delay.promise;
    };
  });
