package main

import (
	"blog/controllers"
	_ "blog/routers"
	"github.com/astaxie/beego"
	_ "github.com/go-sql-driver/mysql"
	"blog/models"
)


func init() {
	models.Init()
	beego.BConfig.WebConfig.Session.SessionOn = true
}


func main() {
	beego.ErrorController(&controllers.ErrorController{})
	beego.Run()
}

