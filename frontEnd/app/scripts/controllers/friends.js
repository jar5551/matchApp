'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:FriendsCtrl
 * @description
 * # FriendsCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('FriendsCtrl', function ($scope, friends) {
    $scope.friends = friends;

  });
