<?php
date_default_timezone_set('Europe/Warsaw');
require 'vendor/autoload.php';
require 'Slim/Slim.php';
require 'config/config.php';

define("JWT_SECRET","6c85c4049bf23fb031ba084a8b2ae31d00f1efdb");
define("JWTREFRESH_SECRET","a2cd4e033d41aa4077974f6664b655fb6e320b2c");

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$app->view(new \JsonApiView());

$app->add(new \JsonApiMiddleware());

$app->add(new \Slim\Middleware\JwtAuthentication([
    "secret" => JWT_SECRET,
    "secure" => false,
    "rules" => [
        new \Slim\Middleware\JwtAuthentication\RequestPathRule([
            //"path" => "/",
            "passthrough" => ["/users/login", "/users/me", "/"]
        ])
    ]]));



use Illuminate\Database\Capsule\Manager as Capsule;

$app->db = function () {
    return New Capsule;
};


$app->get('/', function () use ($app) {
    $app->render(200, array(
        'msg' => 'Człowieku, tutaj miłości nie znajdziesz...'
    ));
});


require 'routes/routes.php';