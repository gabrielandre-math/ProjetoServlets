package com.service.servlet.projeto.Model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Objects;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Usuarios {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String senha;

    private boolean isAdmin;

    public Usuarios(String password,String email){
        this.email = email;
        this.senha = password;
    }

    public Usuarios(String name,String password,String email){
        this.email = email;
        this.senha = password;
        this.nome = name;
    }

    public Usuarios(String email, String password, boolean isAdmin) {
        this.email = email;
        this.senha = password;
        this.isAdmin = isAdmin;
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

    // Se for usar, tirar do comentario
    /*@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(
            name = "usuario_livros",
            joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "livro_id")
    )
    private Set<Livros> livros;*/
}
