<?php

$host="localhost:3308";
$user="root";
$password="";
$db="dblatihan";

$kon = mysqli_connect($host, $user, $password, $db);
if (!$kon){
        die("Koneksi Gagal:".mysqli_connect_error());
        
}
?>
