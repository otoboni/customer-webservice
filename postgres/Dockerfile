# Use a imagem oficial do PostgreSQL como base
FROM postgres:latest

# Defina variáveis de ambiente para configurar o banco de dados
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=123456
ENV POSTGRES_DB=customers

# Copie o arquivo SQL para dentro do contêiner
COPY init.sql /docker-entrypoint-initdb.d/

# Exponha a porta em que o PostgreSQL vai rodar (opcional)
EXPOSE 5432

# O comando CMD padrão do contêiner do PostgreSQL é adequado para iniciar o servidor
