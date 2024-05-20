# 使用官方的 Go 语言镜像作为基础镜像
FROM golang:1.21

# 设置环境变量
ENV GO111MODULE=off

# 创建并设置工作目录
WORKDIR /app

# 将当前目录的内容复制到工作目录中
ADD go-demo .

# 声明服务端口
EXPOSE 8080

# 启动应用程序
ENTRYPOINT ["./go-demo"]
