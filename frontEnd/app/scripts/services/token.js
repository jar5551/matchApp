'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.token
 * @description
 * # token
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('token', function ($rootScope, $http, $q, $cookies, $location, jwtHelper) {
    var user = {
        name: '',
        stanowisko: '',
        jednostki: [],
        loggedIn: false,

        setToken: function (token) {
          $cookies.put('id_token', token);
        },

        setRefreshToken: function (refreshToken) {
          $cookies.put('refresh_token', refreshToken);
        },

        getToken: function () {
          //return 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOiIxNDQ5NTMyOTk4IiwiZXhwIjoiMTQ0OTUzMzg5OCIsImp0aSI6IjU5YjE2MWE5ZTVhNTc0ZjhmZjdhNzliNDg2OWUzNzdlIiwic2NvcGUiOlsiYWRkOnVzZXJzIiwiZWRpdDp1c2VycyIsInJlbW92ZTp1c2VycyIsImFkZDp1bml0cyIsInJlbW92ZTp1bml0cyIsImVkaXQ6dW5pdHMiXX0.UyvoK-5N4A0X9L-AycA3PZdfbjlMsqgGWzDVj0A1OKI';
          var id_token = $cookies.get('id_token');

          return !id_token ? false : id_token;
          //return $cookies.get('id_token');
        },

        getRefreshToken: function () {
          return $cookies.get('refresh_token');
        },

        resetUser: function () {
          user.setUser('', '', [], false);
        },

        getUser: function () {
          if (!user.loggedIn) {
            user.getMe();
          }
          return user;
        },

        setUser: function (name, stanowisko, jednostki, loggedIn) {
          user.name = name;
          user.stanowisko = stanowisko;
          user.jednostki = jednostki;
          user.loggedIn = loggedIn;
        },

        getMe: function () {
          if (typeof user.getToken() !== 'undefined') {
            var deferred = $q.defer();
            $http.get($rootScope.apiRoot + '/users/me').then(function successCallback(response) {
              console.log(response);
              deferred.resolve(response.data.msg);

            }, function errorCallback(response) {
              deferred.reject(response.data.msg);
              //user.logout();
            });

            return deferred.promise;
          }
          return false;
        },

        getMeFullData: function () {
          var deferred = $q.defer();
          $http.get($rootScope.apiRoot + '/users/me-full-data' + '?t=' + (new Date()).getTime()).then(function successCallback(response) {
            deferred.resolve(response.data.msg);

          }, function errorCallback(response) {
            deferred.reject(response.data.msg);
            user.logout();
          });
          return deferred.promise;
        },

        validateToken: function () {
          var authToken = user.getToken();

          if (typeof authToken !== 'undefined') {

            if (!jwtHelper.isTokenExpired(authToken)) {
              return true;
            }
          }
          return false;
        },

        login: function (credentials) {
          var deferred = $q.defer();

          var config = {skipAuthorization: true};

          $http.post($rootScope.apiRoot + '/users/login', credentials, config).then(function successCallback(response) {
            //$cookies.put('id_token', response.data.jwt);

            console.log(response);
            user.setToken(response.data.jwt);
            user.setRefreshToken(response.data.rto);
            user.setUser(response.data.user.name, response.data.user.position, response.data.user.units, true);

            deferred.resolve('Witamy!');
          }, function errorCallback(response) {
            deferred.reject(response.data.msg);
          });

          return deferred.promise;
        },

        logout: function () {
          console.log('logout');
          $http.get($rootScope.apiRoot + '/users/logout');
          $cookies.remove('id_token');
          $cookies.remove('refresh_token');
          user.resetUser();
          $location.path('/');
        },

        changePassword: function (oldPass, newPass, repPass) {
          var data = {
            oldPass: oldPass,
            newPass: newPass,
            repPass: repPass
          };

          var deferred = $q.defer();

          $http.post($rootScope.apiRoot + '/users/me/change-password', data).then(function successCallback(response) {
            deferred.resolve('Hasło zostało zmienione');
          }, function errorCallback(response) {
            deferred.reject('Wystąpił problem ze zmianą hasła');
          });

          return deferred.promise;
        },

        getUserScope: function () {
          if (!user.getToken()) {
            return;
          }
          var scope = jwtHelper.decodeToken(user.getToken()).scope;
          var scopeArray = [];

          for (var i in scope) {
            scopeArray.push(scope[i].role);
          }

          return scopeArray;
        },

        createAccount: function (data) {
          var deferred = $q.defer();

          var config = {skipAuthorization: true};

          $http.post($rootScope.apiRoot + '/users/regiser', data, config).then(function successCallback(response) {
            deferred.resolve(response);
          }, function errorCallback(response) {
            deferred.reject(response.data.msg);
          });

          return deferred.promise;
        }
      }
      ;

    return user;
  });
