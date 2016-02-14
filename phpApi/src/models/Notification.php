<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 14/02/16
 * Time: 00:46
 */

namespace src\models;

use Illuminate\Database\Capsule\Manager as Capsule;

class Notification
{

  public function getNotifications($token)
  {
    $user = new User();

    $userId = $user->getMeId($token);

    $array = array();

    try {

      $notifications = Capsule::table('friendrequests')
          ->select('*')
          ->where('userTo', $userId)
          ->where('accepted', 0)
          ->get();

    } catch (\Exception $e) {
      throw new \Exception('Problem z probraniem wiadmości');
    }

    foreach ($notifications as $notification) {
      if ($notification->userFrom == $userId) {
        $notification->firstName = $user->getUser($notification->userTo, $token)->firstName;
      }

      array_push($array, $notification);
    }

    return $array;
  }
}