'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:UserEditCtrl
 * @description
 * # UserEditCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('UserEditCtrl', function ($scope, $location, userData, notification) {
    $scope.user = userData;

    $scope.editProfile = function () {
      $scope.user.$update(function(response) {
        notification.addNotification(response, false);
        $location.path('/');
      }, function(error) {
        notification.addNotification(error, false);
      });
    };
  });
