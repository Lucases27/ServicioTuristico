package persistencia;

import java.util.Date;
import java.util.List;
import logica.Empleado;
import logica.Usuario;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    private ClienteJpaController clienteJPA = new ClienteJpaController();
    private EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    private PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    private ServicioJpaController servicioJPA = new ServicioJpaController();
    private UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    private VentaJpaController ventaJPA = new VentaJpaController();

    /**
     * Crea un usuario y un empleado.
     * @param nombre
     * @param apellido
     * @param direccion
     * @param dni
     * @param nacionalidad
     * @param celular
     * @param email
     * @param cargo
     * @param sueldo
     * @param nombreUsuario
     * @param pass
     * @param fNac
     * @return true si crea el empleado, false si no lo crea.
     * @throws NonexistentEntityException 
     */
    public boolean crearEmpleado(String nombre, String apellido, String direccion, String dni,
            String nacionalidad, String celular, String email, String cargo, double sueldo,
            String nombreUsuario, String pass, Date fNac) throws NonexistentEntityException {
        
        Usuario usuario = new Usuario(nombreUsuario,pass);
        Empleado empleado = new Empleado(nombre,apellido,direccion,dni,fNac,nacionalidad,celular,
                                      email,cargo,sueldo,usuario);
        
        
        try {
            usuarioJPA.create(usuario);
        } catch (Exception e) {
            return false;
        }
        try {
            empleadoJPA.create(empleado);
        } catch (Exception e) {
            //Si crea el usuario pero no el empleado, aca borramos el usuario y retornamos false.
            List<Usuario> usuarios = usuarioJPA.findUsuarioEntities();
            if(usuarios!=null){
                for (Usuario user : usuarios) {
                    if(user.getNombre_usuario().equals(usuario.getNombre_usuario())){
                        usuarioJPA.destroy(user.getId_usuario());
                        return false;
                     }
                }
            }
        }
        return true;
    }
    
    /**
     * Recibe dos strings, usuario y contraseña y se fija que matchen con alguno de los usuarios en la tabla.
     * @param user
     * @param pass
     * @return retorna true si logeo exitoso, false en caso contrario
     */
    public boolean login(String user, String pass) {
        boolean login = false;
        List<Usuario> users = usuarioJPA.findUsuarioEntities();
        for (Usuario usuario : users) {
            if(usuario.getNombre_usuario().equals(user)){
                if(usuario.getContrasenia().equals(pass)){
                    login = true;
                }
            }
        }
        return login;
    }

    public List<Empleado> getEmpleados() {
        return empleadoJPA.findEmpleadoEntities();
    }

    public void borrarEmpleado(int idEmpleado) throws NonexistentEntityException {
        int idUsuario = empleadoJPA.findEmpleado(idEmpleado).getUsuario().getId_usuario();
        empleadoJPA.destroy(idEmpleado);
        usuarioJPA.destroy(idUsuario);
        // Empleado tiene un Usuario adentro, entonces primero borramos empleado y 
        // luego el usuario. pero nos guardamos el id primero.
    }
}
