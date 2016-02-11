'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:RegisterCtrl
 * @description
 * # RegisterCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
    .controller('RegisterCtrl', function ($scope, $location, notification, token) {
        $scope.data = {};

        $scope.register = function () {
            console.log($scope.data);
            token.createAccount($scope.data).then(
                function (response) {

                    console.log(response.data);

                    token.setLoginData(response.data.jwt, response.data.rto, response.data.user.name);

                    $location.path('/');
                    $scope.data = {};
                    notification.addNotification(response.data.msg, false);

                },
                function (err) {
                    notification.addNotification(err, true);
                }
            );

        };
    });
