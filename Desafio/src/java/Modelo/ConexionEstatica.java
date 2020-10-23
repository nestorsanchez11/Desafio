package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            //String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "com.mysql.cj.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName("org.mariadb.jdbc.Driver");              
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);
            //Class.forName("com.mysql.jdbc.Driver"); 

            //String URL_BD = "jdbc:mysql://localhost:3306/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+"localhost:3306"+"/"+Constantes.BBDD;
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";
            //String connectionString = "jdbc:mysql://localhost:3306/" + Constantes.BBDD + "?user=" + Constantes.usuario + "&password=" + Constantes.password + "&useUnicode=true&characterEncoding=UTF-8";
            //Realizamos la conexión a una BD con un usuario y una clave.
            //Conex = java.sql.DriverManager.getConnection(connectionString);
            //Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Conex = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/" + Constantes.BBDD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

   public static int existeUsuario(String usuario, String contrasena) {
        nueva();

       int cod=1;
        

        String sentencia = "Select * from " + Constantes.tablaUsuario + " where Email = '" + usuario + "' and Contraseña = '" + contrasena + "';";

        try {
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next()) {
                 cod = 0;
            }
        } catch (SQLException ex) {
            cod = ex.getErrorCode();
        }

        cerrarBD();

        return cod;

    }
   
   public static Persona getPersona(String usuario, String contrasena) {
        nueva();

        Persona p = new Persona();

        String sentencia = "Select Usuario.Nombre, Usuario.Apellidos, Usuario.DNI, Usuario.Email, Usuario.Contraseña, Usuario.Edad, Usuario.Foto, Usuario.Sexo, Roles.Rol from Usuario, Roles, AsignacionRol where Usuario.Email = '" + usuario + "' and Usuario.Contraseña = '" + contrasena + "' and AsignacionRol.Email = Usuario.Email and AsignacionRol.Id_Rol=Roles.Id_Rol;";

        try {
            Conj_Registros = Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p.setNombre(Conj_Registros.getString("Nombre"));
                p.setApellidos(Conj_Registros.getString("Apellidos"));
                p.setDni(Conj_Registros.getString("DNI"));
                p.setEmail(Conj_Registros.getString("Email"));
                p.setContra(Conj_Registros.getString("Contraseña"));
                p.setEdad(Conj_Registros.getString("Edad"));
                //p.setFoto(Conj_Registros.getString("Foto"));
                p.setSexo(Conj_Registros.getInt("Sexo"));
                p.addRol(Conj_Registros.getString("Rol"));
            }

        } catch (SQLException ex) {
        }
        cerrarBD();
        return p;
    }

   public static boolean registrarUsuario(String nombre, String apellido, String dni, String password, int edad, String fichero, int sex, String email){
        nueva();
       boolean ok=false;
       
       String sentencia="insert into  Usuario values ('" + nombre + "','" +  apellido + "','" + dni + "','" + email + "','" + password + "'," + edad + ",'" + fichero + "'," + sex + ")";
        try {
            Sentencia_SQL.executeUpdate(sentencia);
            ok=true;
        } catch (SQLException ex) {
            
        }
           cerrarBD();
        return ok;
         
   }
   
   public static LinkedList getRoles() {
        nueva();

        LinkedList roles = new LinkedList();

        String sentencia = "Select Rol from " + Constantes.tablaRol;

        try {
            Conj_Registros = Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                roles.add(Conj_Registros.getString("Rol"));
            }
        } catch (SQLException ex) {
        }
        cerrarBD();
        return roles;
    }
   
   public static LinkedList getAdministradores() {
        nueva();
        LinkedList administradores = new LinkedList();
        Persona p = null;
        String sentencia = "select * from Usuario, AsignacionRol WHERE AsignacionRol.Email=Usuario.Email and AsignacionRol.Id_Rol=2;";

        try {
            Conj_Registros = Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p = new Persona();
                p.setNombre(Conj_Registros.getString("Nombre"));
                p.setApellidos(Conj_Registros.getString("Apellidos"));
                p.setDni(Conj_Registros.getString("DNI"));
                p.setEmail(Conj_Registros.getString("Email"));
                p.setContra(Conj_Registros.getString("Contraseña"));
                p.setEdad(Conj_Registros.getString("Edad"));
                p.setSexo(Conj_Registros.getInt("Sexo"));
                p.setActivado(Conj_Registros.getInt("Activado"));
                administradores.add(p);
            }
        } catch (SQLException ex) {
        }

        cerrarBD();
        return administradores;
    }
   
   public static LinkedList getUsuarios() {
        nueva();
        LinkedList usuarios = new LinkedList();
        Persona p = null;
        String sentencia = "select * from Usuario, AsignacionRol WHERE AsignacionRol.Email=Usuario.Email and AsignacionRol.Id_Rol=1;";

        try {
            Conj_Registros = Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p = new Persona();
                p.setNombre(Conj_Registros.getString("Nombre"));
                p.setApellidos(Conj_Registros.getString("Apellidos"));
                p.setDni(Conj_Registros.getString("DNI"));
                p.setEmail(Conj_Registros.getString("Email"));
                p.setContra(Conj_Registros.getString("Contraseña"));
                p.setEdad(Conj_Registros.getString("Edad"));
                p.setSexo(Conj_Registros.getInt("Sexo"));
                p.setActivado(Conj_Registros.getInt("Activado"));
                usuarios.add(p);
            }
        } catch (SQLException ex) {
        }

        cerrarBD();
        return usuarios;
    }
   
   
   public static boolean eliminarUsuario(String usuario, String clave) {
        nueva();

        boolean eliminado = false;

        //------------------ Eliminacion de la tabla Usuarios ------------------
        String sentencia1 = "delete from Usuario where Email = '" + usuario + "' and Contraseña = '" + clave + "';";
        try {

            Sentencia_SQL.executeUpdate(sentencia1);
            eliminado = true;

        } catch (SQLException ex) {
        }

        //----------------- Eliminacion de los roles asignados ----------------
        String sentencia2 = "delete from AsignacionRol where Email = '" + usuario + "';";
        try {
            Sentencia_SQL.executeUpdate(sentencia2);
            eliminado = true;
        } catch (SQLException ex) {
        }

        cerrarBD();
        return eliminado;
    }
   
   public static boolean modificarUsuario(Persona p) {
        nueva();
        boolean modificado = false;

        //------------------- Modificando en la tabla Usuario ------------------
        String sentencia1 = "update Usuario set Nombre = '" + p.getNombre() + "', Apellidos = '" + p.getApellidos() + "', DNI = '" + p.getDni() + "', Email='" + p.getEmail() + "', Contraseña='" + p.getContra() + "', Edad=" + p.getEdad() + ", Sexo=" + p.getSexo() + ", Activado=" + p.getActivado() + " Where Email='" + p.getEmail() + "'";

        try {
            Sentencia_SQL.executeUpdate(sentencia1);
            modificado = true;
        } catch (SQLException ex) {
        }

        //---------------- Modificando en la tabla AsignacionRol ---------------
        if (p.getEsAdmin() == 1) {
            if (!ConexionEstatica.esAdmin(p.getEmail())) {
                String sentencia2 = "Insert into AsignacionRol values(Null, '2', '" + p.getEmail() + "');";
                try {
                    nueva();
                    Sentencia_SQL.executeUpdate(sentencia2);
                    cerrarBD();
                    modificado = true;
                } catch (SQLException ex) {
                }
            }
        }

        if (p.getEsAdmin() == 0) {
            if (ConexionEstatica.esAdmin(p.getEmail())) {
                String sentencia2 = "Delete from AsignacionRol Where Email = '" + p.getEmail() + "' and Id_Rol=2;";
                try {
                    nueva();
                    Sentencia_SQL.executeUpdate(sentencia2);
                    cerrarBD();
                    modificado = true;
                } catch (SQLException ex) {
                }
            }
        }

        cerrarBD();
        return modificado;
    }
   
   private static boolean esAdmin(String email) {
        nueva();
        boolean loes = false;
        String sentencia = "Select * from AsignacionRol where Email = '" + email + "';";

        try {
            Conj_Registros = Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                if (Conj_Registros.getInt("Id_Rol") == 2) {
                    loes = true;
                }
            }
        } catch (SQLException ex) {
        }
        cerrarBD();
        return loes;
    }
   
   
   public static LinkedList<Persona> getGenteCercana(Persona p) {
        nueva();
        LinkedList<Persona> lp = new LinkedList<>();
        Persona aux = null;
        String sentencia = "select * from " + Constantes.tablaUsuario + " Where DNI <> '" + p.getDni() + "';";

        try {
            Conj_Registros = Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                aux = new Persona();
                aux.setNombre(Conj_Registros.getString("Nombre"));
                aux.setApellidos(Conj_Registros.getString("Apellidos"));
                aux.setDni(Conj_Registros.getString("DNI"));
                aux.setEmail(Conj_Registros.getString("Email"));
                aux.setContra(Conj_Registros.getString("Contraseña"));
                aux.setEdad(Conj_Registros.getString("Edad"));
                //aux.setFoto(Conj_Registros.getString("Foto"));
                aux.setActivado(Conj_Registros.getInt("Activado"));
                aux.setSexo(Conj_Registros.getInt("Sexo"));
                lp.add(aux);
            }
        } catch (SQLException ex) {
        }

        cerrarBD();
        return lp;
    }
   
   
   public static boolean enviarMensaje(String emisor, String receptor, String asunto, String cuerpo) {
        nueva();
        boolean enviado = false;

        String sentencia = "Insert into " + Constantes.tablaMensaje + " values( Null, '" + asunto + "', '" + cuerpo + "', '" + emisor + "', '" + receptor + "')";

        try {
            Sentencia_SQL.executeUpdate(sentencia);
            enviado = true;
        } catch (SQLException ex) {
        }

        cerrarBD();
        return enviado;

    }

    public static int existeUsuarioMensaje(String usuario) {
        nueva();

        //cod = 0 --> Todo OK
        int cod = -9;

        String sentencia = "Select * from " + Constantes.tablaUsuario + " where Email = '" + usuario + "';";

        try {
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next()) {
                cod = 0;
            }
        } catch (SQLException ex) {
            cod = ex.getErrorCode();
        }

        cerrarBD();

        return cod;

    }
}
