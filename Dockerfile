# 使用官方的 Go 语言镜像作为基础镜像
FROM golang:1.21-alpine AS build

# 设置环境变量
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn

# 创建并设置工作目录
WORKDIR /app

# 复制源代码
ADD . .

RUN go mod tidy && go build -v -o go-demo .


# 使用更小的镜像作为运行环境
FROM alpine:latest

# 设置工作目录
WORKDIR /app/

# 从构建环境复制可执行文件到运行环境
COPY --from=build /app/go-demo .

# 声明服务端口
EXPOSE 8080

# 启动应用程序
CMD ["./go-demo"]