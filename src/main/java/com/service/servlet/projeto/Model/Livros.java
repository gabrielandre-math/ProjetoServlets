package com.service.servlet.projeto.Model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Livros {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String isbn;

    @Column(nullable = false, unique = true)
    private String nome;

    private int quantidade;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private Categorias categoria;

    public Livros(String isbn, String nome, Categorias categoria ,int quantidade) {
        this.isbn = isbn;
        this.nome = nome;
        this.quantidade = quantidade;
        this.categoria = categoria;
    }
}
