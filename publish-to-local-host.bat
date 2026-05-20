@echo off
chcp 65001 >nul

title JUKAI.SITE ~ 网站局域网预览
color 3


set "LAN_IP="
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i /c:"IPv4"') do (
    if not defined LAN_IP set "LAN_IP=%%i"
)

set "LAN_IP=%LAN_IP: =%"


if "%LAN_IP%"=="" set "LAN_IP=[获取失败，请手动查看IP]"
:: --------------------------------------------------

echo ==================================================
echo             JUKAI.SITE 局域网预览服务
echo ==================================================
echo 当前工作目录：%cd%
echo;

echo 正在启动 Hugo 局域网服务器...
echo;
echo 【访问提示】
echo 服务启动后，若要在其他局域网设备中查看，请输入以下地址预览：
echo http://%LAN_IP%:1313
echo ==================================================
echo;

hugo server --bind="0.0.0.0"

echo;
pause