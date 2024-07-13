package com.service.servlet.projeto.DAO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

import java.util.List;

public class GenericDAO<T> {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("my-persistence-unit");
    EntityManager em = emf.createEntityManager();

    public void save(T object){
        try{
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        }catch(Exception e){
            if(em.getTransaction().isActive()){
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao salvar", e);
        }
    }

    public void update(T object){
        try{
            em.getTransaction().begin();
            em.merge(object);
            em.getTransaction().commit();
        }catch(Exception e){
            if(em.getTransaction().isActive()){
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao atualizar", e);
        }
    }

    public void delete(T object){
        try{
            em.getTransaction().begin();
            if (!em.contains(object)) {
                object = em.merge(object);
            }
            em.remove(object);
            em.getTransaction().commit();
        }catch(Exception e){
            if(em.getTransaction().isActive()){
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao excluir", e);
        }
    }

    public T findById(Class<T> entityClass, Long id) {
        try {
            em.getTransaction().begin();
            T entity = em.find(entityClass, id);
            em.getTransaction().commit();
            return entity;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao buscar entidade pelo ID", e);
        }
    }

    public List<T> findAll(Class<T> entityClass) {
        try {
            em.getTransaction().begin();
            List<T> resultList = em.createQuery("from " + entityClass.getSimpleName(), entityClass).getResultList();
            em.getTransaction().commit();
            return resultList;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new PersistenceException("Erro ao buscar todas as entidades", e);
        }
    }

}
