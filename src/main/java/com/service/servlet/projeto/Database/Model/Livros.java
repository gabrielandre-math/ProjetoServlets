package com.service.servlet.projeto.Database.Model;

import java.util.List;

public class Livros {
    private Long id;
    private String isbn;
    private String nome;
    private int quantidade;
    private Categorias categoria;
    private String imagem;
    private String novoVelho;
    private String status;
    private List<Usuarios> usuario;

    public Livros() {
    }

    public Livros(String isbn, String nome, Categorias categoria, int quantidade) {
        this.isbn = isbn;
        this.nome = nome;
        this.quantidade = quantidade;
        this.categoria = categoria;
    }

    public Livros(Long id, String isbn, String nome, int quantidade, Categorias categoria) {
        this.id = id;
        this.isbn = isbn;
        this.nome = nome;
        this.quantidade = quantidade;
        this.categoria = categoria;
    }

    public Livros(String isbn, String nome, int quantidade, Categorias categoria, String imagem, String novoVelho, String status, Usuarios usuario) {
        this.isbn = isbn;
        this.nome = nome;
        this.quantidade = quantidade;
        this.categoria = categoria;
        this.imagem = imagem;
        this.novoVelho = novoVelho;
        this.status = status;
    }

    public Livros(Long id) {
        this.id = id;
    }

    public Livros(String isbn) {
        this.isbn = isbn;
    }

    public Livros(Categorias categoria) {
        this.categoria = categoria;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Categorias getCategoria() {
        return categoria;
    }

    public void setCategoria(Categorias categoria) {
        this.categoria = categoria;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getNovoVelho() {
        return novoVelho;
    }

    public void setNovoVelho(String novoVelho) {
        this.novoVelho = novoVelho;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Usuarios> getUsuario() {
        return usuario;
    }

    public void setUsuario(List<Usuarios> usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return "Livros{" +
                "id=" + id +
                ", isbn='" + isbn + '\'' +
                ", nome='" + nome + '\'' +
                ", quantidade=" + quantidade +
                ", categoria=" + categoria +
                ", imagem='" + imagem + '\'' +
                ", novoVelho='" + novoVelho + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
