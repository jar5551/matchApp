'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.friend
 * @description
 * # friend
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('friend', function ($rootScope, $resource) {
    return $resource($rootScope.apiRoot + 'friends/:id' + '?t=' + (new Date()).getTime(), {id: '@id'}, {
      get: {
        transformResponse: function (data) {
          return angular.fromJson(data).msg;
        }
      },
      query: {
        isArray: true,
        transformResponse: function (data) {
          return angular.fromJson(data).msg;
        }
      }
    });
  });
