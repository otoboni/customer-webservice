# Use a imagem oficial do Golang como base
FROM golang:alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /go/src/app

# Copie o código fonte da sua API para o diretório de trabalho
COPY . .

# Baixe e instale as dependências usando o go mod
RUN go mod download

# Compile o código da sua API
RUN go build -o main .

# Exponha a porta em que a API vai rodar
EXPOSE 3000

# Comando para executar a API quando o contêiner for iniciado
CMD ["./main"]
