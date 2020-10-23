<%-- 
    Document   : contacto
    Created on : 16 oct. 2020, 9:06:07
    Author     : nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/contacto.css">
        <script src="../validacion.js">
            
        </script>
    </head>
    <body onload="validacion()">
         <header>
        <h1>Contacto</h1>
    </header>

    <seccion>
        <article>
            <h3>Formulario de contacto</h3>
            <hr>
            <form novalidate action="../controlador.jsp" name="formulario" method="POST">
                <label for="nombre">
                <p>Nombre: *</p>
                <input type="text"  id="nombre" name="nombre" placeholder="Introduce tu nombre" pattern="^([A-Za-zÀ-ú]+){1}$" required />
                <span class="error" aria-live="polite"></span>
                </label>
                
                
                
                <p>
                
                <label for="email">
                <span>Email: *</span>
                <input type="text"  id="email" name="email" placeholder="Introduce tu email"  pattern="^[A-Za-z0-9]+@[a-z]+\.[a-z]{2,3}$" required />
                <span class="error" aria-live="polite"></span>
                </label>
                    
                </p>
                
                <p>Mensaje: *</p>
                <textarea id="area" name="textarea" rows="15" cols="50" placeholder= "Escribe un mensaje..." required></textarea>
                <br><br>
                <button type="submit" name="enviar" value="enviar">Enviar</button>

            </form>
            
        </article>
    </seccion>

 <footer><a href="../index.jsp"><img src="../imagen/flecha-atras-esbozar_318-8503.jpg"/></a></footer>
    </body>
</html>
