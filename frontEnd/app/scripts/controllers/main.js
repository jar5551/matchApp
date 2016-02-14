'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('MainCtrl', function ($scope, token, notification, usersAllLoader) {
    $scope.logout = function (e) {
      token.logout();
      e.preventDefault();
    };

    $scope.user = token.getUser();

    if (!$scope.user.loggedIn) {
      console.log('aa');
      token.getMe().then(function (response) {

        token.setUser(response.name, true);

        $scope.user = token.getUser();
      }, function (error) {
        //notification.addNotification(error, true);
        token.logout();
      });
    }


    usersAllLoader().then(function (response) {
      $scope.allUsers = response;
    }, function (error) {
      notification.addNotification(error.data.msg, true);

    });

    /*token.getMe().then(function(response) {
     console.log(response);
     });*/


  });
