'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
    .controller('ContactCtrl', function ($rootScope, $scope, $http, $location, notification) {

        $scope.message = {};

        $scope.sendMessage = function () {

            if($scope.contactForm.$valid) {
                $http.post($rootScope.apiRoot + 'contact',  $scope.message).then(function successCallback(response) {
                    console.log(response);
                    notification.addNotification(response.data.msg, false);
                    $location.path('/');
                }, function errorCallback(error) {
                    notification.addNotification(error.data.msg, true);

                });

            } else {
                notification.addNotification('Porsze wypełnić wszystkie pola formularza', true);

            }

        };
    });
