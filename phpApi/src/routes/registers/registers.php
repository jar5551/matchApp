<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 25.12.2015
 * Time: 18:16
 */

use src\models\Register as Register;

$app->get('/registers/', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    $registers = $register->getRegisters($token);

    $app->render(200, array(
        'msg' => $registers
    ));
});

$app->get('/registers/sell', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    $registers = $register->getSellBuyRegisters($token, 0);

    $app->render(200, array(
        'msg' => $registers
    ));
});

$app->get('/registers/buy', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    $registers = $register->getSellBuyRegisters($token, 1);

    $app->render(200, array(
        'msg' => $registers
    ));
});

$app->get('/registers/:id', function ($id) use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    $register = $register->getRegister($token, $id);

    if($register) {
        $app->render(200, array(
            'msg' => $register
        ));
    }

    $app->render(400, array(
        'msg' => 'Problem z pobraniem rejestru'
    ));
});

$app->post('/registers/', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    $json = $app->request->getBody();
    $data = json_decode($json, true);

    if($register->addRegister($token, $data)) {
        $app->render(200, array(
            'msg' => 'Nowy rejestr został pomyślnie dodany'
        ));
    }

    $app->render(400, array(
        'msg' => 'Problem z dodaniem rejestru'
    ));
});

$app->put('/registers/:id', function ($id) use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    $json = $app->request->getBody();
    $data = json_decode($json, true);

    if($register->updateRegister($token, $id, $data)) {
        $app->render(200, array(
            'msg' => 'Rejestr został pomyślnie zedytowany'
        ));
    }

    $app->render(400, array(
        'msg' => 'Problem z edycją rejestru'
    ));
});

$app->delete('/registers/:id', function ($id) use ($app) {
    $token = $app->request->headers("Authorization");

    $register = new Register();

    if($register->deleteRegister($token, $id)) {
        $app->render(200, array(
            'msg' => 'Rejestr został pomyślnie usunięty'
        ));
    }

    $app->render(400, array(
        'msg' => 'Problem z usunięciem rejestru'
    ));
});