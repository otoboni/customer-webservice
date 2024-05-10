package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"time"
)

type Customer struct {
	Code         string `json:"code"`
	CustomerName string `json:"customername"`
	Email        string `json:"email"`
	Address      string `json:"address"`
	Phone        string `json:"phone"`
	City         string `json:"city"`
	Country      string `json:"country"`
}

type Customers struct {
	Customers []Customer `json:"customers"`
}

func main() {
	// Define o número de clientes a serem gerados
	numCustomers := 100

	// Inicializa a semente do gerador de números aleatórios
	rand.Seed(time.Now().UnixNano())

	// Cria uma estrutura para armazenar os clientes
	var customers Customers

	// Gera clientes aleatórios e adiciona à estrutura
	for i := 1; i <= numCustomers; i++ {
		customer := Customer{
			Code:         generateUUID(),
			CustomerName: generateRandomString(10),
			Email:        generateRandomString(8) + "@" + generateRandomString(6) + ".com",
			Address:      generateRandomString(8) + " St.",
			Phone:        generateRandomPhoneNumber(),
			City:         generateRandomString(8),
			Country:      generateRandomString(8),
		}
		customers.Customers = append(customers.Customers, customer)
	}

	// Converte a estrutura para JSON
	jsonData, err := json.MarshalIndent(customers, "", "  ")
	if err != nil {
		fmt.Println("Erro ao converter para JSON:", err)
		return
	}

	// Escreve os dados JSON em um arquivo
	err = ioutil.WriteFile("customers.json", jsonData, 0644)
	if err != nil {
		fmt.Println("Erro ao escrever no arquivo:", err)
		return
	}

	fmt.Println("Arquivo customers.json gerado com sucesso.")
}

// Função para gerar um UUID aleatório
func generateUUID() string {
	b := make([]byte, 16)
	_, err := rand.Read(b)
	if err != nil {
		fmt.Println("Erro ao gerar UUID:", err)
		return ""
	}
	return fmt.Sprintf("%X-%X-%X-%X-%X", b[0:4], b[4:6], b[6:8], b[8:10], b[10:])
}

// Função para gerar uma string aleatória com o comprimento especificado
func generateRandomString(length int) string {
	const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	b := make([]byte, length)
	for i := range b {
		b[i] = charset[rand.Intn(len(charset))]
	}
	return string(b)
}

// Função para gerar um número de telefone aleatório
func generateRandomPhoneNumber() string {
	return fmt.Sprintf("1-%03d-%03d-%04d", rand.Intn(1000), rand.Intn(1000), rand.Intn(10000))
}
