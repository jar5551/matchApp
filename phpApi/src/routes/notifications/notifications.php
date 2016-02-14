<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 14/02/16
 * Time: 00:46
 */

use src\models\Notification;

$app->get('/notifications/', function () use ($app) {
  $token = $app->request->headers("Authorization");

  $notification = new Notification();

  $notifications = $notification->getNotifications($token);

  $app->render(200, array(
      'msg' => $notifications
  ));
});