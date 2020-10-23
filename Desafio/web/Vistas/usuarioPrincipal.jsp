<%-- 
    Document   : usuarioPrincipal
    Created on : 19 oct. 2020, 17:38:07
    Author     : nestor
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="../css/usuario.css">
    </head>
    <body>
        
       <%
           Persona p=(Persona)session.getAttribute("UsuarioLogin");
           
       %>
        <header class="row">
           
            <div class="col-10">
                <h1>Bienvenido <%= p.getNombre()%></h1>
            </div>
        </header>
            
            <main class="row">
                
                <section class="col-10">
                   <form action="../controlador.jsp" name="form">
                    <div class="row">
                        <div class="col-5">
                            <ul>
                                 <li>
                                      <button type="submit" name="user" value="perfil">Perfil</button>
                                     
                                 </li>
                                 
                                 <li>
                                     <button type="submit" name="user" value="enviarMensaje">Enviar Mensaje</button>
                                 </li>
                             </ul>
                            
                        </div>
                        
                         <div class="col-5">
                             <ul>
                                 <li>
                                     <button type="submit" name="user" value="gente">Gente cercana</button>
                                 </li>
                                 
                                 <li>
                                    <button type="submit" name="user" value="amigos">Amigos</button>
                                 </li>
                             </ul>
                            
                        </div>
                        
                    </div>
                    
                </section>
                <section class="row">
                    <div class="col-10">
                        <button type="submit" name="cerrarSesion" value="cerrarSesion">Cerrar Sesión</button>
                    </div>
                    <form>
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
