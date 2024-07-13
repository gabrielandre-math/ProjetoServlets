package com.service.servlet.projeto.Model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Entity
@Getter
@Setter
@ToString
public class Livros {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String isbn;

    @Column(nullable = false)
    private String nome;

    private int quantidade;

    @OneToMany(mappedBy = "categorias", fetch = FetchType.EAGER)
    private List<Categorias> categorias;
}
