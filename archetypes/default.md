---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false
language: zh-cn
isCJKLanguage: true
tags: [标签1,标签2,ZH-CN]
---  








































<!-- 背景图片需要放在文章目录下，命名为feature.xxx -->
{{< alert "music" >}}这里可以填提示{{< /alert >}}
{{<lead>}} "这里可以填引子 {{</lead>}}
{{< bilibili BV16J411q7MH >}}  
{{<blackbox>}}这是黑框里面的吐槽。{{</blackbox>}}

-------------

## 二级标题
### 三级标题
文章里必须要有撑满一整行的一段，否则Bilibili卡片不会放大显示。文章里必须要有撑满一整行的一段，否则Bilibili卡片不会放大显示。



[点击链接](https://www.jukai.site)



<!-- 图片——也可直接粘贴 -->
![图片替换文本](图片的链接)



~~删除线~~  



```html
<div class="demo">这里是代码块</div>
```  



>引用



被注文本[^尾注标记]
[^尾注标记]: 尾注（会出现在文章末尾，尾注上方会自动生成一条分隔线）



<!-- 下面是音乐播放器Aplayer↓ -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
<script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/meting@2.0.1/dist/Meting.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/color-thief@2.2.5/js/color-thief.min.js"></script>
<meting-js
    auto="https://music.163.com/#/song?id=1417631440"><!--这里填网易云歌曲链接 -->
</meting-js>
<!-- 以上音乐播放器 -->


其他短代码：  
{{< youtubeLite id="SgXhGb-7QbU" label="Blowfish-tools demo" >}}  



{{< article link="/posts/site-build/" showSummary=true compactSummary=true >}}  



{{< button href="#button" target="_self" >}}按钮{{< /button >}}  



{{< carousel images="{https://cdn.pixabay.com/photo/2016/12/11/12/02/mountains-1899264_960_720.jpg,https://cdn.pixabay.com/photo/2016/12/11/12/02/mountains-1899264_960_720.jpg,https://cdn.pixabay.com/photo/2016/12/11/12/02/mountains-1899264_960_720.jpg}" aspectRatio="21-9" interval="2500"  >}}  



{{< keyword >}}关键词1{{< /keyword >}}
{{< keyword >}}关键词2{{< /keyword >}}  



{{< typeit 
  tag=h3
  lifeLike=true
  speed=50
  breakLines=false
  loop=true
>}}
打字机打字机打字机打字机
{{< /typeit >}}  



{{< accordion mode="open" separated=true >}}
  {{< accordionItem title="Markdown example" icon="code" open=true >}}
  This item demonstrates Markdown rendering:
  - **Bold text**
  - Lists
  - `inline code`
  {{< /accordionItem >}}

  {{< accordionItem title="Shortcode example" md=false >}}
  This item demonstrates shortcode rendering with <code>md=false</code>:
  
  {{< alert >}}This is an inline alert.{{< /alert >}}
  {{< /accordionItem >}}
{{< /accordion >}}