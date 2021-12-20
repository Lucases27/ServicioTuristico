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

    public boolean crearServicio(String nombre, String descripcion, String destino, Date fecha, double costo) {
        boolean alta = false;
        if(Validaciones.validaCampo(nombre)){
            if(Validaciones.validaCampo(descripcion)){
                if(Validaciones.validaCampo(destino)){
                    alta = controlPersis.crearServicio(nombre,descripcion,destino,fecha,costo);     
                }
            }
        }
        return alta;
    }

    public List<Servicio> getServicios() {
        return controlPersis.getServicios();
    }

    public void borrarServicio(int idServicio) throws NonexistentEntityException {
        controlPersis.borrarServicio(idServicio);
    }

    public Servicio getServicio(int idServicio) {
        return controlPersis.getServicio(idServicio);
    }

    public boolean modificarServicio(int idServicio, String nombre, String descripcion, String destino, double costo, Date fecha) throws Exception {
        boolean alta = false;
        if(Validaciones.validaCampo(nombre)){
            if(Validaciones.validaCampo(descripcion)){
                if(Validaciones.validaCampo(destino)){
                    controlPersis.modificarServicio(idServicio,nombre,descripcion,destino,costo,fecha);
                    alta = true;
                }
            }
        }
        return alta;
    }

    public Empleado getEmpleado(int idEmpleado) {
        return controlPersis.getEmpleado(idEmpleado);
    }

    public boolean modificarEmpleado(int idEmpleado, String nombre, String apellido, String direccion, String dni,
                                    String nacionalidad, String celular, String email, String cargo, double sueldo, Date fNac,
                                    String nombreUsuario, String pass) throws Exception {
        boolean alta = false;
        if(Validaciones.validaCampo(nombre)){
            if(Validaciones.validaCampo(apellido)){
                if(Validaciones.validaCampo(direccion)){
                    controlPersis.modificarEmpleado(idEmpleado,nombre,apellido,direccion,dni,nacionalidad,celular,email,cargo,sueldo,fNac,nombreUsuario,pass);
                    alta = true;
                }
            }
        }
        return alta;
    }
}
