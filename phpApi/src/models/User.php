<?php

namespace src\models;

use Illuminate\Database\Capsule\Manager as Capsule;
use Firebase\JWT\JWT as JWT;

class User
{
  public function shortToken($longToken, $short = true)
  {
    if ($short) {
      return substr($longToken, 7);
    }
    return $longToken;
  }

  public function deny_access()
  {
    $res = $this->app->response();
    $res->status(401);
  }

  public function validateToken($token, $short = true)
  {
    if ($short) {
      $token = $this->shortToken($token);
    }

    $decoded = JWT::decode($token, JWT_SECRET, array('HS256'));
    if (strtotime('now') < (int)$decoded->exp) {
      $users = Capsule::table('users')->where('accessToken', $token)->count();
      if ($users == 1) {
        return true;
      }
    }
    return false;
  }

  public function passwordCrypt($password)
  {
    $options = [
        'cost' => 10,
        'salt' => mcrypt_create_iv(22, MCRYPT_DEV_URANDOM),
    ];

    $password = password_hash($password, PASSWORD_BCRYPT, $options);

    return $password;
  }

  public function isUserHasRole($token, $role)
  {

    if (!$this->validateToken($token)) {
      throw new \Exception("Brak uprawnień");
    }

    $token = $this->shortToken($token);

    try {
      $role = Capsule::table('users as u')
          ->select('*')
          ->join('rolestoranks as rr', 'u.rank', '=', 'rr.rank_id')
          ->join('roles as r', 'rr.role_id', '=', 'r.id')
          //->join('roles','users.id','=','roles.user_id')
          ->where('u.accessToken', $token)
          ->where('r.role', $role)
          ->count();

    } catch (\Exception $e) {
      throw new \Exception("Problem z uzyskaniem informacji o użytkowniku");
    }

    if ($role > 0) {
      return true;
    }

    return false;
  }

  public function updateToken($email)
  {

    try {

      $roles = Capsule::table('users as u')
          ->select('r.name')
          ->join('rolestouser as rtr', 'u.id', '=', 'rtr.user_id')
          ->join('roles as r', 'rtr.role_id', '=', 'r.id')
          ->where('u.email', $email)
          ->get();

    } catch (\Exception $e) {
      throw new \Exception("Error Processing Request");
    }

    $tokenCfg = array(
        'iat' => strtotime('now'),
        'exp' => strtotime('+ 2 hours'),
        'refreshExp' => strtotime('+ 2 hours'),
        'jti' => md5(uniqid($email, true))
    );

    $tokens = array(
        'accessToken' => array(
            'iat' => (string)$tokenCfg['iat'],
            'exp' => (string)$tokenCfg['exp'],
            'jti' => $tokenCfg['jti'],
            'scope' => $roles
        ),
        'refreshToken' => array(
            'iat' => (string)$tokenCfg['iat'],
            'exp' => (string)$tokenCfg['refreshExp'],
            'jti' => md5(uniqid(strtotime('now'), true)),
        )
    );

    $jwt = JWT::encode($tokens['accessToken'], JWT_SECRET);
    $refreshToken = JWT::encode($tokens['refreshToken'], JWTREFRESH_SECRET);

    //return $email;

    try {
      Capsule::table('users')
          ->where('email', $email)
          ->update([
              'accessToken' => $jwt,
              'refreshToken' => $refreshToken,
          ]);
    } catch (\Exception $e) {
      throw new \Exception("Error Processing Request");
    }

    $return = array(
        'jwt' => $jwt,
        'refreshToken' => $refreshToken
    );

    return $return;
  }

  public function refreshToken($refreshToken)
  {
    $decoded = JWT::decode($refreshToken, JWTREFRESH_SECRET, array('HS256'));
    if (strtotime('now') > (int)$decoded->exp) {
      throw new \Exception("Nieważny token");
    }
    try {
      $user = Capsule::table('users')
          ->select('*')
          ->where('refreshToken', $refreshToken)
          ->first();

      //return $user->email;
      return $this->updateToken($user->email);

    } catch (\Exception $e) {
      throw new \Exception("Error Processing Request");
    }

    return false;
  }

  public function getAllUsers($token)
  {

    try {
      $users = Capsule::table('users')
          ->select('id', 'firstName')
          ->get();
    } catch (\Exception $e) {
      throw new \Exception("Problem z pobraniem użytkowników");
    }

    return $users;
  }


  public function getUser($id, $token)
  {

    $user = new User();


    try {
      $user = Capsule::table('users as u')
          ->select('id', 'firstName')
          ->where('u.id', $id)
          ->first();


    } catch (\Exception $e) {
      throw new \Exception("Problem z pobraniem użytkownika");
    }

    if($this->isUserMyFriend($id, $token)) {
      $user->friend = true;
    } else {
      $user->friend = false;
    }

    if($this->getMeId($token) == $id) {
      $user->me = true;
    } else {
      $user->me = false;
    }

    return $user;
  }

  public function addUser($token, $email, $password, $personalInfo)
  {

    if (!$this->isUserHasRole($token, 'add:all:users')) {
      throw new \Exception("Brak uprawnień");
    }
    try {

      if (Capsule::table('users')->select('email')->where('email', $email)->count() > 0) {
        return false;
      }

      $password = $this->passwordCrypt($password);

      $user = Capsule::table('users')->insertGetId(
          [
              'email' => $email,
              'password' => $password['password'],
              'salt' => $password['salt'],
              'active' => 1,
              'firstName' => isset($personalInfo['firstName']) ? $personalInfo['firstName'] : '',
              'lastName' => isset($personalInfo['lastName']) ? $personalInfo['lastName'] : '',
              'position' => isset($personalInfo['position']) ? $personalInfo['position'] : '',
              'rank' => $personalInfo['rank'],
              'created' => date("Y-m-d H:i:s")
          ]
      );

      $units = $personalInfo['units'];
      $unitsArray = array();

      foreach ($units as $unit) {
        $unitsArray[] = array('user_id' => $user, 'unit_id' => $unit['id']);
      }

      Capsule::table('usertounit')->insert($unitsArray);

    } catch (\Exception $e) {
      throw new \Exception("Problem z dodaniem użytkownika");
    }

    return true;
  }

  public function updateUser($token, $id, $data)
  {

    if (!$this->isUserHasRole($token, 'update:all:users')) {
      if ($this->getMeId($token) != $id) {
        throw new \Exception("Brak uprawnień");
      }
    }

    $array = array();

    $array['modified'] = date("Y-m-d H:i:s");

    if (isset($data['email']) && !empty($data['email'])) {
      $array['email'] = $data['email'];
    }
    if (isset($data['active']) && !empty($data['email'])) {
      $array['active'] = $data['active'];
    }
    if (isset($data['firstName'])) {
      $array['firstName'] = $data['firstName'];
    }
    if (isset($data['lastName'])) {
      $array['lastName'] = $data['lastName'];
    }
    if (isset($data['position'])) {
      $array['position'] = $data['position'];
    }
    if (isset($data['password']) && !empty($data['password'])) {
      $password = $this->passwordCrypt($data['password']);
      $array['password'] = $password['password'];
      $array['salt'] = $password['salt'];
    }

    if (isset($data['rank']) && !empty($data['rank'])) {
      $array['rank'] = $data['rank'];
    }

    $units = $data['units'];
    $unitsArray = array();

    foreach ($units as $unit) {
      $unitsArray[] = array('user_id' => $id, 'unit_id' => $unit['id']);
    }

    try {
      Capsule::table('usertounit')->where('user_id', $id)->delete();
      Capsule::table('usertounit')->insert($unitsArray);

    } catch (\Exception $e) {
      throw new \Exception("Problem z wyedytowaniem jednostki użytkownika");
    }

    try {

      Capsule::table('users')
          ->where('id', $id)
          ->update($array);

    } catch (\Exception $e) {
      throw new \Exception("Problem z wyedytowaniem użytkownika");
    }

    return true;
  }

  public function removeUser($token, $id)
  {
    if (!$this->isUserHasRole($token, 'delete:all:users')) {
      throw new \Exception("Brak uprawnień");
    }

    if (!$this->getUserById($id)) {
      throw new \Exception("Nie ma takiego użytkownika");
    }

    try {
      Capsule::table('users')
          ->where('id', $id)
          ->delete();

    } catch (\Exception $e) {
      throw new \Exception("Problem z usunięciem użytkownika");
    }

    return true;
  }

  public function login($email, $password)
  {

    try {
      $user = Capsule::table('users')->select('email', 'password')->where('email', $email)->first();
    } catch (\Exception $e) {
      throw new \Exception("Error Processing Requesta");
    }

    if ($user && password_verify($password, $user->password)) {
      $jwt = $this->updateToken($email);
      return $jwt;
    } else {
      throw new \Exception("Niepoprawne dane logowania");
    }

    return false;
  }

  public function register($data)
  {
    if (!$this->isUniqueUser($data['email'])) {
      throw new \Exception("Już istnieje użytkwonik w naszej bazie zarejestrowany na podany adres email");
    }

    try {

      Capsule::table('users')
          ->insert([
              'email' => $data['email'],
              'password' => $this->passwordCrypt($data['password1']),
              'firstName' => $data['name'],
              'sex' => $data['sex'],
              'createdDate' => date("Y-m-d H:i:s")
          ]);

    } catch (\Exception $e) {
      throw new \Exception("Error Processing Request");
    }

    $jwt = $this->updateToken($data['email']);

    return $jwt;

  }

  public function logout($token)
  {

    if (!$this->validateToken($token)) {
      throw new \Exception('Nie jesteś zalogowany');
    } else {
      try {
        Capsule::table('users')
            ->where('users.accessToken', $token)
            ->update([
                'users.accessToken' => null,
                'users.accessTokenExpire' => null
            ]);
      } catch (\Exception $e) {
        throw new \Exception('Problem z wylogowaniem');
      }
    }

    return true;
  }

  public function me($token, $short = true)
  {

    if ($this->validateToken($token, $short)) {

      try {
        $user = Capsule::table('users')
            ->select('users.*')
            ->where('accessToken', $this->shortToken($token, $short))
            //->where('active', 1)
            ->first();

      } catch (\Exception $e) {
        throw new \Exception("Problem z uzyskaniem informacji o użytkowniku");
      }

      $userData = array(
          'name' => $user->firstName
      );
      return $userData;
    }

    return false;
  }

  public function getMeFullData($token)
  {
    if ($this->validateToken($token)) {
      try {
        $user = Capsule::table('users')
            ->select('*')
            ->where('accessToken', $this->shortToken($token))
            ->first();

      } catch (\Exception $e) {
        throw new \Exception("Problem z uzyskaniem informacji o użytkowniku");
      }
    }

    return $user;
  }

  public function updateMeFullData($token, $data)
  {
    if ($this->validateToken($token)) {
      try {
        Capsule::table('users')
            ->where('accessToken', $this->shortToken($token))
            ->update([
                'email' => $data['email'],
                'firstName' => $data['firstName'],
            ]);

        return true;
      } catch (\Exception $e) {
        throw new \Exception("Problem z uzyskaniem informacji o użytkowniku");
      }
    }
    return false;
  }

  public function changePassword($token, $oldPass, $newPass, $repPas)
  {

    if ($newPass !== $repPas) {
      throw new \Exception("Podane hasła różnią się");
    }
    if ($this->validateToken($token)) {

      try {
        $user = Capsule::table('users')
            ->select('password')
            ->where('accessToken', $this->shortToken($token))
            ->first();

      } catch (\Exception $e) {
        throw new \Exception("Error Processing Request");
      }

      if ($user && password_verify($oldPass, $user->password)) {

        $password = $this->passwordCrypt($newPass);

        try {
          Capsule::table('users')
              ->where('accessToken', $this->shortToken($token))
              ->update([
                  'password' => $password['password'],
                  'salt' => $password['salt'],
                  'modified' => date("Y-m-d H:i:s")
              ]);

        } catch (\Exception $e) {
          throw new \Exception("Error Processing Request");
        }

        return true;
      } else {
        throw new \Exception("Podane bieżące hasło nie jest prawidłowe");
      }

      return false;
    }
  }

  public function getUserUnits($id)
  {

    try {
      $units = Capsule::table('usertounit')
          ->select('units.id as id', 'units.name as name')
          ->join('units', 'usertounit.unit_id', '=', 'units.id')
          ->where('usertounit.user_id', $id)
          ->get();
    } catch (\Exception $e) {
      throw new \Exception('Nie udało się pobrać jednostek użytkownika');
    }

    return $units;
  }

  public function isUserBelongsToUnit($userId, $unitId)
  {

    try {
      $units = Capsule::table('usertounit')
          ->select('user_id', 'unit_id')
          ->where('user_id', $userId)
          ->where('unit_id', $unitId)
          ->count();

    } catch (\Exception $e) {
      throw new \Exception('Problem z wykonaniem polecenia');
    }

    if ($units > 0) {
      return true;
    }

    return false;

  }

  /*public function getUserDocuments($id) {
      //TODO

      try {
          $documents = Capsule::table('documents')
              ->select('id', 'created', 'contractorName', 'contractorAddress')
              ->where('user_id', $id)
              ->get();
      } catch (\Exception $e) {
          throw new \Exception('Nie udało się pobrać faktur użytkownika');
      }

      return $documents;
  }*/

  private function getUserById($id)
  {
    try {
      $user = Capsule::table('users')
          ->select('*')
          ->where('id', $id)
          ->first();
    } catch (\Exception $e) {
      throw new \Exception('Nie takiego użytkownika');
    }

    return $user;
  }

  public function getMeId($token)
  {
    if ($this->validateToken($token)) {
      try {
        $user = Capsule::table('users')
            ->select('*')
            ->where('accessToken', $this->shortToken($token))
            ->first();

      } catch (\Exception $e) {
        throw new \Exception("Problem z uzyskaniem informacji o użytkowniku");
      };

      return intval($user->id);
    }

    return false;
  }

  public function getNumberOfUserDocuments($id)
  {
    try {
      $documents = Capsule::table('registerspositions')
          ->select('*')
          ->where('user_id', $id)
          ->count();
    } catch (\Exception $e) {
      throw new \Exception('Nie udało się pobrać faktur użytkownika');
    }

    return $documents;
  }

  private function isUniqueUser($email)
  {
    try {
      $uniqueUser = Capsule::table('users')
          ->select('email')
          ->where('email', $email)
          ->count();

    } catch (\Exception $e) {
      throw new \Exception("Problem z uzyskaniem informacji o użytkowniku");
    }

    return $uniqueUser == 0;
  }

  public function getUsersByIds($array)
  {
    try {
      $users = Capsule::table('users')
          ->select('id', 'firstName')
          ->whereIn('id', $array)
          ->get();

    } catch (\Exception $e) {
      throw new \Exception("Problem z pobraniem użytkowników");
    }

    return $users;
  }

  public function isUserMyFriend($id, $token) {
    $meId = $this->getMeId($token);

    try {

      $userA = Capsule::table('friends')
          ->select('*')
          ->where('userA', $meId)
          ->where('userB', $id)
          ->count();

      $userB = Capsule::table('friends')
          ->select('*')
          ->where('userA', $id)
          ->where('userB', $meId)
          ->count();


    } catch (\Exception $e) {
      throw new \Exception("Problem z pobraniem użytkowników");
    }

    return $userA + $userB > 0;

  }

}