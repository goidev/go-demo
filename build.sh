#!/bin/bash

docker build -t registry.cn-hangzhou.aliyuncs.com/applyimage/go-demo:v1 .

docker push registry.cn-hangzhou.aliyuncs.com/applyimage/go-demo:v1 .