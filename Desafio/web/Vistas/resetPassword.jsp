<%-- 
    Document   : resetPassword
    Created on : 29-sep-2020, 13:30:33
    Author     : nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurar Contraseña</title>
    </head>
    <body>
        <h1>Recuperar contraseña</h1>
        <fieldset>
            <form action="../controlador.jsp">
                <table>
                    <tr>
                        <td>Correo electrónico</td>
                        <td><input type="email" name="email"></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <button type="submit" name="recuperar" value="recuperar">Recuperar</button></td>
                    </tr>
                </table>
            </form>
        </fieldset>
    </body>
</html>
