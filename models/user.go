package models

import "time"

type User struct {
	Id int
	Username string
	Password string
	Email string
	LastTime time.Time
	Status int8
	Created time.Time
	Updated time.Time
}

func (m *User) TableName() string {
	return TableName("user")
}