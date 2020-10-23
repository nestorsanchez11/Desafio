<%-- 
    Document   : seleccionRol
    Created on : 19 oct. 2020, 18:03:48
    Author     : nestor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/seleccionrol.css">
    </head>
    <body>
        <header class="row">
         <div class="col-10">
        <h1>
            Seleccion de Rol
        </h1>
         </div>
        </header>
        
        <section class="row">
            <article class="col-10">
                 <form  action="../controlador.jsp" name="formulario" method="POST">
                     <select name="elegir">
                         <option value="admin">Administrador</option>
                         <<option value="usuario">Usuario</option>
                     </select> 
                     <p><input type="submit" name="entrar" value="Aceptar"> </p>
                 </form>
                
            </article>
        </section>
        
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
