package com.service.servlet.projeto.DAO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

import java.util.List;

public abstract class GenericDAO<T> {
    private EntityManagerFactory emf;

    public GenericDAO() {
        this.emf = Persistence.createEntityManagerFactory("my-persistence-unit");
    }

    public GenericDAO(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void save(T object) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao salvar", e);
        } finally {
            em.close();
        }
    }

    public void update(T object) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao atualizar", e);
        } finally {
            em.close();
        }
    }

    public void delete(T object) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            if (!em.contains(object)) {
                object = em.merge(object);
            }
            em.remove(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao excluir", e);
        } finally {
            em.close();
        }
    }

    public T findById(Class<T> entityClass, Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(entityClass, id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new PersistenceException("Erro ao buscar entidade pelo ID", e);
        } finally {
            em.close();
        }
    }

    public List<T> findAll(Class<T> entityClass) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("from " + entityClass.getSimpleName(), entityClass).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            throw new PersistenceException("Erro ao buscar todas as entidades", e);
        } finally {
            em.close();
        }
    }

    public void close() {
        if (emf.isOpen()) {
            emf.close();
        }
    }
}
