<%-- 
    Document   : Registro
    Created on : 15 oct. 2020, 18:26:29
    Author     : nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/contacto.css">
        <script src="../validacion.js">
            
        </script>
    </head>
    <body onload="validacion()">
         <header>
        <h1>Registro</h1>
    </header>

    <seccion>
        <article>
            <h3>Registrar usuario</h3>
            <hr>
            <form novalidate action="../controlador.jsp" name="formulario" method="POST">
                
                <label for="nombre">
                <p>Nombre: *</p>
                <input type="text" name="nombre" id="nombre" placeholder="Introduce tu nombre" pattern="^([A-Za-zÀ-ú]+){1}$" required>
                <span class="error" aria-live="polite"></span>
                </label>
                
                <label for="apellidos">
                <p>Apellidos: *</p>
                <input type="text" name="apellidos" id="apellidos" placeholder="Introduce tu apellido" pattern="^([A-Za-zÀ-ú]+ ){1}([A-Za-zÀ-ú]+)?$" required>
                <span class="error" aria-live="polite"></span>
                </label>
                
                <label for="dni">
                <p>DNI: *</p>
                <input type="text" name="dni" id="dni" placeholder="Introduce tu dni" pattern="^[0-9]{2}.[0-9]{3}.[0-9]{3}-[A-Z]$" required>
                <span class="error" aria-live="polite"></span>
                </label>
                
                <label for="password">
                <p>Contraseña: *</p>
                <input type="password" name="pass" id="password" placeholder="Introduce tu contraseña" minlength="8" maxlength="16"  required>
                <span class="error" aria-live="polite"></span>
                </label>
                
                <label for="edad">
                <p>Edad: *</p>
                <input type="number" name="edad" id="edad" pattern="^[0-80]{1}$" minlength="18" maxlength="80" required>
                <span class="error" aria-live="polite"></span>
                </label>
                
                
                <p>Foto: *</p>
                <input type="file" name="foto" >
                <p>Sexo:  *</p>
                <input type="radio" name="sexo" value="hombre" checked>Hombre
                <input type="radio" name="sexo" value="mujer" >Mujer
                 
                <label for="email">
                <p>Email: *</p>
                <input type="text" name="email" id="email" placeholder="Introduce tu email" pattern="^[A-Za-z0-9]+@[a-z]+\.[a-z]{2,3}$" required>
                <span class="error" aria-live="polite"></span>
                </label>
                       <table>
            <tr>
                <td>Captcha</td>
            </tr>
            <tr>
                <td>
                    <canvas id="captcha"></canvas>  
                    <input type="button" id="refresh" value="Refresh" onclick="captcha();" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" id="txtInput"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="button1" type="button" value="Check" onclick="alert(validCaptcha('txtInput'));"/>
                </td>
            </tr>
        </table>
                 <br><br>
                <button type="submit" name="registrar" value="enviar">Registrar</button>
                
               
            </form>
            <br><br>
        </article>
    </seccion>

 <footer><a href="../index.jsp"><img src="../imagen/flecha-atras-esbozar_318-8503.jpg"/></a></footer>
    </body>
    </body>
</html>
