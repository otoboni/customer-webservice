package main

import (
	"github.com/gin-gonic/gin"
	"otoboni.com.br/customer-webservice/service"
)

func main() {
	router := gin.Default()
	router.GET("/customer", service.GetCustomers)
	router.GET("/customer/:id", service.GetCustomerById)
	router.POST("/customer", service.AddCustomer)
	router.PUT("/customer", service.UpdateCustomer)
	router.DELETE("/customer", service.DeleteCustomer)
	router.Run(":3000")
}
