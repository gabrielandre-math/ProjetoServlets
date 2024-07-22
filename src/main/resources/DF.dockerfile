# Use a imagem oficial do PostgreSQL
FROM postgres:latest

# Defina as variáveis de ambiente
ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password

# Copie o script de inicialização e o arquivo CSV para o contêiner
COPY init-db.sh /docker-entrypoint-initdb.d/
COPY livros.csv /docker-entrypoint-initdb.d/
COPY categorias.CSV /docker-entrypoint-initdb.d/

# Permitir execução do script
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
