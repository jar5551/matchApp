<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 25.12.2015
 * Time: 18:16
 */

use src\models\Message;

$app->get('/messages/', function () use ($app) {
    $token = $app->request->headers("Authorization");

    $message = new Message();

    $messageTopics = $message->getMessageTopics($token);

    $app->render(200, array(
        'msg' => $messageTopics
    ));
});

$app->get('/messages/:messageId', function ($messageId) use ($app) {
    $token = $app->request->headers("Authorization");

    $message = new Message();

    $messageTopic = $message->getMessageTopic($token, $messageId);

    $app->render(200, array(
        'msg' => $messageTopic
    ));
});

$app->put('/messages/:topicId', function ($topicId) use ($app) {
    $token = $app->request->headers("Authorization");
    $json = $app->request->getBody();
    $data = json_decode($json, true);
    $message = new Message();

    $newMessage = $message->newMessage($token, $topicId, $data['message']);


    $app->render(200, array(
        'msg' => 'Pomyślnie wysłano wiadomość',
        'message' => $newMessage
    ));
});