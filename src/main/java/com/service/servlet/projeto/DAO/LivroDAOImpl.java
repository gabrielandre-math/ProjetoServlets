package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Livros;
import jakarta.persistence.EntityManagerFactory;

public class LivroDAOImpl extends GenericDAO<Livros>{
    public LivroDAOImpl() {
        super();
    }

    public LivroDAOImpl(EntityManagerFactory emf) {
        super(emf);
    }
}
