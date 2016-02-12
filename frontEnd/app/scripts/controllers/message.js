'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:MessageCtrl
 * @description
 * # MessageCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
    .controller('MessageCtrl', function ($scope, $route, $interval, token, message, notification) {


        $scope.refresh = function() {

            message.get({id: $route.current.params.messageId}, function (response) {

                if(response != $scope.message) {
                    console.log('update wiadomości');
                    $scope.message = response;
                }
            }, function (error) {
                notification.addNotification(error.data.msg, true);
            });
        };

        $scope.intervalPromise = $interval(function(){
            $scope.refresh();
        }, 10000);


        var resetMessageInput = function () {
            $scope.text = {};

        };

        $scope.sendMessage = function () {

            message.postMessage({id: $route.current.params.messageId}, $scope.text, function(response) {
                console.log(response);
                $scope.message.push({firstName: token.getUser().name, userId: response.message.userId, message: response.message.message, dateSend: response.message.dateSend});
                resetMessageInput();
                notification.addNotification(response.msg, false);
            }, function (error) {
                notification.addNotification(error.data.msg, true);

            });
        };

        $scope.refresh();
        resetMessageInput();

    });
