package service

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"otoboni.com.br/customer-webservice/factory"
	"otoboni.com.br/customer-webservice/model"
)

func GetCustomers(c *gin.Context) {

	var customers []model.Customer

	customers, err := factory.GetCustomer()

	if err != nil {
		c.JSON(http.StatusInternalServerError,
			gin.H{"status": http.StatusInternalServerError, "error": err.Error()})
	} else {
		c.JSON(http.StatusOK, gin.H{"status": http.StatusOK, "customers": customers})
	}
}

func GetCustomerById(c *gin.Context) {

	id := c.Param("id")

	var customer model.Customer

	customer, err := factory.GetCustomerById(id)

	var statusCode = 0

	if customer.Code == "" {
		statusCode = 200
	} else {
		statusCode = 500
	}

	if err != nil {
		c.JSON(statusCode, gin.H{"status": statusCode, "error": err.Error()})
	} else {
		c.JSON(http.StatusOK, gin.H{"status": http.StatusOK, "customer": customer})
	}
}

func AddCustomer(c *gin.Context) {

	var customer model.Customer

	c.BindJSON(&customer)

	err := factory.AddCustomer(customer)

	if err != nil {
		c.JSON(http.StatusInternalServerError,
			gin.H{"status": http.StatusInternalServerError, "error": err.Error()})
	} else {
		c.JSON(http.StatusCreated,
			gin.H{"status": http.StatusCreated, "Customer": customer.CustomerName})
	}
}

func UpdateCustomer(c *gin.Context) {

	var customer model.Customer

	c.BindJSON(&customer)

	err := factory.UpdateCustomer(customer)

	if err != nil {
		c.JSON(http.StatusInternalServerError,
			gin.H{"status": http.StatusInternalServerError, "error": err.Error()})
	} else {
		c.JSON(http.StatusOK,
			gin.H{"status": http.StatusOK, "Customer updated": customer.CustomerName})
	}
}

func DeleteCustomer(c *gin.Context) {

	var customer model.Customer

	c.BindJSON(&customer)

	err := factory.DeleteCustomer(customer.Code)

	if err != nil {
		c.JSON(http.StatusInternalServerError,
			gin.H{"status": http.StatusInternalServerError, "error": err.Error()})
	} else {
		c.JSON(http.StatusOK,
			gin.H{"status": http.StatusOK, "Customer deleted": "OK"})
	}
}
