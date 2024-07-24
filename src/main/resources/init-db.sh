#!/bin/bash
set -e

# Conectar ao banco de dados e verificar se a tabela existe
TABLE_EXISTS=$(psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -t -c "SELECT to_regclass('public.livros');")

# Se a tabela não existir, cria a tabela e popula o banco de dados com o arquivo CSV
if [ "$TABLE_EXISTS" = " " ]; then
    echo "Populating database with CSV data..."
    # Criação da tabela, adapte os tipos e nomes das colunas conforme necessário
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE categorias (id SERIAL PRIMARY KEY, nome VARCHAR(255));"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE usuarios (id SERIAL PRIMARY KEY, nome VARCHAR(120) NOT NULL, email VARCHAR(120) NOT NULL UNIQUE, senha VARCHAR(60) NOT NULL, isAdmin BOOLEAN DEFAULT FALSE);"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE livros (id SERIAL PRIMARY KEY, isbn VARCHAR(20), nome VARCHAR(120), imagem VARCHAR(30), novo_velho VARCHAR(10), status VARCHAR(10), categoria_id INT, usuario_id INT, quantidade INT, CONSTRAINT categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id), CONSTRAINT usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id));"
    # Importação do CSV
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\COPY categorias(nome) FROM '/docker-entrypoint-initdb.d/categorias.csv' DELIMITER ',' CSV HEADER;"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\COPY livros(isbn,nome,categoria_id,quantidade,imagem,novo_velho,status) FROM '/docker-entrypoint-initdb.d/livros.csv' DELIMITER ',' CSV HEADER;"

    # Criação Admin
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "INSERT INTO usuarios(nome, email, senha, isadmin) VALUES ('admin', 'admin@mail.com', 'admin321', true);"
    echo "Database populated."
else
    echo "Database already populated."
fi