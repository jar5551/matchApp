'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:NotificationsCtrl
 * @description
 * # NotificationsCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('NotificationsCtrl', function ($rootScope, $scope, $http, notification) {

    $scope.accept = function (e, index, id) {

      $http.get($rootScope.apiRoot + 'friends/accept/' + id).then(function successCallback(response) {
        notification.addNotification(response.data.msg, false);

        $scope.notifications.splice(index, 1);

      }, function errorCallback(error) {
        notification.addNotification(error.data.msg, true);
      });

      e.preventDefault();
    };

    $http.get($rootScope.apiRoot + 'notifications').then(function successCallback(response) {
      console.log(response.data.msg);
      $scope.notifications = response.data.msg;
    }, function errorCallback(error) {
      notification.addNotification(error.data.msg, true);

    });
  });
