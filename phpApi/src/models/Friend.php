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
  public function getMyFriends($token)
  {
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

    foreach ($friendsIds as $f) {
      if ($f->userA == $userId) {
        array_push($friendsIdsArray, $f->userB);
      } else {
        array_push($friendsIdsArray, $f->userA);
      }
    }

    $friends = $user->getUsersByIds($friendsIdsArray);

    return $friends;
  }


  public function addFriend($token, $userId)
  {

    $user = new User();

    $meId = $user->getMeId($token);

    if ($user->isUserMyFriend($userId, $token)) {
      throw new \Exception('Ten użytkownik już jest kręgach Twoich znajomych');
    }

    if ($this->friendRequestSend($meId, $userId)) {
      throw new \Exception('Już wysłałeś zaproszenie do znajomych dla tego użytkownika');
    }

    try {

      $friendData = Capsule::table('users')
          ->select('firstName')
          ->where('id', $userId)
          ->first();

      Capsule::table('friendrequests')
          ->insert(
              array(
                  'userFrom' => $meId,
                  'userTo' => $userId,
                  'accepted' => 0,
                  'date' => date("Y-m-d H:i:s"))
          );

    } catch (\Exception $e) {
      throw new \Exception('Wystąpił błąd przy pobieraniu przyjaciół');
    }

    return $friendData->firstName;

  }

  private function friendRequestSend($meId, $userId)
  {

    try {

      $isReqest = Capsule::table('friendrequests')
          ->select('*')
          ->where('userFrom', $meId)
          ->where('userTo', $userId)
          ->count();

    } catch (\Exception $e) {
      throw new \Exception('Wystąpił błąd przy pobieraniu przyjaciół');
    }

    return $isReqest > 0;

  }

  public function acceptFriendRequest($token, $requestId)
  {

    $user = new User();

    $meId = $user->getMeId($token);

    try {

      $requestData = Capsule::table('friendrequests')
          ->select('userFrom', 'userTo')
          ->where('id', $requestId)
          ->first();

      if ($requestData->userFrom == $meId) {
        $newFriendId = $requestData->userTo;
      } else {
        $newFriendId = $requestData->userFrom;
      }
    } catch (\Exception $e) {
      throw new \Exception('Wystąpił błąd przy pobieraniu przyjaciół');
    }

    if($user->isUserMyFriend($newFriendId, $token)) {
      throw new \Exception('Ten użytkownik jest już Twoim znajomym');

    }

    try {

      Capsule::table('friendrequests')
          ->where('id', $requestId)
          ->where('userFrom', $meId)
          ->orWhere('userTo', $meId)
          ->where('accepted', 0)
          ->update(array(
              'accepted' => 1
          ));

      Capsule::table('friends')
          ->insert(array(
              'userA' => $meId,
              'userB' => $newFriendId
          ));

    } catch (\Exception $e) {
      throw new \Exception('Wystąpił błąd przy pobieraniu przyjaciół');
    }

    $newFriendData = $user->getUser($newFriendId, $token);

    return $newFriendData;
  }
}