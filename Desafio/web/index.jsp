<%-- 
    Document   : newjsp
    Created on : 15 oct. 2020, 18:46:38
    Author     : nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <header class="row">
            <div class="col-m-0 col-0 col-l-1">
                <img src="imagen/titulo.png">
            </div>

            <div class="col-m-10 col-10 col-l-9">
                <h1>CitasOnline</h1>
            </div>
        </header>

        <nav class="row">
            <div class="col-m-10 col-l-10">
                <ul>
                    <li><a class="transicion" href="Vistas/informacion.jsp">Información de la página</a></li>
                    <li><a class="transicion" href="Vistas/contacto.jsp">Contacto</a></li>
                </ul>
            </div>
        </nav>

        <main class="row">

            <section class="col-m-10 col-l-10">
                <article>

                    <p><a class="boton" href="Vistas/IniciarSesion.jsp">Iniciar Sesión</a></p>

                    <p><a class="boton" href="Vistas/Registro.jsp">Registrarse</a></p>
                </article>
            </section>
        </main>
        <footer class="row">
            <div class="col-m-10 col-l-10">
                <ul>
                    <li>Página:Citas Online</li>
                    <li>Nombre del creador: Néstor Sánchez Morales</li>
                </ul>
            </div>
        </footer>
    </body>
</html>
