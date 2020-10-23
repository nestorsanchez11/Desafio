<%-- 
    Document   : genteCercana
    Created on : 23 oct. 2020, 16:18:09
    Author     : nestor
--%>

<%@page import="Modelo.Persona"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Integer contador = (Integer) application.getAttribute("usuariosOnline");
        LinkedList<Persona> gente = (LinkedList<Persona>) session.getAttribute("genteCercana");
        Persona p = (Persona) session.getAttribute("UsuarioLogin");
        %>
         <header class="row">
           
            <div class="col-10">
                <h1>Bienvenido <%= p.getNombre()%></h1>
            </div>
        </header>
            <section>
                <div>
                    <p> Se encuentran <%=contador%> usuarios conectados</p>
                </div>
                <div>
                   <%
                        if (gente != null) {

                            for (int i = 0; i < gente.size(); i++) {
                                Persona aux = (Persona) gente.get(i);
                    %>

                    <div class="contenedor col-5">
                        <div class="tabla">
                            <table>
                                <thead>
                                    <tr>
                                        <th colspan="2"><%= aux.getNombre() + " " + aux.getApellidos()%></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                        <td>Edad:</td>
                                        <td><%= aux.getEdad()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><%= aux.getEmail()%></td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %> 
                    
                    
                    
                    
                    
                </div>
                
                
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
