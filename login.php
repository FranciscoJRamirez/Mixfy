<?php
include 'connection.php';
$user = $_POST['email'];
$password = $_POST['password'];

$query= $connection->prepare("SELECT * FROM usuarios WHERE correo =? AND contrasena = ?");
$query->bind_param('ss', $user, $password);
$query->execute();
$result = $query->get_result();

if ($file=$result->fetch_array()){
    echo json_encode($file, JSON_UNESCAPED_UNICODE);
}

$query->close();
$result->close();
?>