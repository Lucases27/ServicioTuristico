/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Venta;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Paquete;
import logica.Servicio;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author Lucases
 */
public class PaqueteJpaController implements Serializable {

    public PaqueteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    public PaqueteJpaController( ) {
        emf = Persistence.createEntityManagerFactory("ServicioTuristicoPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Paquete paquete) {
        if (paquete.getLista_ventas() == null) {
            paquete.setLista_ventas(new ArrayList<Venta>());
        }
        if (paquete.getLista_servicios() == null) {
            paquete.setLista_servicios(new ArrayList<Servicio>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Venta> attachedLista_ventas = new ArrayList<Venta>();
            for (Venta lista_ventasVentaToAttach : paquete.getLista_ventas()) {
                lista_ventasVentaToAttach = em.getReference(lista_ventasVentaToAttach.getClass(), lista_ventasVentaToAttach.getNum_venta());
                attachedLista_ventas.add(lista_ventasVentaToAttach);
            }
            paquete.setLista_ventas(attachedLista_ventas);
            List<Servicio> attachedLista_servicios = new ArrayList<Servicio>();
            for (Servicio lista_serviciosServicioToAttach : paquete.getLista_servicios()) {
                lista_serviciosServicioToAttach = em.getReference(lista_serviciosServicioToAttach.getClass(), lista_serviciosServicioToAttach.getCodigo_servicio());
                attachedLista_servicios.add(lista_serviciosServicioToAttach);
            }
            paquete.setLista_servicios(attachedLista_servicios);
            em.persist(paquete);
            for (Venta lista_ventasVenta : paquete.getLista_ventas()) {
                Paquete oldPaqueteOfLista_ventasVenta = lista_ventasVenta.getPaquete();
                lista_ventasVenta.setPaquete(paquete);
                lista_ventasVenta = em.merge(lista_ventasVenta);
                if (oldPaqueteOfLista_ventasVenta != null) {
                    oldPaqueteOfLista_ventasVenta.getLista_ventas().remove(lista_ventasVenta);
                    oldPaqueteOfLista_ventasVenta = em.merge(oldPaqueteOfLista_ventasVenta);
                }
            }
            for (Servicio lista_serviciosServicio : paquete.getLista_servicios()) {
                lista_serviciosServicio.getLista_paquetes().add(paquete);
                lista_serviciosServicio = em.merge(lista_serviciosServicio);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Paquete paquete) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquete persistentPaquete = em.find(Paquete.class, paquete.getCodigo_paquete());
            List<Venta> lista_ventasOld = persistentPaquete.getLista_ventas();
            List<Venta> lista_ventasNew = paquete.getLista_ventas();
            List<Servicio> lista_serviciosOld = persistentPaquete.getLista_servicios();
            List<Servicio> lista_serviciosNew = paquete.getLista_servicios();
            List<Venta> attachedLista_ventasNew = new ArrayList<Venta>();
            for (Venta lista_ventasNewVentaToAttach : lista_ventasNew) {
                lista_ventasNewVentaToAttach = em.getReference(lista_ventasNewVentaToAttach.getClass(), lista_ventasNewVentaToAttach.getNum_venta());
                attachedLista_ventasNew.add(lista_ventasNewVentaToAttach);
            }
            lista_ventasNew = attachedLista_ventasNew;
            paquete.setLista_ventas(lista_ventasNew);
            List<Servicio> attachedLista_serviciosNew = new ArrayList<Servicio>();
            for (Servicio lista_serviciosNewServicioToAttach : lista_serviciosNew) {
                lista_serviciosNewServicioToAttach = em.getReference(lista_serviciosNewServicioToAttach.getClass(), lista_serviciosNewServicioToAttach.getCodigo_servicio());
                attachedLista_serviciosNew.add(lista_serviciosNewServicioToAttach);
            }
            lista_serviciosNew = attachedLista_serviciosNew;
            paquete.setLista_servicios(lista_serviciosNew);
            paquete = em.merge(paquete);
            for (Venta lista_ventasOldVenta : lista_ventasOld) {
                if (!lista_ventasNew.contains(lista_ventasOldVenta)) {
                    lista_ventasOldVenta.setPaquete(null);
                    lista_ventasOldVenta = em.merge(lista_ventasOldVenta);
                }
            }
            for (Venta lista_ventasNewVenta : lista_ventasNew) {
                if (!lista_ventasOld.contains(lista_ventasNewVenta)) {
                    Paquete oldPaqueteOfLista_ventasNewVenta = lista_ventasNewVenta.getPaquete();
                    lista_ventasNewVenta.setPaquete(paquete);
                    lista_ventasNewVenta = em.merge(lista_ventasNewVenta);
                    if (oldPaqueteOfLista_ventasNewVenta != null && !oldPaqueteOfLista_ventasNewVenta.equals(paquete)) {
                        oldPaqueteOfLista_ventasNewVenta.getLista_ventas().remove(lista_ventasNewVenta);
                        oldPaqueteOfLista_ventasNewVenta = em.merge(oldPaqueteOfLista_ventasNewVenta);
                    }
                }
            }
            for (Servicio lista_serviciosOldServicio : lista_serviciosOld) {
                if (!lista_serviciosNew.contains(lista_serviciosOldServicio)) {
                    lista_serviciosOldServicio.getLista_paquetes().remove(paquete);
                    lista_serviciosOldServicio = em.merge(lista_serviciosOldServicio);
                }
            }
            for (Servicio lista_serviciosNewServicio : lista_serviciosNew) {
                if (!lista_serviciosOld.contains(lista_serviciosNewServicio)) {
                    lista_serviciosNewServicio.getLista_paquetes().add(paquete);
                    lista_serviciosNewServicio = em.merge(lista_serviciosNewServicio);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = paquete.getCodigo_paquete();
                if (findPaquete(id) == null) {
                    throw new NonexistentEntityException("The paquete with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquete paquete;
            try {
                paquete = em.getReference(Paquete.class, id);
                paquete.getCodigo_paquete();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paquete with id " + id + " no longer exists.", enfe);
            }
            List<Venta> lista_ventas = paquete.getLista_ventas();
            for (Venta lista_ventasVenta : lista_ventas) {
                lista_ventasVenta.setPaquete(null);
                lista_ventasVenta = em.merge(lista_ventasVenta);
            }
            List<Servicio> lista_servicios = paquete.getLista_servicios();
            for (Servicio lista_serviciosServicio : lista_servicios) {
                lista_serviciosServicio.getLista_paquetes().remove(paquete);
                lista_serviciosServicio = em.merge(lista_serviciosServicio);
            }
            em.remove(paquete);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Paquete> findPaqueteEntities() {
        return findPaqueteEntities(true, -1, -1);
    }

    public List<Paquete> findPaqueteEntities(int maxResults, int firstResult) {
        return findPaqueteEntities(false, maxResults, firstResult);
    }

    private List<Paquete> findPaqueteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Paquete.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Paquete findPaquete(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Paquete.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaqueteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Paquete> rt = cq.from(Paquete.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
