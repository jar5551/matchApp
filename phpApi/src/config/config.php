<?php

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

// dev
$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => 'localhost',
    'database'  => 'match',
    'username'  => 'root',
    'password'  => '',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);


// prod
/*$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => 'mysql7.mydevil.net',
    'database'  => 'm1086_match',
    'username'  => 'm1086_match',
    'password'  => 'Am9Ot1zebgmfkGO6cqqq',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);*/


$capsule->setAsGlobal();

$capsule->bootEloquent();

//PRODUCTION





