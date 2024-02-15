---
title: 我的微信号
description: 在这里复制我的微信号
authors: [金圣皓]
date: 2024-01-01T10:11:15+08:00
showDate: false
---
{{< alert icon="wechat" iconColor="#2aa167">}}
<button type="button" id="cpy">***Karlukle***<div id="cpyd">点击复制</div></button>


<script src="https://cdn.staticfile.org/clipboard.js/2.0.4/clipboard.min.js"></script>

<script>
new ClipboardJS('#cpy', {
    text: function(trigger) {
        return "Karlukle";
    }
}).on('success', function(e) {
	// clearInterval(function);
   document.getElementById("cpyd").innerHTML="复制成功";
   e.clearSelection();
   setTimeout(function(){document.getElementById("cpyd").innerHTML="点击复制";},1000);
}).on('error', function(e) {
	// clearInterval(function);
    document.getElementById("cpyd").innerHTML="复制失败";
});
</script>
{{< /alert >}}