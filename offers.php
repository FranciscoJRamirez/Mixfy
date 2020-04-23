<?php
include 'connection.php';

$query= "SELECT * FROM cupones";

$result = $connection -> query($query);

while ($file=$result->fetch_array()){
    echo json_encode($file, JSON_UNESCAPED_UNICODE);
}

$result->close();
?>