@echo off
setlocal enabledelayedexpansion

:: 询问新建的md文件名
set /p "md_filename=请输入新的说说文件名(不包含.md扩展名): "

:: 获取当前时间戳(UTC-8时区)
for /f "tokens=1-4 delims=/:. " %%a in ('wmic OS Get localdatetime /value') do (
  set "timestamp=%%c-%%a-%%bT%%d:%%e:%%f+08:00"
)

:: 构建完整的md文件名
set "full_md_filename=%md_filename%.md"

:: 检查文件是否已存在
if exist "%full_md_filename%" (
  echo 说说文件存在
) else (
  :: 创建以UTC时间为时间戳的Markdown文件
  echo 已创建文件： %full_md_filename%
  touch "%full_md_filename%"

  :: 以YAML格式写入文件头，包括UTC时间戳
  echo --- >> "%full_md_filename%"
  echo date: "%timestamp%" >> "%full_md_filename%"
  echo --- >> "%full_md_filename%"
  echo {{% memo title=标题 date=日期 time=时间 1=附加项1 %}} >> "%full_md_filename%"
  echo 这里写正文，支持Markdown和短代码 >> "%full_md_filename%"
  echo <!--{{< carousel images="图片链接1,图片链接2" >}}--> >> "%full_md_filename%"
  echo {{% /memo %}} >> "%full_md_filename%"
  start notepad "%full_md_filename%"
  cd ..

  :: 写入 _index.md
  sed -i "12c {{\\% include \"/shuoshuo-single/%full_md_filename%\\" \\%}}" _index.md
  cd shuoshuo/

  :: 写入 index.md
  sed -i "10a {{\\% include \"/shuoshuo-single/%full_md_filename%\\" \\%}}" index.md
)