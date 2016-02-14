'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:UserProfileCtrl
 * @description
 * # UserProfileCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('UserProfileCtrl', function ($rootScope, $scope, $location, $routeParams, $http, userData, message, notification) {

    $scope.user = userData;

    $scope.addFriend = function () {
      $http.get($rootScope.apiRoot + 'friends/add/' + $scope.user.id).then(function successCallback(response) {
        notification.addNotification(response.data.msg, false);
        $location.path('/');
      }, function errorCallback(error) {
        notification.addNotification(error.data.msg, true);

      });
    };

    $scope.chat = function () {
      $http.get($rootScope.apiRoot + 'messages/new-topic/' + $scope.user.id).then(function successCallback(response) {
        $location.path('/wiadomosci/' + response.data.msg);
      }, function errorCallback(error) {
        notification.addNotification(error.data.msg, true);
      });
    };

    if($scope.user.me) {
      $location.path('/uzytkownicy/moj-profil')
    }

  });
