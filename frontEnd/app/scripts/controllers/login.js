'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:LoginCtrl
 * @description
 * # LoginCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('LoginCtrl', function ($scope, $location, token, notification) {
    $scope.credentials = {};

    $scope.login = function () {
      console.log($scope.credentials);
      if($scope.loginForm.$valid) {
        token.login($scope.credentials).then(
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
      }
    };
  });
