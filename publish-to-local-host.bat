@echo off
 
title 群青流星~网站局域网预览
color 3
echo 当前目录：%cd%
echo;
 
echo 正在发送指令...
hugo server --bind="0.0.0.0"
echo;