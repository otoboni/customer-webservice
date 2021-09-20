package model

type Customer struct {
	CustomerId   int    `json:"customerid"`
	Code         string `json:"code"`
	CustomerName string `json:"customername"`
	Email        string `json:"email"`
	Address      string `json:"address"`
	Phone        string `json:"phone"`
	City         string `json:"city"`
	Country      string `json:"country"`
}
