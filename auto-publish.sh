#!/usr/bin/env bash

printf '\033]0;JUKAI.SITE ~ Hugo自动部署脚本\007'

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit 1

echo "正在生成静态文件..."
echo "当前工作目录：$(pwd)"
echo

if ! hugo; then
    echo
    echo "Hugo 构建失败，已停止部署。"
    exit 1
fi

echo
echo "正在执行 git add..."
git add .

echo
echo "add 执行完毕！"
echo

# 避免“没有任何改动”时 git commit 报错
if git diff --cached --quiet; then
    echo "没有需要提交的新修改。"
else
    echo "正在执行默认 commit..."
    if ! git commit -m "routine update"; then
        echo "Git commit 失败，已停止部署。"
        exit 1
    fi
fi

echo
echo "正在将代码推到远程仓库 (github main)..."

if ! git push -u github main; then
    echo
    echo "Git push 失败。"
    exit 1
fi

echo
echo "部署完成！所有更新已推送到服务器。"
