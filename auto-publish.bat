@echo off
chcp 65001 >nul

title JUKAI.SITE ~ Hugo自动部署脚本
color 3

echo 正在生成静态文件...
hugo 
echo 当前工作目录：%cd%
echo;
echo;

echo 正在执行 git add...
git add .
echo;
echo add 执行完毕！
echo;

echo 正在执行默认 commit...
git commit -m "routine update"
echo;

echo 正在将代码推到远程仓库 (github main)...
git push -u github main
echo;

echo 部署完成！所有更新已推送到服务器。
echo;

pause