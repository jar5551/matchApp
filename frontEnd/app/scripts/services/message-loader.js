'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.messageLoader
 * @description
 * # messageLoader
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
    .factory('messageLoader', function ($q, $route, message) {
        return function () {
            var delay = $q.defer();

            message.get({id: $route.current.params.messageId}, function (response) {
                delay.resolve(response);
            }, function (error) {
                delay.reject(error.data.msg);
            });

            return delay.promise;
        };
    });
