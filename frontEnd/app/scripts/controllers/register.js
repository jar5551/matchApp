'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:RegisterCtrl
 * @description
 * # RegisterCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('RegisterCtrl', function ($scope, notification, token) {
    $scope.data = {};

    $scope.login = function () {
      console.log($scope.data);
      if($scope.registerForm.$valid) {
        token.createAccount($scope.data).then(
          function(data) {
            token.login(data).then(
              function (data) {
                $location.path('/');
                $scope.credentials = {};
                notification.addNotification(data, false);
              },
              function (err) {
                console.log(err);
                notification.addNotification(err, true);
              }
            );
          },
          function(err) {
            notification.addNotification(err, true);
          }
        );

      }
    };
  });
