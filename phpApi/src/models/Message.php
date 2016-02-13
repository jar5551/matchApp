<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 11/02/16
 * Time: 22:55
 */

namespace src\models;

use Illuminate\Database\Capsule\Manager as Capsule;


class Message
{
    public function getMessageTopics($token)
    {
        $user = new User();
        $returnArray = array();

        $userId = $user->getMeId($token);

        try {
            $messageTopics = Capsule::table('messagestopics as mt')
                ->select('mt.id', 'mt.name', 'mt.userFrom', 'mt.userTo', 'u1.firstName as userFromName', 'u2.firstName as userToName')
                ->join('users as u1', 'mt.userFrom', '=', 'u1.id')
                ->join('users as u2', 'mt.userTo', '=', 'u2.id')
                ->where('mt.userFrom', $userId)
                ->orWhere('mt.userTo', $userId)
                ->get();


        } catch (\Exception $e) {
            throw new \Exception('Problem z probraniem wiadmości');
        }


        foreach($messageTopics as $topic) {
            if($topic->userFrom == $userId) {
                $topic->participant = $topic->userToName;
            } else {
                $topic->participant = $topic->userFromName;
            }
            array_push($returnArray, $topic);
        }

        return $returnArray;

    }
    public function getMessageTopic($token, $id)
    {
        $user = new User();

        $userId = $user->getMeId($token);

        try {

            $messages = Capsule::table('messages as m')
                ->select('m.message', 'm.dateSend', 'u.firstName', 'u.id as userId')
                ->join('users as u', 'm.author', '=', 'u.id')
                ->where('topicId', $id)
                ->get();

        } catch (\Exception $e) {
            throw new \Exception('Problem z probraniem wiadmości');
        }


        return $messages;

    }


    public function newMessage($token, $topicId, $message) {

        $user = new User();


        $userId = $user->getMeId($token);

        $dateSend = date("Y-m-d H:i:s");

        try {

            $messageId = Capsule::table('messages')
                ->insertGetId([
                    'author' => $userId,
                    'topicId' => $topicId,
                    'message' => $message,
                    'dateSend' => $dateSend
                ]);

        } catch (\Exception $e) {
            throw new \Exception('Problem z wysłaniem wiadmości');
        }

        return array('message' => $message, 'dateSend' => $dateSend, 'userId' => $userId);
    }
}