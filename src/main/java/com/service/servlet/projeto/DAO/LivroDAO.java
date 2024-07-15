package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Livros;
import com.service.servlet.projeto.Model.Categorias;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO extends GenericDAO<Livros> {

    @Override
    public void save(Livros livro) {
        String sql = "INSERT INTO livros (isbn, nome, quantidade, categoria_id) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, livro.getIsbn());
            stmt.setString(2, livro.getNome());
            stmt.setInt(3, livro.getQuantidade());
            stmt.setLong(4, livro.getCategoria().getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Livros> findAll() {
        List<Livros> livros = new ArrayList<>();
        String sql = "SELECT l.*, c.nome as categoria_nome FROM livros l JOIN categorias c ON l.categoria_id = c.id";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Livros livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));

                livro.setCategoria(categoria);
                livros.add(livro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livros;
    }

    @Override
    public Livros findById(Long id) {
        Livros livro = null;
        String sql = "SELECT l.*, c.nome as categoria_nome FROM livros l JOIN categorias c ON l.categoria_id = c.id WHERE l.id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));

                livro.setCategoria(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livro;
    }

    @Override
    public void update(Livros livro) {
        String sql = "UPDATE livros SET isbn = ?, nome = ?, quantidade = ?, categoria_id = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, livro.getIsbn());
            stmt.setString(2, livro.getNome());
            stmt.setInt(3, livro.getQuantidade());
            stmt.setLong(4, livro.getCategoria().getId());
            stmt.setLong(5, livro.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Long id) {
        String sql = "DELETE FROM livros WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
