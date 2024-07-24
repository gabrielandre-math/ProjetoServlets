package com.service.servlet.projeto.DB.Model;

public class Categorias {
    private Long id;
    private String nome;

    public Categorias() {
    }

    public Categorias(String nome) {
        this.nome = nome;
    }

    public Categorias(Long id) {
        this.id = id;
    }

    public Categorias(Long id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Categoria: " +
                "\nID: " + id +
                " | Nome: " + nome;
    }
}
