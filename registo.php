<?php
include "includes/ligacao.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST["nome"];
    $email = $_POST["email"];
    $senha = password_hash($_POST["senha"], PASSWORD_DEFAULT);

    $sql = "INSERT INTO utilizadores (nome, email, senha)
            VALUES ('$nome', '$email', '$senha')";

    if (mysqli_query($conn, $sql)) {
        header("Location: login.php");
    }
}
?>

<?php include "includes/menu.php"; ?>

<section class="page">
<h1>Criar Conta</h1>

<form method="POST" class="formulario">
    <input type="text" name="nome" placeholder="Nome" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="senha" placeholder="Senha" required>
    <button>Criar Conta</button>
</form>
</section>

<?php include "includes/footer.php"; ?>
