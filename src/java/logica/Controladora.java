package logica;

import java.util.Date;
import java.util.List;
import logica.util.Validaciones;
import persistencia.ClienteJpaController;
import persistencia.ControladoraPersistencia;
import persistencia.exceptions.NonexistentEntityException;

public class Controladora {
    private ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public boolean crearEmpleado(String nombre, String apellido, String direccion, 
            String dni, String nacionalidad, String celular, String email, String cargo,
            double sueldo, String nombreUsuario, String pass, Date fNac) throws NonexistentEntityException {
        boolean alta = false;
        if(Validaciones.validaCampo(nombre)){
            if(Validaciones.validaCampo(apellido)){
                if(Validaciones.validaCampo(direccion)){
                    if (Validaciones.validaCampo(nacionalidad)) {
                        if(Validaciones.validaCampo(cargo)){
                            if(Validaciones.validaCampo(nombreUsuario)){
                                if(Validaciones.validaCampo(pass)){
                                    if(Validaciones.validaEmail(email)){
                                        alta =  controlPersis.crearEmpleado(nombre,apellido,direccion,dni,nacionalidad,celular,email,cargo,
                                                                            sueldo,nombreUsuario,pass,fNac);
                                    }
                                }
                                
                            }
                        }
                        
                    }
                }
            }
        }
        return alta;
    }

    public boolean login(String user, String pass) {
        return controlPersis.login(user,pass);
    }

    public List<Empleado> getEmpleados() {
        return controlPersis.getEmpleados();
    }

    public void borrarEmpleado(int idEmpleado) throws NonexistentEntityException {
        controlPersis.borrarEmpleado(idEmpleado);
    }

    public boolean crearCliente(String nombre, String apellido, String direccion, String dni, String nacionalidad, String celular, String email, Date fNac) {
        boolean alta = false;
        if(Validaciones.validaCampo(nombre)){
            if(Validaciones.validaCampo(apellido)){
                if(Validaciones.validaCampo(direccion)){
                    if (Validaciones.validaCampo(nacionalidad)) {
                        if(Validaciones.validaEmail(email)){
                            alta = controlPersis.crearCliente(nombre,apellido,direccion,dni,nacionalidad,celular,email,fNac);
                        }
                    }            
                }
            }        
        }
        return alta;
    }

    public List<Cliente> getClientes() {
        return controlPersis.getClientes();
    }

    public void borrarCliente(int idCliente) throws NonexistentEntityException {
        controlPersis.borrarCliente(idCliente);
    }
}
