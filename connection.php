<?php

$hostname = "localhost";
$db= 'mixfy';
$username  = 'root';
$passworrd = '';

$connection = new mysqli($hostname, $username, $passworrd, $db,3308 );

if($connection->connect_errno){
    echo 'Server does not work ';
}

?>