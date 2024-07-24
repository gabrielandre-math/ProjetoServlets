package com.service.servlet.projeto.Database.DAO;

import com.service.servlet.projeto.Database.Model.Livros;
import com.service.servlet.projeto.Database.Model.Usuarios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOImpl extends GenericDAO<Usuarios> {

    public UsuarioDAOImpl() {
        super();
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean save(Usuarios usuario) {
        String sql = "INSERT INTO usuarios (nome, email, senha, isadmin) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setBoolean(4, usuario.isAdmin());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Usuarios> findAll() {
        List<Usuarios> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getLong("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAdmin(rs.getBoolean("isAdmin"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    @Override
    public Usuarios findById(Long id) {
        Usuarios usuario = null;
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = new Usuarios();
                usuario.setId(rs.getLong("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAdmin(rs.getBoolean("isAdmin"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public Usuarios findByEmail(String email) {
        Usuarios usuario = null;
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = new Usuarios();
                usuario.setId(rs.getLong("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAdmin(rs.getBoolean("isAdmin"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    @Override
    public boolean update(Usuarios usuario) {
        String updateUsuarioSQL = "UPDATE usuarios SET nome = ?, email = ?, senha = ? WHERE id = ?";
        String deleteLivrosSQL = "DELETE FROM usuarios_livros WHERE usuario_id = ?";
        String insertLivrosSQL = "INSERT INTO usuarios_livros (usuario_id, livro_id) VALUES (?, ?)";

        try (PreparedStatement updateStmt = connection.prepareStatement(updateUsuarioSQL);
             PreparedStatement deleteStmt = connection.prepareStatement(deleteLivrosSQL);
             PreparedStatement insertStmt = connection.prepareStatement(insertLivrosSQL)) {

            connection.setAutoCommit(false); // Start transaction

            // Update user information
            updateStmt.setString(1, usuario.getNome());
            updateStmt.setString(2, usuario.getEmail());
            updateStmt.setString(3, usuario.getSenha());
            updateStmt.setLong(4, usuario.getId());
            updateStmt.executeUpdate();

            // Delete existing books associated with the user
            deleteStmt.setLong(1, usuario.getId());
            deleteStmt.executeUpdate();

            // Insert new books associated with the user
            for (Livros livro : usuario.getLivros()) {
                insertStmt.setLong(1, usuario.getId());
                insertStmt.setLong(2, livro.getId());
                insertStmt.addBatch();
            }
            insertStmt.executeBatch();

            connection.commit(); // Commit transaction
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback transaction on error
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
            return false;
        }
    }


    @Override
    public boolean delete(Long id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";
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
