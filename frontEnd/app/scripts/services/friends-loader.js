'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.friendsLoader
 * @description
 * # friendsLoader
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('friendsLoader', function ($q, friend) {
    return function () {
      var delay = $q.defer();

      friend.query(function (response) {
        delay.resolve(response);
      }, function (error) {
        delay.reject(error.data.msg);
      });

      return delay.promise;
    };
  });
