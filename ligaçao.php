<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "banco_ideias";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Erro na ligação à base de dados");
}
?>
