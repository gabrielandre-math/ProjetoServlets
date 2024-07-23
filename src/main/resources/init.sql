CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(60) NOT NULL,
    isAdmin BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS livros (
    id SERIAL PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(120) NOT NULL UNIQUE,
    quantidade INT,
    categoria_id INT,
    image_id INT,
    usuario_id INT,
    CONSTRAINT categoria_id FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    CONSTRAINT image_id FOREIGN KEY (image_id) REFERENCES images(id),
    CONSTRAINT usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS images (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    data BYTEA NOT NULL
);

CREATE TABLE IF NOT EXISTS categorias(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE usuarios_livros (
    usuario_id INT,
    livro_id INT,
    PRIMARY KEY (usuario_id, livro_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);
