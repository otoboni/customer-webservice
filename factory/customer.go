package factory

import (
	"database/sql"
	"fmt"
	"log"

	"otoboni.com.br/customer-webservice/model"
)

func GetCustomerById(id string) (model.Customer, error) {

	db := ConnectToDb()

	var cust model.Customer

	row := db.QueryRow("SELECT customerid, code, customername, email, address, phone, city, country FROM customer WHERE code = $1", id)

	defer db.Close()

	if err := row.Scan(&cust.CustomerId, &cust.Code, &cust.CustomerName,
		&cust.Email, &cust.Address, &cust.Phone, &cust.City, &cust.Country); err != nil {
		if err == sql.ErrNoRows {
			return cust, fmt.Errorf("GetById %s: customer not found", id)
		}
		return cust, fmt.Errorf("GetById %s: %s", id, err)
	}

	return cust, nil
}

func GetCustomer() ([]model.Customer, error) {

	db := ConnectToDb()

	var customers []model.Customer

	rows, err := db.Query("SELECT customerid, code, customername, email, address, phone, city, country FROM customer")

	if err != nil {
		return nil, fmt.Errorf("%s: %w", "Get", err)
	}

	defer rows.Close()
	defer db.Close()

	for rows.Next() {
		var cust model.Customer

		if err := rows.Scan(&cust.CustomerId, &cust.Code, &cust.CustomerName,
			&cust.Email, &cust.Address, &cust.Phone, &cust.City, &cust.Country); err != nil {
			return nil, fmt.Errorf("%s: %w", "Get", err)
		}
		customers = append(customers, cust)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("%s: %w", "Get", err)
	}

	return customers, nil
}

func AddCustomer(customer model.Customer) error {

	var cust model.Customer

	cust, err := GetCustomerById(customer.Code)

	if cust.Code != "" {
		log.Println(err)
		return fmt.Errorf("%s: %s", "Add: Customer already exists", cust.CustomerName)
	}

	db := ConnectToDb()

	tx, err := db.Begin()

	if err != nil {
		return fmt.Errorf("%s: %w", "Add", err)
	}

	_, err = tx.Exec("INSERT INTO customer (code, customername, email, address, phone, city, country, createdat) VALUES ($1, $2, $3, $4, $5, $6, $7, NOW())",
		customer.Code, customer.CustomerName, customer.Email, customer.Address, customer.Phone, customer.City, customer.Country)

	defer db.Close()

	if err != nil {
		tx.Rollback()
		return fmt.Errorf("%s: %w", "Add", err)
	}

	tx.Commit()

	return nil
}

func UpdateCustomer(customer model.Customer) error {

	var cust model.Customer

	cust, err := GetCustomerById(customer.Code)

	if err != nil {
		log.Println(cust)
		return fmt.Errorf("%s: %w", "Update", err)
	}

	db := ConnectToDb()

	_, err = db.Exec("UPDATE customer SET customername = $2, email = $3, address = $4, phone = $5, city = $6, country = $7, modifiedat = NOW() WHERE code = $1",
		customer.Code, customer.CustomerName, customer.Email, customer.Address, customer.Phone, customer.City, customer.Country)

	defer db.Close()

	if err != nil {
		return fmt.Errorf("%s: %w", "Update", err)
	}

	return nil
}

func DeleteCustomer(id string) error {

	var cust model.Customer

	cust, err := GetCustomerById(id)

	if err != nil {
		log.Println(cust)
		return fmt.Errorf("%s: %w", "Delete", err)
	}

	db := ConnectToDb()

	_, err = db.Exec("DELETE FROM customer WHERE code = $1", id)

	defer db.Close()

	if err != nil {
		return fmt.Errorf("%s: %w", "Delete", err)
	}

	return nil
}
