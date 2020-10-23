<%-- 
    Document   : Administrador
    Created on : 21 oct. 2020, 17:32:40
    Author     : nestor
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/administrador.css">
    </head>
    <body>

        <%

            Persona usuarioLogin = (Persona) session.getAttribute("UsuarioLogin");

            LinkedList roles = ConexionEstatica.getRoles();

        %>

        <header class="row">
            <div class="col-1">
                <img src="../imagen/titulo.png">
            </div>

            <div class="col-9">
                <h1><%= usuarioLogin.getNombre()%>, bienvenido al administrador</h1>
            </div>
        </header>

        <main class="row">
            

            <section class="col-8">

                <div class="filtro">
                    <article class="row">
                        <div class="col-10">
                            <fieldset>
                                <form action="../controlador.jsp" name="rolFiltrar">
                                    <legend>Elige el rol a filtrar</legend>
                                    <select name="rolFiltrar">
                                        <%
                                            for (int i = 0; i < roles.size(); i++) {
                                        %>

                                        <option name="rol"><%= roles.get(i)%></option>

                                        <%
                                            }
                                        %>
                                    </select>

                                    <button type="submit" name="filtrarRol">Filtrar</button>
                                </form>
                            </fieldset>
                        </div>
                    </article>
                </div>

                <div class="tabla">
                    <article class="row">
                        <div class="col-10">
                            <%
                                String rol = (String) session.getAttribute("rolFiltrado");
                                LinkedList usuarios = null;
                                if (rol != null) {

                                    if (rol.equals("Administrador")) {
                                        if (session.getAttribute("administradores") != null) {
                                            usuarios = (LinkedList) session.getAttribute("administradores");
                                        }

                            %>

                            <h2>Listado de Administradores registrados</h2>

                            <%  }

                                if (rol.equals("Usuario")) {
                                    if (session.getAttribute("usuarios") != null) {
                                        usuarios = (LinkedList) session.getAttribute("usuarios");
                                    }

                            %>

                            <h2>Listado de Usuarios registrados</h2>

                            <%     }
                                }

                                //-------------------------------------------------------------------
                                if (usuarios != null) {
                            %>
                            <table>
                                <thead>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th>Edad</th>
                                <th>Email</th>
                                <th>Contraseña</th>
                                <th>Sexo</th>
                                <th>Administrador</th>
                                <th>On / Off</th>
                                </thead>
                                  <tbody>
                                <%
                                    for (int i = 0; i < usuarios.size(); i++) {
                                        Persona p = (Persona) usuarios.get(i);
                                %>
                               
                                  <form  action="../controlador.jsp" name="usuarios">
                                    <tr>
                                        <td><input type="text" name="nombre" value="<%= p.getNombre()%>" readonly></td>
                                        <td><input type="text" name="apellido" value="<%= p.getApellidos()%>" readonly></td>
                                        <td><input type="text" name="dni" value="<%= p.getDni()%>" readonly></td>
                                        <td><input type="text" name="edad" value="<%= p.getEdad()%>"></td>
                                        <td><input type="email" name="email" value="<%= p.getEmail()%>"></td>
                                        <td><input type="text" name="password" value="<%= p.getContra()%>"></td>

                                        <%
                                            if (p.getSexo() == 1) {
                                        %>
                                        <td>
                                            <input type="checkbox" id="hombre" name="sexo" value="Hombre" checked readonly>Hombre
                                        </td>
                                        <%
                                        } else {
                                        %>
                                        <td>
                                            <input type="checkbox" id="mujer" name="sexo" value="Mujer" checked readonly>Mujer
                                        </td>
                                        <%
                                            }
                                        %>
                                        <td>
                                            <select name="admin">
                                                <option name="es" value="si">Si</option>
                                                <option name="es" value="no">No</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="onoff">
                                                <%
                                                    if (p.getActivado() == 1) {
                                                %>
                                                <option name="activado" value="si" selected>Si</option>
                                                <option name="activado" value="no">No</option>
                                                <%
                                                } else {
                                                %>
                                                <option name="activado" value="si">Si</option>
                                                <option name="activado" value="no" selected>No</option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>

                                        <td><button type="submit" name="btAdministracion" value="eliminarUsuario">Eliminar</button></td>
                                        <td><button type="submit" name="btAdministracion" value="editarUsuario">Editar</button></td>
                                    </tr>
                                </form>
                               
                                <%                       }
                                %>
                                 </tbody>
                            </table>
                            <%
                                }
                            %>


                        </div>
                    </article>
                </div>

                <div class="boton">
                    <article class="row">
                        <div class="col-4">
                            <form action="../controlador.jsp" name="cerrarSesion">
                                <button type="submit" name="cerrarSesion" value="cerrarSesion">Cerrar Sesión</button>
                            </form>
                        </div>
                    </article>
                </div>
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
