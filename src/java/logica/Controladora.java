package logica;

import java.util.Date;
import persistencia.ClienteJpaController;
import persistencia.ControladoraPersistencia;

public class Controladora {
    private ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearEmpleado(String nombre, String apellido, String direccion, 
            String dni, String nacionalidad, String celular, String email, String cargo,
            double sueldo, String nombreUsuario, String pass, Date fNac) {
        controlPersis.crearEmpleado(nombre,apellido,direccion,dni,nacionalidad,celular,email,cargo,
                                    sueldo,nombreUsuario,pass,fNac);
    }
    
    
    
    
    
}
