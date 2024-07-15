package com.service.servlet.projeto.Model;

import java.util.Objects;

public class Usuarios {
    private Long id;
    private String nome;
    private String email;
    private String password;
    private boolean isAdmin;

    public Usuarios() {
    }

    public Usuarios(Long id) {
        this.id = id;
    }

    public Usuarios(String nome, String email, String password, boolean isAdmin) {
        this.nome = nome;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public Usuarios(String nome, String email, String password) {
        this.nome = nome;
        this.email = email;
        this.password = password;
    }

    public Usuarios(Long id, String nome, String email, String password) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.password = password;
    }

    public Usuarios(String password, String email) {
        this.password = password;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return "Usuário{" +
                "name='" + nome + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Usuarios)) return false;
        Usuarios user = (Usuarios) o;
        return Objects.equals(password, user.password) && Objects.equals(email, user.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(password, email);
    }
}
