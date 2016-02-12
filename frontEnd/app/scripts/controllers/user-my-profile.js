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
    /*$scope.user = {
      name: 'Jan Kowalski',
      me: true,
      image: 'images/jan-kowalski.jpg',
      work: 'Student Prawa',
      description: 'Szukam partnerki na dłuże, może do końca życia... albo i dłużej',
      attributes: [
        'komunikatywny',
        'student',
        'wysoki'
      ]
    };*/

    $scope.user = userData;

    console.log($scope.user);
  });
