<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 13/02/16
 * Time: 13:55
 */

use src\models\Contact;

$app->post('/contact', function () use ($app) {

  $json = $app->request->getBody();
  $data = json_decode($json, true);

  $contact = new Contact();

  $contact->sendContactMessage($data);

  $app->render(200, array(
      'msg' => 'Wiadomść została pomyślnie wysłana'
  ));
});