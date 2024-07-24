package com.service.servlet.projeto.DB.DAO;

import com.service.servlet.projeto.DB.Model.Categorias;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAOImpl extends GenericDAO<Categorias> {

    @Override
    public boolean save(Categorias categoria) {
        String sql = "INSERT INTO categorias (nome) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, categoria.getNome());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Categorias> findAll() {
        List<Categorias> categorias = new ArrayList<>();
        String sql = "SELECT * FROM categorias ORDER BY id";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("id"));
                categoria.setNome(rs.getString("nome"));
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;
    }

    @Override
    public Categorias findById(Long id) {
        Categorias categoria = null;
        String sql = "SELECT * FROM categorias WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                categoria = new Categorias();
                categoria.setId(rs.getLong("id"));
                categoria.setNome(rs.getString("nome"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoria;
    }

    @Override
    public boolean update(Categorias categoria) {
        String sql = "UPDATE categorias SET nome = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, categoria.getNome());
            stmt.setLong(2, categoria.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Long id) {
        String sql = "DELETE FROM categorias WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
