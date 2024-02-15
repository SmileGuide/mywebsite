---
title: Relationship
description: My Creation of Worldview
date: 2023-06-05T14:36:30+08:00
lastmod: 2023-06-05T14:36:30+08:00
draft: false
weight: 1
isCJKLanguage: true
tags: [Worldviews]
series: [My Original Characters]
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
## Characters
<div class="mermaid" align="middle">
	graph TD
	dad[[Jin Chengmin]]:::jp-->hy
	mum((Seiko Amano)):::jp-->hy((" ")):::hybrid
	hy---->hero[[Karlukle Amano]]:::herojp
	hy---->brother[[Hunosuke Amano]]:::jp
	hy---->sister((Mirai Amano)):::jp
	brother-.-.r1(elder-younger brothers):::cont
	hero-.-.r1
	hero-.-.r2
	sister-.-.r2(elder brother - younger sister):::cont
	classDef hybrid fill:#C1DBDA
	classDef herojp fill:#FAE78A
	classDef cont font-weight:700,stroke-dasharray: 5 5,stroke-width:0px,fill:#f0f0f0
	click dad "/en/docs/myoc/characters/#chengmin"
	click mum "/en/docs/myoc/characters/#seiko"
	click hero "/en/docs/myoc/characters/#karlukle"
	click brother "/en/docs/myoc/characters/#hunosuke"
	click sister "/en/docs/myoc/characters/#mirai"
</div>
<div class="mermaid" align="right">
	graph TD
	subgraph Legends
		dad(" ")-->hy((" "))
	mum(" ")-->hy:::hybrid
	hy--" "-->he(" ")
	hy--Matchmaking and Childbirth Symbol-->brother(" ")
	hy--" "-->sister(" ")
	lg1[[Male]]-.-.relationship("【relationship】"):::cont
	lg2((Female))-.-.relationship
	hero[[the Protagonist]]:::herojp
	end
	classDef cont stroke-dasharray: 5 5,stroke-width:0px,fill:#f0f0f0
	classDef herojp fill:#FAE78A
	classDef hybrid fill:#C1DBDA
</div>

## World View

<div class="mermaid" align="middle">
	graph LR
	earthlyworld[(Earthly World)]:::world
	leafworld[(Leaf World)]:::world
	eltraveller([E-L Traveller]):::onel--lives in-->earthlyworld
	eltraveller--transforms in-->leafworld
	subgraph el[ ]
	earthlyworld2[(Earthly World)]:::world--产-->husoul
	leafworld2[(Leaf World)]:::world--产-->leafsoul
	husoul[Mankind Motosoul]:::rei-.-eltraveller
	earthlyworld2--gives birth to-->tay
	tay([Tai]):::rei--becomes-->eltraveller
	leafsoul[Leaf Motosoul]:::rei-.-eltraveller
	end
	classDef world fill:#FAE78A
	click earthlyworld "/en/docs/myoc/pedia/#earthlyworld"
	click leafworld "/en/docs/myoc/pedia/#leafworld"
	click eltraveller "/en/docs/myoc/pedia/#eltraveller"
	click earthlyworld2 "/en/docs/myoc/pedia/#earthlyworld"
	click leafworld2 "/en/docs/myoc/pedia/#leafworld"
	click tay "/en/docs/myoc/pedia/#tay"
	click leafsoul "/en/docs/myoc/pedia/#leafsoul"
	click husoul "/en/docs/myoc/pedia/#husoul"
	</div>

## Timeline

<div class="mermaid" align="middle">
	%%{init: { 'logLevel': 'debug', 'theme': 'forest' } }%%
timeline
    2000s : 2000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chengmin Met Seiko
    	: 2005&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chengmin Married Seiko
    	: 2007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hunosuke Was Born
    2010s: 2013&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Marlukle Was Born
    	: 2014&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mirai Was Born
    	: 2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Grandma passed away, Mirai Moved to Countryside
    2020s : 2020&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The family moved to Dalian, with Mirai left
    	: 2021&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Dream of Leaf World, Mirai died
    	: Present&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What can't be stopped is only time...
</div>
<!--当前2022-->