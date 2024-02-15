#!/bin/bash  
echo "当前目录：$(pwd)"
echo
echo "正在发送指令..."
hugo server --bind="0.0.0.0"