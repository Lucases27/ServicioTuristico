package persistencia;

import java.util.Date;
import logica.Empleado;
import logica.Usuario;

public class ControladoraPersistencia {
    private ClienteJpaController clienteJPA = new ClienteJpaController();
    private EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    private PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    private ServicioJpaController servicioJPA = new ServicioJpaController();
    private UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    private VentaJpaController ventaJPA = new VentaJpaController();

    public void crearEmpleado(String nombre, String apellido, String direccion, String dni,
            String nacionalidad, String celular, String email, String cargo, double sueldo,
            String nombreUsuario, String pass, Date fNac) {
        
        Usuario usuario = new Usuario(nombreUsuario,pass);
        Empleado empleado = new Empleado(nombre,apellido,direccion,dni,fNac,nacionalidad,celular,
                                      email,cargo,sueldo,usuario);
        
        usuarioJPA.create(usuario);
        empleadoJPA.create(empleado);
    }
    
    
    
    
    
    
    
}
