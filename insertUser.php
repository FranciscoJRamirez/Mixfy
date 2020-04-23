<?php
include 'connection.php';
$nombre = $_POST['nombre'];
$apellidop = $_POST['apellidop'];
$apellidom=$_POST['apellidom'];
$correo = $_POST['correo'];
$telefono = $_POST['telefono'];
$contrasena = $_POST['contrasena'];



$query= $connection->prepare("INSERT INTO usuarios (nombre, apellidop, apellidom, correo, telefono, contrasena)  
    VALUES ('$nombre','$apellidop','$apellidom','$correo','$telefono','$contrasena')");
if($query->execute()){
    echo "Registro del usuario existoso";
}
else {
    echo 'Error al intentar registrar al usuario';
}
$query->close();
?>