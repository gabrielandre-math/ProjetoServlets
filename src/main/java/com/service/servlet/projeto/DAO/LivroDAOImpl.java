package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Livros;
import com.service.servlet.projeto.Model.Categorias;
import com.service.servlet.projeto.Model.Usuarios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAOImpl extends GenericDAO<Livros> {

    @Override
    public boolean save(Livros livro) {

        String sql = "INSERT INTO livros (isbn, nome, categoria_id, novo_velho, status,quantidade, imagem) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, livro.getIsbn());
            stmt.setString(2, livro.getNome());
            stmt.setLong(3, livro.getCategoria().getId());
            stmt.setString(4, livro.getNovoVelho());
            stmt.setString(5, livro.getStatus());
            stmt.setInt(6, livro.getQuantidade());
            stmt.setString(7, livro.getImagem());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean saveUser(Usuarios usuario) {

        String sql = "INSERT INTO livros (usuario_id) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, usuario.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public List<Livros> findAll() {
        List<Livros> livros = new ArrayList<>();
        String sql = "SELECT l.*, c.nome as categoria_nome FROM livros l JOIN categorias c ON l.categoria_id = c.id ORDER BY ID";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Livros livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

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
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

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

    public boolean existsByName(String nome) {
        String sql = "SELECT COUNT(*) FROM livros WHERE nome = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, nome);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean update(Livros livro) {
        String sql = "UPDATE livros SET isbn = ?, nome = ?, novo_velho = ?, status = ?, quantidade = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, livro.getIsbn());
            stmt.setString(2, livro.getNome());
            stmt.setString(3, livro.getNovoVelho());
            stmt.setString(4,livro.getStatus());
            stmt.setInt(5, livro.getQuantidade());
            stmt.setLong(6, livro.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Long id) {
        String sql = "DELETE FROM livros WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Livros> getNewBook(){
        List<Livros> livros = new ArrayList<>();
        Livros livro = null;
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.novo_velho = ? AND l.status = ? " +
                "ORDER BY l.id DESC";
        try{PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,"Novo");
            stmt.setString(2,"Ativo");
            ResultSet rs = stmt.executeQuery();
            int i = 0;
            while (rs.next() && i < 4) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));
                livro.setCategoria(categoria);

                livros.add(livro);
                i++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return livros;
    }

    public List<Livros> getRecentBooks(){
        List<Livros> livros = new ArrayList<>();
        Livros livro = null;
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.status = ? " +
                "ORDER BY l.id DESC";
        try{PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,"Ativo");
            ResultSet rs = stmt.executeQuery();
            int i = 0;
            while (rs.next() && i < 4) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));
                livro.setCategoria(categoria);

                livros.add(livro);
                i++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return livros;
    }

    public List<Livros> getOldBooks(){
        List<Livros> livros = new ArrayList<>();
        Livros livro = null;
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.novo_velho = ? AND l.status = ? " +
                "ORDER BY l.id DESC";
        try{PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,"Velho");
            stmt.setString(2,"Ativo");
            ResultSet rs = stmt.executeQuery();
            int i = 0;
            while (rs.next() && i < 4) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));
                livro.setCategoria(categoria);

                livros.add(livro);
                i++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return livros;
    }

    public List<Livros> getAllRecentBooks(){
        List<Livros> livros = new ArrayList<>();
        Livros livro = null;
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.status = ? " +
                "ORDER BY l.id DESC";
        try{PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,"Ativo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));
                livro.setCategoria(categoria);

                livros.add(livro);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return livros;
    }

    public List<Livros> getAllNewBooks(){
        List<Livros> livros = new ArrayList<>();
        Livros livro = null;
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.novo_velho = ? AND l.status = ? " +
                "ORDER BY l.id DESC";
        try{PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,"Novo");
            stmt.setString(2,"Ativo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));
                livro.setCategoria(categoria);

                livros.add(livro);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return livros;
    }

    public List<Livros> getAllOldBooks(){
        List<Livros> livros = new ArrayList<>();
        Livros livro = null;
        String sql = "SELECT l.*, c.nome AS categoria_nome " +
                "FROM livros l " +
                "JOIN categorias c ON l.categoria_id = c.id " +
                "WHERE l.novo_velho = ? AND l.status = ? " +
                "ORDER BY l.id DESC";
        try{PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,"Velho");
            stmt.setString(2,"Ativo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                livro = new Livros();
                livro.setId(rs.getLong("id"));
                livro.setIsbn(rs.getString("isbn"));
                livro.setNome(rs.getString("nome"));
                livro.setQuantidade(rs.getInt("quantidade"));
                livro.setImagem(rs.getString("imagem"));
                livro.setNovoVelho(rs.getString("novo_velho"));
                livro.setStatus(rs.getString("status"));

                Categorias categoria = new Categorias();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setNome(rs.getString("categoria_nome"));
                livro.setCategoria(categoria);

                livros.add(livro);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return livros;
    }
}
