package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Categorias;
import jakarta.persistence.EntityManagerFactory;

public class CategoriaDAOImpl extends GenericDAO<Categorias> {
    public CategoriaDAOImpl() {
        super();
    }

    public CategoriaDAOImpl(EntityManagerFactory emf) {
        super(emf);
    }
}
