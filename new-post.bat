@echo off
chcp 65001 >nul

title JUKAI.SITE ~ 快速创建新文章
color 3

echo ==================================================
echo             JUKAI.SITE 新建文章向导
echo ==================================================
echo 当前工作目录：%cd%
echo 注意：请确保在 Hugo 站点的根目录下运行此脚本。
echo;

:INPUT_SLUG
set /p "slug=请输入文章的英数路径 (只用小写字母、数字和中划线): "

if "%slug%"=="" (
    echo [错误] 路径不能为空，请重新输入。
    echo;
    goto INPUT_SLUG
)

if exist "content\posts\%slug%" (
    echo [错误] 目录 "content\posts\%slug%" 已存在。
    echo 请重新输入一个不同的路径。
    echo;
    goto INPUT_SLUG
)

echo;
echo 正在生成页面包: content/posts/%slug%/ ...

hugo new "posts/%slug%/index.md"