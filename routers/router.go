package routers

import (
	"blog/controllers"
	"github.com/astaxie/beego"
)

func init() {

	beego.Router("/", &controllers.BlogController{}, "*:Home")
	beego.Router("/home", &controllers.BlogController{}, "*:Home")

	beego.Router("/detail", &controllers.BlogController{}, "*:Detail")
	beego.Router("/about", &controllers.BlogController{}, "*:About")
	beego.Router("/comment", &controllers.BlogController{}, "post:Comment")

	beego.AutoRouter(&controllers.AdminController{})
}
