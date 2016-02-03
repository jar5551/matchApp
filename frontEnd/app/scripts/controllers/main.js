'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
  .controller('MainCtrl', function ($scope, token, notification) {
    $scope.logout = function () {
      token.logout();
    };

    $scope.user = token.getUser();

    if (!$scope.user.loggedIn) {
      console.log('aa');
      token.getMe().then(function (response) {

        token.setUser(response.name, response.position, response.units, true);

        $scope.user = token.getUser();
      }, function (error) {
        notification.addNotification(error.data.msg, true);
        token.logout();
      });
    }


    /*token.getMe().then(function(response) {
     console.log(response);
     });*/


  });
