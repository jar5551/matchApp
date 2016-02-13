<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 13/02/16
 * Time: 17:34
 */

use src\models\Friend;

$app->get('/fiends/', function () use ($app) {

  $token = $app->request->headers("Authorization");


  $friend = new Friend();

  $friends = $friend->getMyFriends($token);

  $app->render(200, array(
      'msg' => $friends
  ));
});