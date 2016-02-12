<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 27/01/16
 * Time: 23:48
 */

use src\models\Role;

$app->post('/roles/', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $role = new Role();

    $json = $app->request->getBody();
    $data = json_decode($json, true);

    $role->addRole($token, $data);

    $app->render(200, array(
        'msg' => 'Pomyślnie dodano nowe uprawienia'
    ));
});

$app->get('/roles/', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $role = new Role();

    $roles = $role->getRoles($token);

    $app->render(200, array(
        'msg' => $roles
    ));
});

$app->get('/roles/permisssions', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $role = new Role();

    $roles = $role->getAllPermissions($token);

    $app->render(200, array(
        'msg' => $roles
    ));
});

$app->get('/roles/:roleId', function ($roleId) use ($app) {
    $token = $app->request->headers("Authorization");

    $role = new Role();

    $roleData = $role->getRole($token, $roleId);

    $app->render(200, array(
        'msg' => $roleData
    ));
});

$app->delete('/roles/:roleId', function ($roleId) use ($app) {
    $token = $app->request->headers("Authorization");

    $role = new Role();

    $role->removeRole($token, $roleId);

    $app->render(200, array(
        'msg' => 'Pomyślnie usunięto uprawnienia'
    ));
});

$app->put('/roles/:roleId', function ($roleId) use ($app) {
    $token = $app->request->headers("Authorization");

    $role = new Role();

    $json = $app->request->getBody();
    $data = json_decode($json, true);

    $roleData = $role->updateRole($token, $roleId, $data);

    $app->render(200, array(
        'msg' => $roleData
    ));
});
