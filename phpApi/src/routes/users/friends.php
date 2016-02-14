<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 13/02/16
 * Time: 17:34
 */

use src\models\Friend;

$app->get('/friends/', function () use ($app) {

  $token = $app->request->headers("Authorization");


  $friend = new Friend();

  $friends = $friend->getMyFriends($token);

  $app->render(200, array(
      'msg' => $friends
  ));
});

$app->get('/friends/add/:userId', function ($userId) use ($app) {
  $token = $app->request->headers("Authorization");

  $friend = new Friend();

  $newFriend = $friend->addFriend($token, $userId);

  $app->render(200, array(
      'msg' => 'Zostało wysłane powiadomienie do użytkownika ' . $newFriend . ' o chęci nawiązania znajomości'
  ));

});

$app->get('/friends/accept/:requestId', function ($requestId) use ($app) {
  $token = $app->request->headers("Authorization");

  $friend = new Friend();

  $user = $friend->acceptFriendRequest($token, $requestId);

  /*$app->render(200, array(
      'msg' => 'Zaakecptowano zaproszenie do znajomości od ' . $user->fristName,
      'userId' => $user->id
  ));*/
  $app->render(200, array(
      'msg' => 'Zaproszenie zostało zaakceptowane'
  ));
});