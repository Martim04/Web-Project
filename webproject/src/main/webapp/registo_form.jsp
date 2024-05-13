<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="PT-pt">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Registo</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<script>
    function validarFormulario() {
        var nomeApelido = document.getElementById("nome").value;
        var apelido = document.getElementById("sobrenome").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var confirmarPassword = document.getElementById("confirmar_password").value;
        var mensagemErro = document.getElementById("mensagem_erro");

        // Limpar mensagem de erro
        mensagemErro.innerHTML = "";

        // Verificar se os campos estão vazios
        if (nomeApelido === '' || email === '' || password === '' || confirmarPassword === '' || apelido === '') {
            mensagemErro.innerHTML = "Por favor, preencha todos os campos.";
            return false;
        }

        // Verificar se as passwords coincidem
        if (password !== confirmarPassword) {
            mensagemErro.innerHTML = "As passwords não coincidem. Por favor, tente novamente.";
            return false;
        }

    
        window.location.href = "index.jsp";
        return true;
    }
</script>

<style>
    body{
        background-image: url("assets/img/header-bg.jpg");
        background-size: cover;
        background-attachment:fixed;
        background-position: center;
    }
    .registerbox {
        width: 320px;
        height: 600px;
        background: #333333;
        color: white;
        top: 50%;
        left: 50%;
        position: absolute;
        transform: translate(-50%, -50%);
        box-sizing: border-box;
        padding: 70px 30px;
        z-index: -1;
    }
    .avatar {
        width: auto;
        height: 100px;
        position: absolute;
        top: 1%;
        left: calc(30% - 90px);
        z-index: -1;
    }
    h1 {
        margin: 0;
        padding: 0 0 20px;
        text-align: center;
        font-size: 22px;
    }
    .registerbox p {
        margin: 0;
        padding: 0;
        font-weight: bold;
    }
    .registerbox input {
        width: 100%;
        margin-bottom: 20px;
    }
    .registerbox input[type="text"],
    .registerbox input[type="password"],
    .registerbox input[type="email"] {
        border: none;
        border-bottom: 1px solid white;
        background: transparent;
        outline: none;
        height: 40px;
        color: white;
        font-size: 16px;
    }
    .registerbox input[type="submit"] {
        border: none;
        outline: none;
        height: 40px;
        background: burlywood;
        color: white;
        font-size: 18px;
        border-radius: 20px;
    }
    .registerbox input[type="submit"]:hover {
        cursor: pointer;
        background: burlywood;
    }
    .registerbox a {
        text-decoration: none;
        font-size: 12px;
        line-height: 20px;
        color: gray;
    }
    .registerbox a:hover {
        color: burlywood;
    }
    .mensagem_erro {
        color: red!important;
        font-size: 14px;
        text-align: center;
    }
</style>

<!--Register-->
<body>

    <div class="registerbox">
        <img src="assets/img/back2.jpg" class="avatar" alt="Company Logo">
        <br>
        <form action="####.jsp" method="post" name="Register" id="Register" onsubmit="return validarFormulario()">
            <p>Nome</p>
            <input type="text" id="nome" name="nome" value="" placeholder="Nome ">
            <p>Apelido</p>
            <input type="text" id="sobrenome" name="sobrenome" placeholder="Apelido ">
            <p>Email</p>
            <input type="email" id="email" name="email" value="" placeholder="Email">
            <p>Palavra-passe</p>
            <input type="password" id="password" name="senha" value="" placeholder="Palavra-passe">
            <p>Confirmar palavra-passe</p>
            <input type="password" id="confirmar_password" name="senha" value="" placeholder="Palavra-passe">
            <input type="submit" name="Register" value="Registar">
            <a href="logins.jsp">Login</a>
        </form>
        
        <div id="mensagem_erro"></div>
    </div>

</body>
</html>