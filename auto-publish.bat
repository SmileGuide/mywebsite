@echo off
 
title 群青流星~网站更新快捷发布
color 3
echo 当前目录：%cd%
echo;
 echo;
echo 开始add...
git add .
echo;
 
echo add完成!
echo;

:: set /p declation=请输入commit信息:
:: git commit -m "%declation%"
:: echo;
 
echo 正在commit...
git commit -m "routine update"
echo;

echo 正在将commit提交到远程服务器...
git push -u github main
echo;
 
echo 发布完毕！
echo;
 
pause