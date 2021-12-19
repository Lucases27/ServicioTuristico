package logica;

import java.util.Date;
import persistencia.ClienteJpaController;
import persistencia.ControladoraPersistencia;
import persistencia.exceptions.NonexistentEntityException;

public class Controladora {
    private ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public boolean crearEmpleado(String nombre, String apellido, String direccion, 
            String dni, String nacionalidad, String celular, String email, String cargo,
            double sueldo, String nombreUsuario, String pass, Date fNac) throws NonexistentEntityException {
        return controlPersis.crearEmpleado(nombre,apellido,direccion,dni,nacionalidad,celular,email,cargo,
                                    sueldo,nombreUsuario,pass,fNac);
    }
    
    
    
    
    
}
