<?php

use src\models\User as User;

$app->get('/users/', function () use ($app) {
    $user = new User();

    $token = $app->request->headers("Authorization");

    $users = $user->getAllUsers($token);

    $app->render(200, array(
        'msg' => $users
    ));
});

/* utworz uzytkownika */
$app->post('/users/', function () use ($app) {
    /* przykladowy json
    {
        "email":"test@test.pl",
        "password":"test"
    }
    */
    $token = $app->request->headers("Authorization");

    $user = new User();
    $json = $app->request->getBody();
    $data = json_decode($json, true);

    if(isset($data['personalInfo'])) {
        $personalInfo = $data['personalInfo'];
    } else {
        $personalInfo = [];
    }

    if($user->addUser($token, $data['email'], $data['password'], $personalInfo)) {
        $app->render(201, array(
            'msg' => 'Pomyślnie dodano użytkownika'
        ));
    }

    $app->render(409, array(
        'error' => true,
        'msg' => 'Już istnieje użytkownik o takim adresie email'
    ));
});

// Refresh tokena

$app->post('/users/delegation', function () use ($app) {
    $user = new User();

    $json = $app->request->getBody();
    $data = json_decode($json, true);

    $refreshToken = $data['refresh_token'];

    if($data['grant_type'] == 'refresh_token' && !empty($refreshToken)) {


        $refresh = $user->refreshToken($refreshToken);

        $app->render(200, array(
            'msg' => $refresh
            //'msg' => 'Brak uprawnień'
        ));
    }

    $app->render(400, array(
        'msg' => 'Wysąpił błąd'
        //'msg' => 'Brak uprawnień'
    ));
});

$app->post('/users/login', function () use ($app) {

    /* przykladowy json
    {
        "email":"test@test.pl",
        "password":"test"
    }
    */

    $json = $app->request->getBody();
    $data = json_decode($json, true);

    if(!isset($data['email']) || !$data['email']) {
        $app->render(400, array(
            'msg' => 'Proszę podać adres email'
        ));
    }

    if(!isset($data['password']) || !$data['password']) {
        $app->render(400, array(
            'msg' => 'Proszę wpisać hasło'
        ));
    }

    $user = new User();

    $login = $user->login($data['email'], $data['password']);

    $userData = $user->me($login['jwt'], false);

    if($login) {
        $app->render(200, array(
            'msg' => 'Zalogowano poprawnie',
            'jwt' => $login['jwt'],
            'rto' => $login['refreshToken'],
            'user' => $userData
        ));
    } else {
        $app->render(401, array(
            'msg' => 'Nieporawne dane logowania'
        ));
    }
});

$app->post('/users/register', function () use ($app) {
    $json = $app->request->getBody();
    $data = json_decode($json, true);

    if(!isset($data['email']) || !$data['email'] || !isset($data['password1']) || !$data['password1'] || !isset($data['password2']) || !$data['password2'] || !isset($data['name']) || !$data['name'] || !isset($data['sex'])) {
        $app->render(400, array(
            'msg' => 'Proszę podać dane niezbędne do utworzenia nowego konta'
        ));
    }

    if($data['password1'] !== $data['password2']) {
        $app->render(400, array(
            'msg' => 'Podane hasła nie są zgodne'
        ));
    }

    $user = new User();

    $register = $user->register($data);
    $userData = $user->me($register['jwt'], false);

    $app->render(200, array(
        'msg' => 'Zalogowano poprawnie',
        'jwt' => $register['jwt'],
        'rto' => $register['refreshToken'],
        'user' => $userData
    ));
    $app->render(200, array(
        'msg' => $register
    ));

});

/* biezacy uzytkownik */

$app->get('/users/me', function () use ($app) {

    $user = new User();

    $token = $app->request->headers("Authorization");

    if($user->me($token)) {
        $app->render(200, array(
            'msg' => $user->me($token)
            //'msg' => $user->getUserById(7)
        ));
    }

    $app->render(400, array(
        'msg' => 'Nie można pobrać danych użytkownika'
        //'msg' => $user->getUserById(7)
    ));
});

$app->get('/users/me-full-data', function () use ($app) {

    $user = new User();

    $token = $app->request->headers("Authorization");

    $app->render(200, array(
        'msg' => $user->getMeFullData($token)
    ));
});

$app->post('/users/me-full-data', function () use ($app) {

    $token = $app->request->headers("Authorization");
    $json = $app->request->getBody();
    $data = json_decode($json, true);

    $user = new User();

    if($user->updateMeFullData($token, $data)) {
        $app->render(200, array(
            'msg' => 'Pomyślnie zedytowano dane'
        ));
    }

    $app->render(401, array(
        'msg' => 'Coś poszło nie tak'
    ));
});

/* wyloguj */

$app->get('/users/logout', function () use ($app) {
    $user = new User();

    $token = $app->request->headers("Authorization");

    $app->render(200, array(
        'msg' =>$user->logout($token)
    ));
});

/* zmiana hasla */

$app->post('/users/me/change-password', function () use ($app) {
    $token = $app->request->headers("Authorization");
    $json = $app->request->getBody();
    $data = json_decode($json, true);

    $user = new User();

    if($user->changePassword($token, $data['oldPass'], $data['newPass'], $data['repPass'])) {
        $app->render(200, array(
            'msg' => 'Hasło zostało zmienione'
        ));
    }

    $app->render(401, array(
        'msg' => 'Coś poszło nie tak'
    ));
});


$app->get('/users/:user_id', function ($user_id) use ($app) {

    $token = $app->request->headers("Authorization");

    $user = new User();

    $userData = $user->getUser($user_id, $token);

    $app->render(200, array(
        'msg' => $userData
    ));
});

/* edytuj uzytkownika */
$app->put('/users/:user_id', function ($user_id) use ($app) {

    $token = $app->request->headers("Authorization");

    $user = new User();
    $json = $app->request->getBody();
    $data = json_decode($json, true);


    if($user->updateUser($token, $user_id, $data)) {
        $app->render(200, array(
            'msg' => 'Pomyślnie wyedytowano użytkownika'
        ));
    }

    $app->render(400, array(
        'error' => true,
        'msg' => 'Wystąpił problem z edycją użytkownika'
    ));
});

/* usun uzytkownika */
$app->delete('/users/:user_id', function ($user_id) use ($app) {

    $token = $app->request->headers("Authorization");

    $user = new User();

    if($user->removeUser($token, $user_id)) {
        $app->render(200, array(
            'msg' => 'Użytkownik został pomyślnie usunięty z systemu'
        ));
    }

    $app->render(400, array(
        'error' => true,
        'msg' => 'Wystąpił problem z usuwaniem użytkownika'
    ));
});