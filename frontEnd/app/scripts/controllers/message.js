'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:MessageCtrl
 * @description
 * # MessageCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
    .controller('MessageCtrl', function ($scope, $route, messageData, message, notification) {
        $scope.sendMessage = function () {

            message.postMessage({id: $route.current.params.messageId}, $scope.text.message, function(response) {
                notification.addNotification(response.data.msg, false);
            }, function (error) {
                notification.addNotification(error.data.msg, true);

            });
            console.log($scope.text.message);
        };

        $scope.text = {};


        $scope.message = messageData;
        console.log($scope.message);
    });
