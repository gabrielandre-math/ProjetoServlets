package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Usuarios;
import jakarta.persistence.EntityManagerFactory;

public class UsuarioDAOImpl extends GenericDAO<Usuarios> {
    public UsuarioDAOImpl() {
        super();
    }

    public UsuarioDAOImpl(EntityManagerFactory emf) {
        super(emf);
    }
}
