'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:UserProfileCtrl
 * @description
 * # UserProfileCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('UserProfileCtrl', function ($scope, $routeParams, userData) {

    $scope.user = userData;
  });
