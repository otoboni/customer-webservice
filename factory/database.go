package factory

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

const (
	host     = "postgresql-service"
	port     = 5432
	user     = "postgres"
	password = "123456"
	dbanme   = "customers"
)

func ConnectToDb() (db *sql.DB) {

	conn := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbanme)

	db, err := sql.Open("postgres", conn)

	if err != nil {
		panic(err)
	}

	return db
}
