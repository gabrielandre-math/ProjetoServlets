package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Categorias;
import jakarta.persistence.EntityManagerFactory;

public class CategoriaDAO extends GenericDAO<Categorias> {
    public CategoriaDAO() {
        super();
    }

    public CategoriaDAO(EntityManagerFactory emf) {
        super(emf);
    }
}
