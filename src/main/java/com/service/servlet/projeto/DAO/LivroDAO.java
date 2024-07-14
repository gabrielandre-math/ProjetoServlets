package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Categorias;
import com.service.servlet.projeto.Model.Livros;
import jakarta.persistence.EntityManagerFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

public class LivroDAO extends GenericDAO<Livros>{
    private static final String CSV_FILE_PATH = "C:\\Users\\luucc\\OneDrive\\Documentos\\GitHub\\ProjetoServlets\\livros.CSV";
    public LivroDAO() {
        super();
    }

    public LivroDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public void loadBooksFromCSV() {
        BufferedReader br = null;
        String line = "";
        String csvSplitBy = ",";

        try {
            // Obtém o arquivo CSV como um InputStream
            InputStream is = getClass().getResourceAsStream(CSV_FILE_PATH);
            br = new BufferedReader(new InputStreamReader(is));

            // Lê cada linha do arquivo CSV
            while ((line = br.readLine()) != null) {
                // Divide a linha em campos usando o separador ","
                String[] data = line.split(csvSplitBy);

                // Extrai os dados de cada campo
                String isbn = data[0].trim();
                String nome = data[1].trim();
                String cat = data[2].trim();
                String quantidade = data[3].trim(); // Ajuste conforme sua estrutura de CSV e entidade
                int qtd = quantidade.isEmpty() ? 0 : Integer.parseInt(quantidade);

                Categorias categoria = new Categorias();
                categoria.setNome(cat);

                // Cria uma instância de Livro com os dados extraídos
                Livros livro = new Livros(isbn, nome, categoria, qtd);

                // Salva o livro utilizando o método save do LivroDAO
                save(livro);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Fecha o BufferedReader no bloco finally para liberar recursos
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
