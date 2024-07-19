#!/bin/bash
set -e

# Conectar ao banco de dados e verificar se a tabela existe
TABLE_EXISTS=$(psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -t -c "SELECT to_regclass('public.usuarios');")

# Se a tabela não existir, cria a tabela e popula o banco de dados com o arquivo CSV
if [ "$TABLE_EXISTS" = " " ]; then
    echo "Populating database with CSV data..."
    # Criação da tabela, adapte os tipos e nomes das colunas conforme necessário
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE categorias (id SERIAL PRIMARY KEY,nome VARCHAR(255));"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE images (id SERIAL PRIMARY KEY, nome VARCHAR(255) NOT NULL, data BYTEA NOT NULL);"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE usuarios (id SERIAL PRIMARY KEY, nome VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL UNIQUE, senha VARCHAR(255) NOT NULL, isAdmin BOOLEAN DEFAULT FALSE);"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "CREATE TABLE livros (id SERIAL PRIMARY KEY, isbn VARCHAR(255), nome VARCHAR(255), categoria_id INT, image_id INT,usuario_id INT,quantidade INT,CONSTRAINT categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id), CONSTRAINT image_id FOREIGN KEY (image_id) REFERENCES images(id), CONSTRAINT usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id));"
    # Importação do CSV
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\COPY categorias(nome) FROM '/docker-entrypoint-initdb.d/categorias.csv' DELIMITER ',' CSV HEADER;"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\COPY livros(isbn,nome,categoria_id,quantidade) FROM '/docker-entrypoint-initdb.d/livros.csv' DELIMITER ',' CSV HEADER;"
    echo "Database populated."
else
    echo "Database already populated."
fi
