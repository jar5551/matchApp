'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:UserMyProfileCtrl
 * @description
 * # UserMyProfileCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('UserMyProfileCtrl', function ($scope, userData) {

    $scope.user = userData;

    $scope.user.me = true;

    console.log($scope.user);
  });
