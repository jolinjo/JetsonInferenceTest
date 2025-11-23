#!/bin/bash

# 腳本說明: 啟動 dustynv/jetson-inference Docker 容器
# 標籤: r36.3.0 (對應 JetPack 6.0 GA)

# 執行 Docker run 指令
docker run -it --rm --runtime nvidia --network host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v /home/jetson/jetson-inference:/jetson-inference \
    dustynv/jetson-inference:r36.3.0 \
    /bin/bash
