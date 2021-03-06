'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.user
 * @description
 * # user
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('user', function ($rootScope, $resource) {
    return $resource($rootScope.apiRoot + 'users/:id' + '?t=' + (new Date()).getTime(), {id: '@id'}, {
      get: {
        transformResponse: function(data) {
          return angular.fromJson(data).msg;
        }
      },
      getMe: {
        url: $rootScope.apiRoot + 'users/me-full-data',
        method: 'GET',
        transformResponse: function(data) {
          return angular.fromJson(data).msg;
        }
      },
      query: {
        isArray: true,
        transformResponse: function(data) {
          return angular.fromJson(data).msg;
        }
      },
      update: {
        method: 'PUT'
      }
    });
  });
