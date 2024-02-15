#!/bin/bash  

# 询问新建的md文件名  
read -p "请输入新的说说文件名（不包含.md扩展名）: " md_filename  

timestamp=$(TZ=UTC-8 date +"%Y-%m-%dT%H:%M:%S+08:00")  
full_md_filename="${md_filename}.md"


if [ -f "./${full_md_filename}" ];then
	echo "说说文件存在"
else
# 创建以UTC时间为时间戳的Markdown文件  
  
echo "已创建文件: ${full_md_filename}"  
touch "${full_md_filename}"  

# 以YAML格式写入文件头，包括UTC时间戳  
cat>"${full_md_filename}"<<EOF  
---  
date: "${timestamp}"  
---  
{{% memo title=标题 date=日期 time=时间 1=附加项1 %}}

这里写正文，支持Markdown和短代码

<!--{{< carousel images="图片链接1,图片链接2" >}}-->
{{% /memo %}}
EOF
xdg-open ${full_md_filename}
cd ..
# 写入 
sed -i "12c {{\\% include \"/shuoshuo-single/${full_md_filename}\" \\%}}" _index.md  
cd shuoshuo/
# 写入
sed -i "10a {{\\% include \"/shuoshuo-single/${full_md_filename}\" \\%}}" index.md  


fi