<?php

require_once('../functions.php');
require_once('../db.php');

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// Проверяваме дали потребителят съществува
$query = "SELECT * FROM users WHERE email = :email";
$stmt = $pdo->prepare($query);
$stmt->execute([':email' => $email]);
$user = $stmt->fetch();

if (!$user) {
    // Показваме съобщение за грешка, ако имейлът не съществува в базата
    header('Location: ../index.php?page=login&error=Грешен имейл или парола');
    exit;
}

if (!password_verify($password, $user['password'])) {
    // Показваме съобщение за грешка, ако паролата е грешна
    header('Location: ../index.php?page=login&error=Грешен имейл или парола');
    exit;
}

session_start();
$_SESSION['user_name'] = $user['names'];
$_SESSION['user_email'] = $user['email'];
$_SESSION['user_id'] = $user['id'];

// Сетваме бисквитка за имейл
setcookie('user_email', $user['email'], time() + 3600, '/', 'localhost', false, true);

header('Location: ../index.php');
exit;

?>
