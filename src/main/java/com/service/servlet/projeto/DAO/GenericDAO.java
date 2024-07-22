package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.DB.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class GenericDAO<T> {
    protected Connection connection;

    public GenericDAO() {
        this.connection = DBConnection.getConnection();
    }

    public abstract boolean save(T entity);

    public abstract List<T> findAll();

    public abstract T findById(Long id);

    public abstract void update(T entity);

    public abstract void delete(Long id);

    public void close() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
