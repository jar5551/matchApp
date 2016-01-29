'use strict';

/**
 * @ngdoc overview
 * @name frontEndApp
 * @description
 * # frontEndApp
 *
 * Main module of the application.
 */
angular
  .module('frontEndApp', [
    'ngAnimate',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'angular-jwt'
  ])
  .config(function ($routeProvider, $httpProvider, jwtInterceptorProvider) {

    jwtInterceptorProvider.tokenGetter = ['$rootScope', 'jwtHelper', '$http', 'token', function($rootScope, jwtHelper, $http, token) {
      var idToken = token.getToken();
      var refreshToken = token.getRefreshToken();
      if (idToken && jwtHelper.isTokenExpired(idToken)) {
        // This is a promise of a JWT id_token
        return $http({
          url: $rootScope.apiRoot + '/users/delegation',
          // This makes it so that this request doesn't send the JWT
          skipAuthorization: true,
          method: 'POST',
          data: {
            grant_type: 'refresh_token',
            refresh_token: refreshToken
          }
        }).then(function(response) {
          var id_token = response.data.msg.jwt;
          token.setToken(id_token);
          token.setRefreshToken(response.data.msg.refreshToken);

          console.log(id_token);

          //localStorage.setItem('id_token', id_token);
          //token.setToken(id_token);
          return id_token;
        }, function(error) {
          console.log(error);
        });
      } else {
        return idToken;
      }

      return idToken;

    }];
    $httpProvider.interceptors.push('jwtInterceptor');

    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
      })
      .when('/logowanie', {
        templateUrl: 'views/auth/login.html',
        controller: 'LoginCtrl'
      })
      .when('/rejestracja', {
        templateUrl: 'views/auth/register.html',
        controller: 'RegisterCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  })
  .run(function ($rootScope) {
    $rootScope.apiRoot = 'api';
  })
;
