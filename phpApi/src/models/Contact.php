<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 13/02/16
 * Time: 13:57
 */

namespace src\models;

use PHPMailer\PHPMailer\PHPMailer;

class Contact
{

    public function sendContactMessage($data)
    {

        if (!isset($data['imienaz']) || empty($data['imienaz']) || !isset($data['email']) || empty($data['email']) || !isset($data['temat']) || empty($data['temat']) || !isset($data['message']) || empty($data['message'])) {
            throw new \Exception('Prosze wypełnić pola formularza');
        }

        $mail = new PHPMailer;

        $mail->isSMTP();
        $mail->Host = 'smtp.emaillabs.net.pl';
        $mail->SMTPAuth = true;
        $mail->Username = '1.matchapp.smtp';
        $mail->Password = 'A&c2X37f';
        $mail->Port = 587;
        $mail->CharSet = 'UTF-8';

        $mail->setFrom($data['email'], $data['imienaz']);
        $mail->addAddress('match@loho.pl');     // Add a recipient

        $mail->isHTML(false);                                  // Set email format to HTML

        $mail->Subject = '[MatchApp] ' . $data['temat'];
        $mail->Body = $data['message'];

        try {
            $mail->send();
        } catch (\Exception $e) {
            throw new \Exception('Wystąpił błąd z wysłaniem wiadomości. ' . $mail->ErrorInfo);
        }

        return true;
    }
}