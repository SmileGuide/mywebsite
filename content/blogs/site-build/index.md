---
title: "关于本站的建造"
date: 2024-02-02T09:57:23+08:00
draft: false
showWordCount: true
isCJKLanguage: true
tags: ["技术"]
---
{{< lead >}}这里在技术上梳理了本站的建造流程及一些功能的实现方法。{{</ lead >}}  
 
## 前端框架
### Hugo
本站前端采用静态网站生成器 [Hugo](https://gohugo.io/) 制作，所用主题为 [Blowfish](https://blowfish.page/)。
Blowfish 是[Nuno Coração](https://n9o.xyz/) 建设维护的，文档为英文。
[Blowfish 文档](https://blowfish.page/docs/) 内详细说明了 Hugo 和主题的使用方法，这里不再赘述。
### GitHub Pages
本站前端部署在 [GitHub Pages](https://pages.github.com/) 上。
{{< alert >}}如果你所在地区GitHub访问受限，需要自行准备梯子。你也可以使用国内的 Gitee Pages，但缺点是需备案，需实名认证，内容需审核。{{</ alert >}}  

为部署网页，你需要先安装 [Git](https://git-scm.com/) ，然后在 [GitHub](https://github.com/)  上添加本地SSH密钥。

在[GitHub](https://github.com/)上建立一个名为 `<账号>.github.io` 的公有 Repo 作为网页文件的容器，再建立一个名称随意的私有 Repo 作为网站 Hugo 源文件的容器。把本地用 Hugo 写好的文件提交到私有 Repo 中，然后用 GitHub Actions 把私有 Repo 链接到公有 Repo 。

### GitHub Actions

[GitHub Actions](https://docs.github.com/zh/actions) 是 GitHub 提供的自动化服务。它会把私有 Repo 中的源文件在服务器中用 Hugo 自动生成网页文件，而不用我们在本地执行`hugo`指令，再把`public`文件夹中的网页文件提交到公有 Repo。这样我们再更新网站内容时需要运行的指令更少，省时省力。

要配置 GitHub Actions，你需要在本地网站根目录新建`.github/workflows/hugo.yaml`，把以下内容写到YAML文件里。

```yaml
name: Action名称 #自定义名称
on:
  push:
    branches:
      - main
jobs:
  build-deploy:
#    runs-on: ubuntu-20.04
    runs-on: ubuntu-22.04
    steps:
      - name: Check out source
        uses: actions/checkout@v2

      - name: Setup hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: "0.121.2" 
          # 修改为你使用的 Hugo 版本
          extended: true 
          # 设置是否需要 extended 版本

      - name: Build
        run: hugo

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          personal_token: ${{ secrets.PERSONAL_TOKEN }}
          external_Repository: SmileGuide/smileguide.github.io 
          # 修改为你的公有Repo
          publish_dir: ./public
          publish_branch: main

```


然后为 GitHub Actions 新配置一个SSH密钥
```sh
ssh-keygen -t rsa - -C "$(git config user.email)"
# 不能直接回车，输入新路径以免覆盖原来的密钥
```
到你输入的路径复制公钥(`id_rsa.pub`)，在公有 Repo 中点击 `Setting - Deploy keys - Add deploy key`，名称随意，勾选 Allow write access 后保存。 

复制私钥(`id_rsa`)，到私有 Repo 中点击`Setting - Secrets - New Repo Secrets` ，名称必须设为`ACTIONS_DEPLOY_KEY`，粘贴私钥。

配置你的网站主页，写写帖子，接着 `push` 一下本地仓库。

提交代码之后，GitHub Actions 会根据源码，用 Hugo 自动生成网页，并发布到公有 Repo ，这又会触发 GitHub Pages 的 Action。

现在便完成了 GitHub Pages 的自动发布配置。此后，你只要持续提交源码到私有 Repo，网站就会自动发布。


### Vercel   
鉴于部署平台 Vercel 性能优于 GitHub Pages，2月15日起本站所有页面均部署于 Vercel，弃用GitHub Pages。  
然而，使用 Vercel 的前提是你拥有一个域名，然后给 Vercel 工程设置自定义域名，因为 Vercel 提供的子域名被GFW进行了DNS污染。  
--更新于2024/2/18--


## 评论系统和浏览量统计
本站采用带后端的评论系统 [Waline](https://waline.js.org/) ，但完全免费。

### LeanCloud

在配置 Waline 前，你需要配置 LeanCloud 数据库。

注册 LeanCloud 国际版账号，创建开发版应用，名称随意。这将是你网站的评论数据库。

### 服务端配置

本网站先是使用免费的部署平台 Deta（没有被墙且速度较快），在注册域名后使用免费的 Vercel 部署评论前端。你也可以使用别的平台，Waline 官网有介绍。


#### 后端
注册 Deta 账号，然后到 [Deta 应用市场 Waline 页](https://deta.space/discovery/@lizheming/waline) ，点击 Install on Space 安装应用到工作区。

安装完成后可在 [工作区](https://deta.space/) 看到应用。点击应用左上角的小圆圈，进入 `Settings - Configuration` 修改环境变量，把`LEAN_ID、lEAN_KEY`和`LEAN_MASTER_KEY`设置为LeanCloud `设置 - 应用凭证`中的`AppID`、`AppKey`和`MasterKey`。

现在便完成了评论后端的基本配置。

#### 前端
这是需要修改 Hugo 主题的操作，但不是直接进入 `themes` 文件夹修改，而是将要替换的文件放在 `layouts` 文件夹里，因为主题更新后会换掉直接修改的文件。

在`layouts`文件夹中创建`partials/comments.html`。

进入 Deta 工作区，点击应用左上角的小圆圈，点击 Open App 进入 Waline 应用服务端，复制链接。这是你即将填入源码的 `ServerURL` 。

以下是本站评论的源码，除了填入 `ServerURL` ，你也可以根据需要自行修改，再填入`comments.html`中。


```html
<br/>
<span style="color:rgba(var(--color-neutral-400),var(--tw-text-opacity));">
    <span class="post-meta-item-text" >&nbsp;&nbsp;文章阅读量:  </span>
    <span class="waline-pageview-count">⏳</span><div></div><br/>
</span>
<script type="text/javascript">
      document.getElementByClassName("aline-pageview-count")[0].data-path = window.location.pathname;
</script>
<script src='//unpkg.com/@waline/client@v2/dist/waline.js'></script>
<link href='//unpkg.com/@waline/client@v2/dist/waline.css' rel='stylesheet' />
<div id="vcomments"></div>
  <script>
    if ({{i18n "lanString"}}=="zh-CN") {
                    Waline.init({
            el: '#vcomments',
           serverURL: '自行填入',
           emoji: ['https://valine-emoji.bili33.top/bilibilitv','https://valine-emoji.bili33.top/bilibiliHotKey','https://valine-emoji.bili33.top/Tieba-New','https://valine-emoji.bili33.top/weibo',],
           meta:['nick', 'mail'],
           pageview: true,
           reaction: true,
           lang: "zh-CN",
           locale: {
          reactionTitle: '•畅所欲言——这里是开放区•',
          comment: '留言板',
          placeholder: '点击下方登录后再评论，会有惊喜哦~',
          gifSearchPlaceholder: '搜索表情包...',
          admin: '作者',
          sofa: '还没有人评论，快来抢沙发吧',
          anonymous: '匿名者'
        }
          });

    } 
    else {
                Waline.init({
            el: '#vcomments',
           serverURL: 'https://waline-1-e5403272.deta.app/',
           emoji: ['https://valine-emoji.bili33.top/bilibilitv','https://valine-emoji.bili33.top/bilibiliHotKey','https://valine-emoji.bili33.top/Tieba-New','https://valine-emoji.bili33.top/weibo',],
           meta:['nick', 'mail'],
           pageview: true,
           reaction: true,
           lang:{{i18n "lanString"}},
          });

    }
  document.getElementsByClassName('wl-power')[0].style.display = 'none';
      document.querySelector(".wl-actions a").style.display = 'none'
  </script>
  <style type="text/css">
    :root{
      --waline-color: var(--tw-prose-quotes);
      --waline-info-color: var(--tw-prose-quotes);
      --waline-info-bgcolor: var(--tw-ring-color);
      --waline-theme-color: rgba(var(--color-primary-400));
      --waline-bgcolor: transparent;
      --waline-border-color: #747474;
    }
    .wl-editor:focus, .wl-input:focus {
    background: transparent;
        }
    .wl-editor,.wl-input{
      max-width:88%;
    }
    .wl-reaction-item.active .wl-reaction-votes {
    color: white;
    }
  </style>

```
打开`config/params.toml`,在`article`中加入`showComments = true`  

在网站根目录运行命令行，使用`hugo server`命令，你就可以在`localhost:1313`看到你网站上已经出现了评论区和浏览量统计。  
（使用`hugo server --bind="0.0.0.0"`可以在局域网创建预览）






接下来配置主页浏览量统计。  
把`themes/partials/footer.html`复制到`layouts/partials/`下,在第 17 行加入以下代码(填入`ServerURL`，按需修改)：
```html
{{ if eq .IsHome true }}  
  <span class="text-sm text-neutral-500 dark:text-neutral-400">
  {{i18n "footer.visitors"}}
    <span class="waline-pageview-count" data-path="/" id="pagec">——</span>
  </span>
  <script type="module">
    import { pageviewCount } from 'https://unpkg.com/@waline/client/dist/pageview.js';
    pageviewCount({
      serverURL: '自行填入',
      path: '/',
    });
</script>
<script type="text/javascript">
    var pagect = document.getElementById('pagec');
var observer = new MutationObserver(function(){
      var itl,itll;
      var element = document.getElementById("pagec");  
      observer.disconnect();
      itl  = element.innerText;
      itll = Number(itl).toLocaleString();
      document.getElementById('pagec').innerHTML = itll;
});
var article = document.getElementById('pagec');

var options = {
  'childList': true,
    'subtree': true
};

observer.observe(article, options);
</script>
{{ else }}  
{{ end }}
```

## 悬浮播放器

本网站的悬浮播放器可以跨网页播放，配置方法如下。


### 后端

本站播放器的原方案是：在LeanCloud `数据存储 - 文件` 中上传音频文件、专辑封面文件。歌词文件放在`static`文件夹下，以便直接引用。  

然而，这种部署方式仅运行两天就出现欠费的情况，于是改用直链工具：[涟漪文件直链](https://up.ly93.cc/)。


### 前端
把`themes/header/basic.html`复制到`layouts/header/`下,在第 17 行加入以下代码：


```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
<script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
<div id="aplayera" style="opacity:0.8;color: var(--tw-prose-headings);"></div>
<script type="text/javascript">
  const ap = new APlayer({
    container: document.getElementById('aplayera'),
        fixed: true,
        lrcType: 3,
        order: 'random',
    audio: [{
        name: '正解(混声三部合唱)',
        artist: 'RADWIMPS',
        url: 'https://lc-gluttony.s3.amazonaws.com/dRYJBlSN7EF3/EN2sSlJjrTnrwt7422opBQzuYtwgKUxG/RADWIMPS%20-%20%E6%AD%A3%E8%A7%A3%20%28%E6%B7%B7%E5%A3%B0%E4%B8%89%E9%83%A8%E5%90%88%E5%94%B1%29.flac',
        cover: 'https://lc-gluttony.s3.amazonaws.com/dRYJBlSN7EF3/VoCPlwWAoRbycMbMpkk8rO3nFSY2RvVe/%E6%AD%A3%E8%A7%A3.jpg',
        lrc: 'https://lc-gluttony.s3.amazonaws.com/dRYJBlSN7EF3/81GxLoRdTXmyBp7NCYPQNAhh6LT22Fku/RADWIMPS%20-%20%E6%AD%A3%E8%A7%A3%20%28%E6%B7%B7%E5%A3%B0%E4%B8%89%E9%83%A8%E5%90%88%E5%94%B1%29.lrc'
    },
        {
        name: '蝶々結び',
        artist: 'Aimer',
        url: 'https://lc-gluttony.s3.amazonaws.com/dRYJBlSN7EF3/ofE4yX5UYy3zpMaNwt6nRnWQd0sIP4xi/Aimer%20-%20%E8%9D%B6%E3%80%85%E7%B5%90%E3%81%B3.flac',
        cover: 'https://lc-gluttony.s3.amazonaws.com/dRYJBlSN7EF3/OQaFrdqT2Yiuzcmtx2uIlsLG8GjD6ok3/%E8%9D%B6%E3%80%85%E7%B5%90%E3%81%B3.jpg',
        lrc: 'https://lc-gluttony.s3.amazonaws.com/dRYJBlSN7EF3/r1HTik6Im5Bzuvfo7JQiAMIEoBqs2m7I/Aimer%20%28%E3%82%A8%E3%83%A1%29%20-%20%E8%9D%B6%E3%80%85%E7%B5%90%E3%81%B3%20%28%E8%9D%B4%E8%9D%B6%E7%BB%93%29.lrc'
    },
    ]
});

        ready();
    
    isRecover = false;
    function ready(){
        ap.on('canplay', function () {
            if(!isRecover){
                if(localStorage.getItem("musicIndex") != null){
                    musicIndex = localStorage.getItem("musicIndex");
                    musicTime = localStorage.getItem("musicTime");
                    if(ap.list.index != musicIndex){
                        ap.list.switch(musicIndex);
                    }else{
                        ap.seek(musicTime);
                        ap.play();
                        localStorage.clear();
                        ap.setAttribute(muted,'');
                        ap.setAttribute(playsinline,'');
                        isRecover = true;
                    }
                }else{
                    isRecover = true;
                }
            }
        });
    }

    window.onbeforeunload = function(event) {
        if(!ap.audio.paused){
            musicIndex = ap.list.index;
            musicTime = ap.audio.currentTime;
            localStorage.setItem("musicIndex",musicIndex);
            localStorage.setItem("musicTime",musicTime);
        }
    };



var element = document.getElementsByClassName("aplayer-title")[0];  
$(element).wrap("<a href='{{i18n "pathAppendix"}}/radio/pick/'></a>");
</script>





<style type="text/css">
    .aplayer-title, .aplayer-list-light {
        color:#000000cc;
    }
    .aplayer-list{
        color:#717070bf;
    }
</style>
```

现在你可以看到效果了。要换成自己上传的音乐，需把代码中`audio`的`name(歌曲名), artist(艺术家), url(音频地址 从LeanCloud复制), cover(专辑封面地址), lrc(歌词文件地址)`做更改。`audio` 属性的结构如下：
```yaml
    audio: [{
        name: '',
        artist: '',
        url: '',
        cover: '',
        lrc: ''
    },
        {
        name: '',
        artist: '',
        url: '',
        cover: '',
        lrc: ''
    },
    ],
```
悬浮播放器的原理是：在退出网页时，如果音频处于播放状态，则在缓存中存储进度，新网页打开时，检查是否有缓存，若有则恢复播放。这个功能在苹果设备中不受支持。  


## 说说
本站的说说是一个把众多用 Markdown 写成的短篇图文组织到一页的功能，原理是创建两个自定义短代码 include 和 memo（源码在`/layouts/shortcodes`中）。
前者使用了Hugo的新特性，从指定路径获取渲染好的HTML并放置在页面上；后者是一个支持在内部写入 Markdown 和短代码的`<span>`元素。  
另外，说说页的布局也做了个性化修改（见`/layouts/partials`），我还写了一个自动新建说说的 Shell 脚本（在`/content/shuoshuo-single/`中）。  

具体请见本站 Hugo 源代码仓库：
{{< github repo="SmileGuide/mywebsite" >}}


--更新于2024/2/12--  
## 看板娘
看板娘一词源于日语，是店铺为吸引人气而设置的形象代言。  
页面右下角的人偶即为本站的「数字看板娘」。它源于GitHub上的开源项目：
{{< github repo="stevenjoezhang/live2d-widget" >}}  
具体来说，该插件有两部分需要配置。 
### 页面引用
首先，你需要克隆上述 Repo，放在`static`文件夹中，然后按照README文件进行自定义。  
像前文所述的一样，在`/layouts/`中拷贝相应的主题文件。我拷贝的是`footer.html`。  
在该文件适当位置加入 JavaScript 引用：
```diff
<footer id="site-footer" class="py-10 print:hidden">

+ <script src="/live2d/autoload.js"></script>

  {{/* Footer menu */}}
  {{ if .Site.Params.footer.showMenu | default true }}
    {{ if .Site.Menus.footer }}

```
请仔细阅读项目的README文件以了解如何自定义（如修改气泡提示文本、CSS等），这里不赘述。  
### API
你可以使用该项目的官方API地址，但是更推荐在 Vercel 上部署一个，以便自定义模型。
先克隆（或者复刻）下面的 Repo 到本地：  
{{< github repo="fghrsh/live2d_api" >}}  
由于 Vercel 无法识别根目录不带 `index.html` 的项目，你需要新建一个，里面可以写一写介绍等。  
在目录中，`model_list.json` 用于描述有哪些模型。如果要添加模型，请把模型放在`model`目录中，并检查新加的模型的目录中的JSON文件是否更名为 `index.json`，然后改写 Repo 根目录中的 `model_list.json` 以便识别新模型。  
修改完毕后，把 Repo 提交到 GitHub，部署到 Vercel 上(流程[同前](#vercel))
最后，把在博客的`static`文件夹的 Repo 中的`autoload.js`修改一下：
````diff
    Promise.all([
        loadExternalResource(live2d_path + "waifu-basic.css", "css"),
        loadExternalResource(live2d_path + "live2d.min.js", "js"),
        loadExternalResource(live2d_path + "waifu-tips.js", "js")
    ]).then(() => {
        // 配置选项的具体用法见 README.md
        initWidget({
            waifuPath: live2d_path + "waifu-tips.json",
+             apiPath: "你API的 Vercel 部署地址",
-             //apiPath: "https://live2d.fghrsh.net/api/",
-             cdnPath: "https://fastly.jsdelivr.net/gh/fghrsh/live2d_api/",
            tools: ["hitokoto", "asteroids", "switch-model", "switch-texture", "photo", "info", "quit"]
        });
    });}
````
至此，你在博客页面上看到看板娘了。  
另外，本站的自建API地址是 [live2dapi.karlukle.site](https://live2dapi.karlukle.site)，如果不想自建API，欢迎你来使用。  
--更新于2024/2/18--  

## 对 Blowfish 主题的贡献  
- 增加简体中文翻译 #[1208](https://github.com/nunocoracao/blowfish/pull/1208)
- 修补Bug：中日韩文本标题无法页内定位 #[1254](https://github.com/nunocoracao/blowfish/pull/1254)
- 增加繁体中文翻译 #[1255](https://github.com/nunocoracao/blowfish/pull/1255)