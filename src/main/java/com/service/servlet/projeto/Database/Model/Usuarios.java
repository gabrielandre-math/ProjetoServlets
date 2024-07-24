package com.service.servlet.projeto.Database.Model;

import java.util.List;
import java.util.Objects;

public class Usuarios {
    private Long id;
    private String nome;
    private String email;
    private String senha;
    private boolean isAdmin;
    private List<Livros> livros;

    public Usuarios() {
    }

    public Usuarios(Long id) {
        this.id = id;
    }

    public Usuarios(String nome, String email, String senha, boolean isAdmin) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.isAdmin = isAdmin;
    }

    public Usuarios(String nome, String email, String senha) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
    }

    public Usuarios(Long id, String nome, String email, String senha, List<Livros> livros) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.livros = livros;
    }

    public Usuarios(String senha, String email) {
        this.senha = senha;
        this.email = email;
    }

    public Usuarios(String email) {
        this.email = email;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public List<Livros> getLivros() {
        return livros;
    }

    public void setLivros(List<Livros> livros) {
        this.livros = livros;
    }

    @Override
    public String toString() {
        return "Usuarios{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", email='" + email + '\'' +
                ", password='" + senha + '\'' +
                ", isAdmin=" + isAdmin +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Usuarios)) return false;
        Usuarios user = (Usuarios) o;
        return Objects.equals(senha, user.senha) && Objects.equals(email, user.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(senha, email);
    }
}
