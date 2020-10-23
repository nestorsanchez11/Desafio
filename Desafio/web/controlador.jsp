<%-- 
    Document   : controlador
    Created on : 19 oct. 2020, 17:00:11
    Author     : nestor
--%>

<%@page import="captcha.VerificarRecaptcha"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
        //Contacto--------------------------
     //----------------------------------------
     
     if (request.getParameter("enviar") != null) {

        Email email = new Email();

        String de = "auxiliardaw2@gmail.com";
        String clave = "Chubaca20";
        String para = "nestor1996sanchez@gmail.com";
        String mensaje = request.getParameter("textarea");
        String asunto = request.getParameter("email");

        email.enviarCorreo(de, clave, para, mensaje, asunto);
        out.println("Correo enviado");
        response.sendRedirect("Vistas/contacto.jsp");
    }
     
           //Recuperar contraseña--------------------------
     //----------------------------------------
     
     if (request.getParameter("recuperar") != null) {

        Email email = new Email();

        String de = "auxiliardaw2@gmail.com";
        String clave = "Chubaca20";
        String para = request.getParameter("email");
        String mensaje = "Contraseña: 1234";
        String asunto = "Contraseña olvidada";

        email.enviarCorreo(de, clave, para, mensaje, asunto);
        out.println("Correo enviado");
        response.sendRedirect("Vistas/resetPassword.jsp");
    }
     
     
     //Inicio de sesión--------------------------
     //----------------------------------------
     
    if(request.getParameter("inicio") != null){
         
        String email = request.getParameter("email");
        String contrasena = request.getParameter("password");
        String errorMessage = "";
         String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
               System.out.println(gRecaptchaResponse);
               boolean verificado = VerificarRecaptcha.verificar(gRecaptchaResponse);
               
        if (ConexionEstatica.existeUsuario(email, contrasena) == 0 && verificado) {
            Persona p = (Persona) ConexionEstatica.getPersona(email, contrasena);
            session.setAttribute("UsuarioLogin", p);
            
            //Añado +1 a la variable aplicación de gente conectada
            Integer contador = (Integer) application.getAttribute("usuariosOnline");
            if (contador == null || contador == 0) {
                contador = 1;
            } else {
                contador += 1;
            }
            application.setAttribute("usuariosOnline", contador);

            if (p.getRolSize() > 1) {
                response.sendRedirect("Vistas/seleccionRol.jsp");
            } else {
                if (p.getRol(0).equals("Administrador")) {
                    response.sendRedirect("Vistas/administrador.jsp");
                }
                if (p.getRol(0).equals("Usuario")) {
                    response.sendRedirect("Vistas/usuarioPrincipal.jsp");
                }
            }
            

        } else {
            response.sendRedirect("Vistas/incorrecto.jsp");
            errorMessage = "Captcha no válido";
                  session.setAttribute("errorMessage", errorMessage);
                  
        }
        
        
    
    }
    
   
    

 //Registro--------------------------
     //----------------------------------------
    
       if(request.getParameter("registrar") != null){
           String nombre= request.getParameter("nombre");
            String apellido= request.getParameter("apellidos");
            String dni= request.getParameter("dni");
            String password= request.getParameter("pass");
            int edad= Integer.parseInt(request.getParameter("edad"));
                String fichero= request.getParameter("foto");
                String sexo= request.getParameter("sexo");
                String email= request.getParameter("email");
                int sex;
                if(sexo.equals("hombre")){
                    sex=1;
                }else{
                    sex=0;
                }
                
                if(ConexionEstatica.existeUsuario(email, password) !=0){
                    if(ConexionEstatica.registrarUsuario(nombre, apellido, dni, password, edad, fichero, sex, email)){
                        response.sendRedirect("Vistas/IniciarSesion.jsp");
                    }
                    else{
                        response.sendRedirect("Vistas/Registro.jsp");
                    }
                    
                }
                
                
           
       }
       
 //Rol--------------------------
     //----------------------------------------


   if (request.getParameter("entrar") != null) {
        String rol = request.getParameter("elegir");

        if (rol.equals("admin")) {
            response.sendRedirect("Vistas/Administrador.jsp");
        }

        if (rol.equals("usuario")) {
            response.sendRedirect("Vistas/usuarioPrincipal.jsp");
        }

    }
   

 //Administrador--------------------------
     //----------------------------------------


    if (request.getParameter("filtrarRol") != null) {
        String rol = request.getParameter("rolFiltrar");
        session.setAttribute("rolFiltrado", rol);

        if (rol.equals("Administrador")) {
            LinkedList administradores = ConexionEstatica.getAdministradores();
            session.setAttribute("administradores", administradores);
            response.sendRedirect("Vistas/Administrador.jsp");
        }

        if (rol.equals("Usuario")) {
            LinkedList usuarios = ConexionEstatica.getUsuarios();
            session.setAttribute("usuarios", usuarios);
            response.sendRedirect("Vistas/Administrador.jsp");
        }

    }

    //-------------------------------------------------------------------------
    if (request.getParameter("btAdministracion") != null) {
        String botonPulsado = request.getParameter("btAdministracion");
        Persona aux = new Persona();
        aux.setNombre(request.getParameter("nombre"));
        aux.setApellidos(request.getParameter("apellido"));
        aux.setDni(request.getParameter("dni"));
        aux.setEdad(request.getParameter("edad"));
        aux.setEmail(request.getParameter("email"));
        aux.setContra(request.getParameter("password"));

        String sexo = request.getParameter("sexo");
        if (sexo.equals("Hombre")) {
            int genero = 0;
            aux.setSexo(genero);
        } else {
            int genero = 1;
            aux.setSexo(genero);
        }

        String esAdmin = request.getParameter("admin");
        if (esAdmin.equals("si")) {
            int admin = 1;
            aux.setEsAdmin(admin);
        } else {
            int admin = 0;
            aux.setEsAdmin(admin);
        }

        String estaActivado = request.getParameter("onoff");
        if (estaActivado.equals("si")) {
            int activado = 1;
            aux.setActivado(activado);
        } else {
            int activado = 0;
            aux.setActivado(activado);
        }

        if (botonPulsado.equals("eliminarUsuario")) {
            if (ConexionEstatica.existeUsuario(aux.getEmail(), aux.getContra()) == 0) {
                if (ConexionEstatica.eliminarUsuario(aux.getEmail(), aux.getContra())) {
                    response.sendRedirect("Vistas/Administrador.jsp");
                }
            }
        }
        if (botonPulsado.equals("editarUsuario")) {
            if (ConexionEstatica.existeUsuario(aux.getEmail(), aux.getContra()) == 0) {
                if (ConexionEstatica.modificarUsuario(aux)) {
                    response.sendRedirect("Vistas/Administrador.jsp");
                }
            }
        }

    }
    
    
     //Usuario Panel--------------------------
     //----------------------------------------


    if (request.getParameter("user") != null) {
        Persona p = (Persona) session.getAttribute("UsuarioLogin");
        String botonpulsado=request.getParameter("user");
        if(botonpulsado.equals("gente")){
            
             LinkedList genteCercana = ConexionEstatica.getGenteCercana(p);
            session.setAttribute("genteCercana", genteCercana);
            response.sendRedirect("Vistas/genteCercana.jsp");
            
        }
        if(botonpulsado.equals("enviarMensaje")){
             response.sendRedirect("Vistas/enviarMensaje.jsp");
        }

    }
    
    //-------------------------------------------------------------------------
    //-------------------------- Gente cercana --------------------------------
    //-------------------------------------------------------------------------
    if (request.getParameter("perfil") != null) {
        Persona p = (Persona) session.getAttribute("UsuarioLogin");
        String btPulsado = request.getParameter("perfil");

        if (btPulsado.equals("genteCercana")) {
            LinkedList genteCercana = ConexionEstatica.getGenteCercana(p);
            session.setAttribute("genteCercana", genteCercana);
            response.sendRedirect("Vista/usuarioPrincipal.jsp");
        }

    }
    
     //Mensaje--------------------------
     //----------------------------------------
    
    
       if (request.getParameter("mensaje") != null) {
        String emisor = request.getParameter("de");
        String receptor = request.getParameter("para");
        String asunto = request.getParameter("asunto");
        String cuerpo = request.getParameter("cuerpo");

        if (ConexionEstatica.existeUsuarioMensaje(receptor) == 0) {
            if (ConexionEstatica.enviarMensaje(emisor, receptor, asunto, cuerpo)) {
                response.sendRedirect("Vistas/enviarMensaje.jsp");
            }
        }

    }
    
    
 //Cerrar Sesión--------------------------
     //----------------------------------------
 if (request.getParameter("cerrarSesion") != null) {
        response.sendRedirect("index.jsp");
        session.removeAttribute("UsuarioLogin");
        
        //Elimino 1 usuario de la aplicacion
        if (application.getAttribute("usuariosOnline") != null) {
            Integer contador = (Integer) application.getAttribute("usuariosOnline");
            if (contador > 1) {
                contador -= 1;
            } else {
                contador = 0;
            }
            application.setAttribute("usuariosOnline", contador);
        }
    }
 


%>
