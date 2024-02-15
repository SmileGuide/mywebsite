---
title: 关系框图
description: 这里有我的世界观
authors: [金圣皓]
date: 2023-06-05T14:36:30+08:00
lastmod: 2023-06-05T14:36:30+08:00
draft: false
weight: 1
isCJKLanguage: true
tags: [世界观]
series: ["原创角色"]
series_order: 1
---
<script type="module">
  import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
</script>
<style>
/*@font-face{ 
  font-family: "NotoSerifJP";
  src:  url('../fonts/Noto_Serif_JP/NotoSerifJP-SemiBold.otf');
}
@font-face{ 
  font-family: "ZhiMangXing";
  src:  url('../fonts/Zhi_Mang_Xing/ZhiMangXing-Regular.ttf');
}
@font-face{ 
  font-family: "YujiSyuku";
  src:  url('../fonts/Yuji_Syuku/YujiSyuku-Regular.ttf');
}
@font-face{ 
  font-family: "ShipporiMincho";
  src:  url('../fonts/Shippori_Mincho/ShipporiMincho-Regular.ttf');
}
@font-face{ 
  font-family: "CastoroTitling";
  src:  url('../fonts/Castoro_Titling/CastoroTitling-Regular.ttf');
}*/


@import url('https://fonts.googleapis.com/css2?family=Castoro+Titling&family=Noto+Serif+JP:wght@200;300;400;500;600;700;900&family=Shippori+Mincho:wght@400;500;600;700;800&family=Yuji+Syuku&family=Zhi+Mang+Xing&display=swap');

font-family: 'Castoro Titling', cursive;
font-family: 'Noto Serif JP', serif;
font-family: 'Shippori Mincho', serif;
font-family: 'Yuji Syuku', serif;
font-family: 'Zhi Mang Xing', cursive;
</style>
## 人物架构
<div class="mermaid" align="middle">
	graph TD
	dad[[金丞旻]]:::jp-->hy
	mum((天野聖子)):::jp-->hy((" ")):::hybrid
	hy---->hero[[天野カルクル]]:::herojp
	hy---->brother[[天野風之助]]:::jp
	hy---->sister((天野未来)):::jp
	brother-.-.r1(兄 - 弟):::cont
	hero-.-.r1
	hero-.-.r2
	sister-.-.r2(兄 - 妹):::cont
	classDef hybrid fill:#C1DBDA
	classDef jp font-family:Yuji Syuku
	classDef herojp font-family:Yuji Syuku,fill:#FAE78A
	classDef cn font-family:Noto Serif JP
	classDef cont font-family:Noto Serif SC,font-weight:700,stroke-dasharray: 5 5,stroke-width:0px,fill:#f0f0f0
	click dad "/docs/myoc/characters/#chengmin"
	click mum "/docs/myoc/characters/#seiko"
	click hero "/docs/myoc/characters/#karlukle"
	click brother "/docs/myoc/characters/#hunosuke"
	click sister "/docs/myoc/characters/#mirai"
</div>
<div class="mermaid" align="right">
	graph TD
	subgraph 图例
		dad(" ")-->hy((" "))
	mum(" ")-->hy:::hybrid
	hy--" "-->he(" ")
	hy--婚配生子符号-->brother(" ")
	hy--" "-->sister(" ")
	lg1[[男]]-.-.relationship("【关系】"):::cont
	lg2((女))-.-.relationship
	hero[[主人公]]:::herojp
	end
	classDef cont stroke-dasharray: 5 5,stroke-width:0px,fill:#f0f0f0
	classDef herojp fill:#FAE78A
	classDef hybrid fill:#C1DBDA
</div>

## 世界观
<div class="mermaid" align="middle">
	graph LR
	earthlyworld[(地上世界)]:::world
	leafworld[(葉の世界)]:::world
	eltraveller([葉世旅人]):::onel--居于-->earthlyworld
	eltraveller--变于-->leafworld
	subgraph el[ ]
	earthlyworld2[(地上世界)]:::world--产-->husoul
	leafworld2[(葉の世界)]:::world--产-->leafsoul
	husoul[人間本霊]:::rei-.-eltraveller
	earthlyworld2--产-->tay
	tay([体]):::rei--化为-->eltraveller
	leafsoul[葉の本霊]:::rei-.-eltraveller
	end
	classDef one font-family:Yuji Syuku
	classDef onel font-family:Yuji Syuku
	classDef rei font-family:Shippori Mincho,font-weight:600
	classDef world font-family:Yuji Syuku,fill:#FAE78A
	click earthlyworld "/docs/myoc/pedia/#earthlyworld"
	click leafworld "/docs/myoc/pedia/#leafworld"
	click eltraveller "/docs/myoc/pedia/#eltraveller"
	click earthlyworld2 "/docs/myoc/pedia/#earthlyworld"
	click leafworld2 "/docs/myoc/pedia/#leafworld"
	click tay "/docs/myoc/pedia/#tay"
	click leafsoul "/docs/myoc/pedia/#leafsoul"
	click husoul "/docs/myoc/pedia/#husoul"
	</div>

## 时间线

<div class="mermaid" align="middle">
	%%{init: { 'logLevel': 'debug', 'theme': 'forest' } }%%
timeline
    2000年代 : 2000 金丞旻结识天野聖子
    	: 2005 金丞旻与天野聖子结婚
    	: 2007 天野風之助出生
    21世纪10年代 : 2013 天野カルクル出生
    	: 2014 &nbsp;&nbsp;&nbsp;天野未来出生
    	: 2019 &nbsp;&nbsp;&nbsp;外公去世，妹妹移居乡下
    21世纪20年代 : 2020 一家人移居,妹妹留守
    	: 2021&nbsp;&nbsp;&nbsp;叶世界之梦,天野未来去世
    	: 当前&nbsp;&nbsp;&nbsp;唯一不可阻挡的是时间...
</div>
<!--当前2022-->