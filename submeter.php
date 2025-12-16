<?php
session_start();
include "includes/ligacao.php";

/* PROTEÇÃO: só utilizadores com login */
if (!isset($_SESSION["id"])) {
    header("Location: login.php");
    exit();
}

/* PROCESSAR FORMULÁRIO */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titulo = $_POST["titulo"];
    $descricao = $_POST["descricao"];
    $id_utilizador = $_SESSION["id"];

    $sql = "INSERT INTO ideias (titulo, descricao, id_utilizador)
            VALUES ('$titulo', '$descricao', '$id_utilizador')";

    if (mysqli_query($conn, $sql)) {
        $mensagem = "Ideia submetida com sucesso!";
    } else {
        $erro = "Erro ao submeter a ideia.";
    }
}
?>

<?php include "includes/menu.php"; ?>

<section class="page">
    <h1>Submeter Ideia</h1>

    <?php if (isset($mensagem)) echo "<p class='sucesso'>$mensagem</p>"; ?>
    <?php if (isset($erro)) echo "<p class='erro'>$erro</p>"; ?>

    <form method="POST" class="formulario">

        <label>Título da Ideia:</label>
        <input type="text" name="titulo" required>

        <label>Descrição:</label>
        <textarea name="descricao" required></textarea>

        <button>Enviar Ideia</button>
    </form>
</section>

<?php include "includes/footer.php"; ?>
