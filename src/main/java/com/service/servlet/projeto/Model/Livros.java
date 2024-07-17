package com.service.servlet.projeto.Model;

public class Livros {
    private Long id;
    private String isbn;
    private String nome;
    private int quantidade;
    private Categorias categoria;

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

    @Override
    public String toString() {
        return "Livros{" +
                "id=" + id +
                ", isbn='" + isbn + '\'' +
                ", nome='" + nome + '\'' +
                ", quantidade=" + quantidade +
                ", categoria=" + categoria +
                '}';
    }
}
