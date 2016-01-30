'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.userMeLoader
 * @description
 * # userMeLoader
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('userMeLoader', function ($q, user) {
    return function () {
      var delay = $q.defer();
      user.getMe(function(response) {
        delay.resolve(response);
      }, function() {
        delay.reject('Nie można pobrać danych Twojego użytkownika');
      });
      return delay.promise;
    };
  });
