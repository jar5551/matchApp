'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.message
 * @description
 * # message
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
    .factory('message', function ($rootScope, $resource) {
        return $resource($rootScope.apiRoot + '/messages/:id' + '?t=' + (new Date()).getTime(), {id: '@id'}, {
            get: {
                isArray: true,
                transformResponse: function (data) {
                    return angular.fromJson(data).msg;
                }
            },
            query: {
                isArray: true,
                transformResponse: function (data) {
                    return angular.fromJson(data).msg;
                }
            },
            postMessage: {
                method: 'PUT'
            }
        });
    });
