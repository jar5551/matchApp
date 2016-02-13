<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 13/02/16
 * Time: 17:35
 */

namespace src\models;

use Illuminate\Database\Capsule\Manager as Capsule;

class Friend
{
  public function getMyFriends($token) {
    $user = new User();

    $userId = $user->getMeId($token);

    $friendsIdsArray = array();

    try {

      $friendsIds = Capsule::table('friends as f')
          ->select('userA', 'userB')
          ->where('userA', $userId)
          ->orWhere('userB', $userId)
          ->get();




    } catch (\Exception $e) {
      throw new \Exception('Wystąpił błąd przy pobieraniu przyjaciół');
    }

    foreach($friendsIds as $f) {
      if($f->userA == $userId) {
        array_push($friendsIdsArray, $f->userB);
      } else {
        array_push($friendsIdsArray, $f->userA);
      }
    }

    $friends = $user->getUsersByIds($friendsIdsArray);

    return $friends;

  }
}