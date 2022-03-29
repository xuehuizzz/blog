package controllers

import "github.com/astaxie/beego"
/**
  该控制器处理页面错误请求
 */
type ErrorController struct {
	beego.Controller
}


func (c *ErrorController) Error404() {
	c.Data["content"] = "很抱歉您访问的地址或者方法不存在"
	c.TplName = "blog/404.html"
}

