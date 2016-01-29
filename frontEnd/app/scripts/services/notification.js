'use strict';

/**
 * @ngdoc service
 * @name frontEndApp.notification
 * @description
 * # notification
 * Factory in the frontEndApp.
 */
angular.module('frontEndApp')
  .factory('notification', function () {
    var notifications = [];

    var notification = {
      getNotifications: function () {
        return notifications;
      },
      addNotification: function (message, error) {
        notifications.push({msg: message, error: error});
        notification.showFx(notifications[notifications.length - 1].msg, notifications[notifications.length - 1].error);
      },
      showFx: function (message, error) {
        var nsBox = $('.ns-box');
        var bottom = 30;


        nsBox.each(function (index) {
          var height = $(this).outerHeight();
          $(this).css('bottom', (index+1) * (height + 10) + bottom);
        });

        var notification = new NotificationFx({
          message: '<p>' + message + '</p>',
          layout: 'growl',
          effect: 'scale',
          type: error ? 'error' : 'success', // notice, warning, error or success

        });

        notification.show();
      }
    };

    return notification
  });
