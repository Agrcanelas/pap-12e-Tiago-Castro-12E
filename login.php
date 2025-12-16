<?php
session_start();
include "includes/ligacao.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $senha = $_POST["senha"];

    $sql = "SELECT * FROM utilizadores WHERE email='$email'";
    $res = mysqli_query($conn, $sql);

    if (mysqli_num_rows($res) == 1) {
        $user = mysqli_fetch_assoc($res);

        if (password_verify($senha, $user["senha"])) {
            $_SESSION["id"] = $user["id"];
            $_SESSION["nome"] = $user["nome"];
            $_SESSION["tipo"] = $user["tipo_utilizador"];
            header("Location: index.php");
        }
    }
}
?>

<?php include "includes/menu.php"; ?>

<section class="page">
<h1>Login</h1>

<form method="POST" class="formulario">
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="senha" placeholder="Senha" required>
    <button>Entrar</button>
</form>
</section>

<?php include "includes/footer.php"; ?>
