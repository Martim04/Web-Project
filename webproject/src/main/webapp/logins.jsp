<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>login</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

       
        </head>
    <style>
        body{
            background-image: url("assets/img/header-bg.jpg");
            background-size: cover;
            background-attachment:fixed;
            background-position: center;
           
        }
        .loginbox {
            box-shadow: rgba(149, 157, 165, .3) 0px 8px 24px 4px;
            width: 320px;
            height: 350px;
            background: #333333b2;
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
            /*border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0);*/
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

            .loginbox p {
            margin: 0;
            padding: 0;
            font-weight: bold;
            }

            .loginbox input {
            width: 100%;
            margin-bottom: 20px;
            }

            .loginbox input[type="text"],
            .loginbox input[type="password"] {
            border: none;
            border-bottom: 1px solid white;
            background: transparent;
            outline: none;
            height: 40px;
            color: white;
            font-size: 16px;
            }

            .loginbox input[type="submit"] {
            border: none;
            outline: none;
            height: 40px;
            background: burlywood;
            color: white;
            font-size: 18px;
            border-radius: 20px;
            }

            .loginbox input[type="submit"]:hover {
            cursor: pointer;
            background: burlywood;
            }

            .loginbox a {
            text-decoration: none;
            font-size: 12px;
            line-height: 20px;
            color: gray;
            }

            .loginbox a:hover {
            color: burlywood;
            }
        

    </style>
        
        <!--login-->
        <body>

        <div class="loginbox">
            <img src="assets/img/back2.jpg" class="avatar" alt="Company Logo">
            <br>
            <form action="Login.jsp" method="post" name="Login" id="Login">
            <p>Nome</p>
            <input type="text" name="email"  placeholder="Nome de Utilizador">
            <p>Palavra-passe</p>
            <input type="password" name="senha"  placeholder="Palavra-passe">
            <input type="submit" name="login" value="Login">
            <a href="registo_form.jsp">Registar</a>
            </form>
        </div>

        </body>
</html>
