<link rel="stylesheet" href="/pap12etiagocastro/css/style.css">

<nav class="navbar">
  <div class="container nav-container">

    <div class="logo">
      <a href="/pap12etiagocastro/index.php">Banco de Ideias</a>
    </div>

    <ul class="nav-links">
      <li><a href="/pap12etiagocastro/index.php">Início</a></li>
      <li><a href="/pap12etiagocastro/sobre.php">Sobre</a></li>
      <li><a href="/pap12etiagocastro/ideias.php">Ideias</a></li>
      <li><a href="/pap12etiagocastro/submeter.php">Submeter Ideia</a></li>
      <li><a href="/pap12etiagocastro/contactos.php">Contactos</a></li>
    </ul>

  </div>
</nav>
<?php include "includes/menu.php"; ?>

<section class="page">
    <h1>Submeter Ideia</h1>

    <form class="formulario">

        <label>Nome:</label>
        <input type="text" required>

        <label>Título da Ideia:</label>
        <input type="text" required>

        <label>Descrição:</label>
        <textarea required></textarea>

        <label>Email de Contacto:</label>
        <input type="email" required>

        <button>Enviar Ideia</button>
    </form>

</section>

<?php include "includes/footer.php"; ?>
