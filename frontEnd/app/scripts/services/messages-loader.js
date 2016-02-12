'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.messagesLoader
 * @description
 * # messagesLoader
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('messagesLoader', function ($q, message) {
      return function () {
          var delay = $q.defer();

          message.query(function(response) {
              delay.resolve(response);
          }, function(error) {
              delay.reject(error.data.msg);
          });

          return delay.promise;
      };
  });
