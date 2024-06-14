package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.POST("/api/argocd/notification", func(ctx *gin.Context) {
		// 获取原始请求体数据
		body, err := ctx.GetRawData()
		if err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// 打印接收到的原始数据
		fmt.Println(string(body))

		// 返回响应
		ctx.JSON(http.StatusOK, gin.H{"message": "Data received successfully"})
	})

	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
