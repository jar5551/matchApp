'use strict';

/**
 * @ngdoc function
 * @name frontEndApp.controller:MessagesCtrl
 * @description
 * # MessagesCtrl
 * Controller of the frontEndApp
 */
angular.module('frontEndApp')
    .controller('MessagesCtrl', function ($scope, $location, messages) {

        $scope.goToConversation = function (id) {
            $location.path('/wiadomosci/' + id);
        };

        $scope.messages = messages;

        console.log($scope.messages);




    });
