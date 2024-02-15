#!/bin/bash

echo "当前目录：$(pwd)"
echo 开始add...
git add .
echo add完成！
echo 正在commit...
git commit -m "routine update"
echo 正在将commit提交到远程服务器...
git push -u github main
echo 发布完毕！