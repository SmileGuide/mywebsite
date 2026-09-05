#!/usr/bin/env bash

# 设置终端标题
printf '\033]0;JUKAI.SITE ~ 网站局域网预览\007'

# 如果从别处执行这个脚本，自动进入脚本所在目录
cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit 1

# 获取当前用于联网的 IPv4
LAN_IP=$(
    ip -4 route get 1.1.1.1 2>/dev/null |
    awk '{
        for (i = 1; i <= NF; i++) {
            if ($i == "src") {
                print $(i+1)
                exit
            }
        }
    }'
)

# 备用方法
if [[ -z "$LAN_IP" ]]; then
    LAN_IP=$(hostname -I 2>/dev/null | awk '{print $1}')
fi

if [[ -z "$LAN_IP" ]]; then
    LAN_IP="[获取失败，请手动查看 IP]"
fi

echo "=================================================="
echo "            JUKAI.SITE 局域网预览服务"
echo "=================================================="
echo "当前工作目录：$(pwd)"
echo
echo "正在启动 Hugo 局域网服务器..."
echo
echo "【访问提示】"
echo "服务启动后，若要在其他局域网设备中查看，请输入以下地址预览："
echo "http://${LAN_IP}:1313"
echo "=================================================="
echo

hugo server --bind="0.0.0.0"
