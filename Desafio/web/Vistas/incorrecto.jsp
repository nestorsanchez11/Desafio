<%-- 
    Document   : incorrecto
    Created on : 19 oct. 2020, 17:39:16
    Author     : nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/error.css">
        <title>Iniciar Sesión</title>
         <script src="https://www.google.com/recaptcha/api.js"></script>
    </head>
    <body>

       <header class="row">
            <div class="col-1">
                <img src="../imagen/titulo.png">
            </div>

            <div class="col-9">
                <h1>Iniciar sesión CitasOnline</h1>
            </div>
        </header>

        <main class="row">
           
            <section class="col-10">
                <article>
                    
                    <fieldset>
                        <h3>Error al iniciar sesión: </h3>
                        <form action="../controlador.jsp" name="login">
                            <ul>
                                <li>Email: </li>
                                <input type="email" name="email" required>
                                <li>Contraseña: </li>
                                <input type="password" name="password" required>
                            </ul>
                            <p><a href="resetPasswd.jsp">¿Olvidaste tu contraseña?</a></p>
                            <button type="submit" name="inicio">Iniciar sesión</button>
                            <p>
                                <div class="g-recaptcha" data-sitekey="6LfrPdoZAAAAAE4ukz0fHBB-ShNgNqtM4HJg-mJm"></div>
                     <span>
                         <%
                         Object errorMessage = session.getAttribute("errorMessage");
                         if(errorMessage != null)
                            out.print(errorMessage.toString());
                         %>
                     </span>
                            </p>
                        </form>
                        </fieldset>
                 
                </article>
            </section>
        </main>

             <footer class="row">
            <div class="col-10">
                <ul>
                    <li>Página:Citas Online</li>
                    <li>Nombre del creador: Néstor Sánchez Morales</li>
                </ul>
            </div>
        </footer>
    </body>
</html>
