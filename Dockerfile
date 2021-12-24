<!DOCTYPE html>
<html lang="zh-CN">
  <head hexo-theme='https://github.com/volantis-x/hexo-theme-volantis/tree/4.2.0'>
  <meta charset="utf-8">
  <!-- SEO相关 -->
  
    
  
  <!-- 渲染优化 -->
  <meta http-equiv='x-dns-prefetch-control' content='on' />
  <link rel='dns-prefetch' href='https://cdn.jsdelivr.net'>
  <link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin>
  <meta name="renderer" content="webkit">
  <meta name="force-rendering" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <meta name="HandheldFriendly" content="True" >
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <link rel="preload" href="/css/first.css" as="style">
  

  <!-- 页面元数据 -->
  
  <title>Dockerfile指令详解 - ☕憩息屋</title>
  
    <meta name="keywords" content="docker">
  

  

  <!-- feed -->
  

  <!-- import meta -->
  

  <!-- link -->
  
    <link rel="shortcut icon" type='image/x-icon' href="/sir.ico">
  

  <!-- import link -->
  

  
    
<link rel="stylesheet" href="/css/first.css">

  

  
  <link rel="stylesheet" href="/css/style.css" media="print" onload="this.media='all';this.onload=null">
  <noscript><link rel="stylesheet" href="/css/style.css"></noscript>
  

  <script id="loadcss"></script>

  
<script>
if (/*@cc_on!@*/false || (!!window.MSInputMethodContext && !!document.documentMode))
    document.write(
	'<style>'+
		'html{'+
			'overflow-x: hidden !important;'+
			'overflow-y: hidden !important;'+
		'}'+
		'.kill-ie{'+
			'text-align:center;'+
			'height: 100%;'+
			'margin-top: 15%;'+
			'margin-bottom: 5500%;'+
		'}'+
	'</style>'+
    '<div class="kill-ie">'+
        '<h1><b>抱歉，您的浏览器无法访问本站</b></h1>'+
        '<h3>微软已经于2016年终止了对 Internet Explorer (IE) 10 及更早版本的支持，<br/>'+
        '继续使用存在极大的安全隐患，请使用当代主流的浏览器进行访问。</h3><br/>'+
        '<a target="_blank" rel="noopener" href="https://www.microsoft.com/zh-cn/WindowsForBusiness/End-of-IE-support"><strong>了解详情 ></strong></a>'+
    '</div>');
</script>


<noscript>
	<style>
		html{
			overflow-x: hidden !important;
			overflow-y: hidden !important;
		}
		.kill-noscript{
			text-align:center;
			height: 100%;
			margin-top: 15%;
			margin-bottom: 5500%;
		}
	</style>
    <div class="kill-noscript">
        <h1><b>抱歉，您的浏览器无法访问本站</b></h1>
        <h3>本页面需要浏览器支持（启用）JavaScript</h3><br/>
        <a target="_blank" rel="noopener" href="https://www.baidu.com/s?wd=启用JavaScript"><strong>了解详情 ></strong></a>
    </div>
</noscript>

</head>

  <body>
    

<header id="l_header" class="l_header auto shadow blur auto show" style='opacity: 0' >
  <div class='container'>
  <div id='wrapper'>
    <div class='nav-sub'>
      <p class="title"></p>
      <ul class='switcher nav-list-h m-phone' id="pjax-header-nav-list">
        <li><a id="s-comment" class="fas fa-comments fa-fw" target="_self" href='javascript:void(0)'></a></li>
        
          <li><a id="s-toc" class="s-toc fas fa-list fa-fw" target="_self" href='javascript:void(0)'></a></li>
        
      </ul>
    </div>
		<div class="nav-main">
      
        
        <a class="title flat-box" target="_self" href='/'>
          
          
          
            ☕憩息屋
          
        </a>
      

			<div class='menu navigation'>
				<ul class='nav-list-h m-pc'>
          
          
          
            
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=http://www.demo443.com:4567/
                  
                  
                  
                    id="http:wwwdemo443com:4567"
                  >
                  <i class='fas fa-fan fa-spin fa-fw'></i>技术博客
                </a>
                
              </li>
            
          
          
            
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/apidocs/
                  
                  
                  
                    id="apidocs"
                  >
                  💀开发资料
                </a>
                
              </li>
            
          
          
            
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/study/
                  
                  
                  
                    id="study"
                  >
                  📚学习资料
                </a>
                
              </li>
            
          
          
            
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/friends/
                  
                  
                  
                    id="friends"
                  >
                  🔖网址收藏
                </a>
                
              </li>
            
          
          
            
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" 
                  
                  
                  >
                  🔨工具箱
                </a>
                
                  <ul class="list-v">
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/tools/
                  
                  
                  
                    id="tools"
                  >
                  📐环境&工具
                </a>
                
              </li>
            
          
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/bat/
                  
                  
                  
                    id="bat"
                  >
                  🐍bat &脚本
                </a>
                
              </li>
            
          
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/sucai/
                  
                  
                  
                    id="sucai"
                  >
                  🎲模板&素材
                </a>
                
              </li>
            
          
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/music&amp;videos/
                  
                  
                  
                    id="music&amp;videos"
                  >
                  🔇影视&音乐
                </a>
                
              </li>
            
          
                    
                  </ul>
                
              </li>
            
          
          
            
            
              <li>
                <a class="menuitem flat-box header toggle-mode-btn">
                  <i class=' fa-fw'></i>🌗开灯/关灯
                </a>
              <li>
            
          
          
            
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/about/
                  
                  
                  
                    id="about"
                  >
                  💬关于我
                </a>
                
              </li>
            
          
          
				</ul>
			</div>

      <div class="m_search">
        <form name="searchform" class="form u-search-form">
          <i class="icon fas fa-search fa-fw"></i>
          <input type="text" class="input u-search-input" placeholder="站内搜索" />
        </form>
      </div>

			<ul class='switcher nav-list-h m-phone'>
				
					<li><a class="s-search fas fa-search fa-fw" target="_self" href='javascript:void(0)'></a></li>
				
				<li>
          <a class="s-menu fas fa-bars fa-fw" target="_self" href='javascript:void(0)'></a>
          <ul class="menu-phone list-v navigation white-box">
            
              
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=http://www.demo443.com:4567/
                  
                  
                  
                    id="http:wwwdemo443com:4567"
                  >
                  <i class='fas fa-fan fa-spin fa-fw'></i>技术博客
                </a>
                
              </li>
            
          
            
              
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/apidocs/
                  
                  
                  
                    id="apidocs"
                  >
                  💀开发资料
                </a>
                
              </li>
            
          
            
              
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/study/
                  
                  
                  
                    id="study"
                  >
                  📚学习资料
                </a>
                
              </li>
            
          
            
              
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/friends/
                  
                  
                  
                    id="friends"
                  >
                  🔖网址收藏
                </a>
                
              </li>
            
          
            
              
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" 
                  
                  
                  >
                  🔨工具箱
                </a>
                
                  <ul class="list-v">
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/tools/
                  
                  
                  
                    id="tools"
                  >
                  📐环境&工具
                </a>
                
              </li>
            
          
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/bat/
                  
                  
                  
                    id="bat"
                  >
                  🐍bat &脚本
                </a>
                
              </li>
            
          
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/sucai/
                  
                  
                  
                    id="sucai"
                  >
                  🎲模板&素材
                </a>
                
              </li>
            
          
                    
                      
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/music&amp;videos/
                  
                  
                  
                    id="music&amp;videos"
                  >
                  🔇影视&音乐
                </a>
                
              </li>
            
          
                    
                  </ul>
                
              </li>
            
          
            
              
            
              <li>
                <a class="menuitem flat-box header toggle-mode-btn">
                  <i class=' fa-fw'></i>🌗开灯/关灯
                </a>
              <li>
            
          
            
              
            
              <li>
                <a class="menuitem flat-box faa-parent animated-hover" href=/about/
                  
                  
                  
                    id="about"
                  >
                  💬关于我
                </a>
                
              </li>
            
          
            
          </ul>
        </li>
			</ul>
		</div>
	</div>
  </div>
</header>

    <div id="l_body">
      <div id="l_cover">
  
    
        <div id="full" class='cover-wrapper post search' style="display: none;">
          
            <div class='cover-bg lazyload placeholder' data-bg="http://photos.demo443.com/blog/6/imgs/bg.jpg"></div>
          
          <div class='cover-body'>
  <div class='top'>
    
    
      <p class="title">☕憩息屋</p>
    
    
  </div>
  <div class='bottom'>
    
      <div class="m_search">
        <form name="searchform" class="form u-search-form">
          <input type="text" class="input u-search-input" placeholder="search" />
          <i class="icon fas fa-search fa-fw"></i>
        </form>
      </div>
    
    <div class='menu navigation'>
      <div class='list-h'>
        
          
            <a href="http://www.demo443.com:4567/"
              
              
              id="http:wwwdemo443com:4567">
              <p>🏀技术博客</p>
            </a>
          
            <a href="/friends/"
              
              
              id="friends">
              <p>🍎网址收藏</p>
            </a>
          
            <a href="/study/"
              
              
              id="study">
              <p>🍨学习资料</p>
            </a>
          
            <a href="/apidocs/"
              
              
              id="apidocs">
              <p>🍺开发资料</p>
            </a>
          
            <a href="http://www.demo443.com"
              
              
              id="http:wwwdemo443com">
              <p>😈工具箱</p>
            </a>
          
            <a href="/about/"
              
              
              id="about">
              <p>😃关于我</p>
            </a>
          
        
      </div>
    </div>
  </div>
</div>

          <div id="scroll-down" style="display: none;"><i class="fa fa-chevron-down scroll-down-effects"></i></div>
        </div>
    
  
  </div>

      <div id="safearea">
        <div class="body-wrapper" id="pjax-container">
          

<div class='l_main'>
  <article class="article post white-box reveal md shadow blur floatable article-type-post" id="post" itemscope itemprop="blogPost">
  


  
  <div class="article-meta" id="top">
    
    
    
      <h1 class="title">
        Dockerfile指令详解
      </h1>
      <div class='new-meta-box'>
        
          
            
<div class='new-meta-item author'>
  <a class='author' href="/about/" rel="nofollow">
    <img no-lazy src="/img/avatar.jpg">
    <p>杨晓东</p>
  </a>
</div>

          
        
          
            
  <div class='new-meta-item category'>
    <a class='notlink'>
      <i class="fas fa-folder-open fa-fw" aria-hidden="true"></i>
      <a class="category-link" href="/categories/yelog/">yelog</a><span class="sep"></span><a class="category-link" href="/categories/yelog/%E8%BF%90%E7%BB%B4/">运维</a>
    </a>
  </div>


          
        
          
            <div class="new-meta-item date">
  <a class='notlink'>
    <i class="fas fa-calendar-alt fa-fw" aria-hidden="true"></i>
    <p>发布于：2017年5月22日</p>
  </a>
</div>

          
        
          
            
  <div class="new-meta-item browse busuanzi">
    <a class='notlink'>
      <i class="fas fa-eye fa-fw" aria-hidden="true"></i>
      <p>
        <span id="busuanzi_value_page_pv">
          <i class="fas fa-circle-notch fa-spin fa-fw" aria-hidden="true"></i>
        </span>
        次浏览
      </p>
    </a>
  </div>


          
        
      </div>
    
  </div>


  
  
  <p><code>Dockerfile</code> 是一个文本文件，其内包含了一条条的指令(Instruction)，每一条指令构建一层，因此每一条指令的内容，就是描述该层应当如何构建。</p>
<h2 id="构建镜像"><a href="#构建镜像" class="headerlink" title="构建镜像"></a>构建镜像</h2><p>命令格式：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">$ docker build [选项] &lt;上下文路径/URL/-&gt;</span><br></pre></td></tr></table></figure>
<p>示例：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br></pre></td><td class="code"><pre><span class="line"><span class="comment"># 构建一个名为 nginx:v3 的镜像</span></span><br><span class="line">$ docker build -t nginx:v3 .</span><br></pre></td></tr></table></figure>

<h2 id="RUN-执行命令"><a href="#RUN-执行命令" class="headerlink" title="RUN 执行命令"></a>RUN 执行命令</h2><ol>
<li><code>shell</code>格式：RUN &lt;命令&gt;，就像直接在命令行中输入的命令一样。刚才写的 Dockrfile 中的 RUN 指令就是这种格式。<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">RUN <span class="built_in">echo</span> <span class="string">&#x27;&lt;h1&gt;Hello, Docker!&lt;/h1&gt;&#x27;</span> &gt; /usr/share/nginx/html/index.html</span><br></pre></td></tr></table></figure></li>
<li><code>exec</code>格式：RUN [“可执行文件”, “参数1”, “参数2”]，这更像是函数调用中的格式。</li>
</ol>
<h2 id="COPY-复制文件"><a href="#COPY-复制文件" class="headerlink" title="COPY 复制文件"></a>COPY 复制文件</h2><p>格式：</p>
<ol>
<li><code>COPY &lt;源路径&gt;... &lt;目标路径&gt;</code></li>
<li><code>COPY [&quot;&lt;源路径1&gt;&quot;,... &quot;&lt;目标路径&gt;&quot;]</code><br>和 <code>RUN</code> 指令一样，也有两种格式，一种类似于命令行，一种类似于函数调用。<br>COPY 指令将从构建上下文目录中 &lt;源路径&gt; 的文件/目录复制到新的一层的镜像内的 &lt;目标路径&gt; 位置。比如：<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">COPY package.json /usr/src/app/</span><br></pre></td></tr></table></figure></li>
</ol>
<p><code>&lt;源路径&gt;</code> 可以是多个，甚至可以是通配符，其通配符规则要满足 Go 的 filepath.Match 规则，如：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br></pre></td><td class="code"><pre><span class="line">COPY hom* /mydir/</span><br><span class="line">COPY hom?.txt /mydir/</span><br></pre></td></tr></table></figure>
<p><code>&lt;目标路径&gt;</code> 可以是容器内的绝对路径，也可以是相对于工作目录的相对路径（工作目录可以用 <code>WORKDIR</code> 指令来指定）。目标路径不需要事先创建，如果目录不存在会在复制文件前先行创建缺失目录。</p>
<p>此外，还需要注意一点，使用 COPY 指令，源文件的各种元数据都会保留。比如读、写、执行权限、文件变更时间等。这个特性对于镜像定制很有用。特别是构建相关文件都在使用 Git 进行管理的时候。</p>
<h2 id="ADD更高级的复制文件"><a href="#ADD更高级的复制文件" class="headerlink" title="ADD更高级的复制文件"></a>ADD更高级的复制文件</h2><p><code>ADD</code> 指令和 <code>COPY</code> 的格式和性质基本一致。但是在 <code>COPY</code> 基础上增加了一些功能。</p>
<p>比如 <code>&lt;源路径&gt;</code> 可以是一个 URL，这种情况下，Docker 引擎会试图去下载这个链接的文件放到 <code>&lt;目标路径&gt;</code> 去。下载后的文件权限自动设置为 600，如果这并不是想要的权限，那么还需要增加额外的一层 RUN 进行权限调整，另外，如果下载的是个压缩包，需要解压缩，也一样还需要额外的一层 RUN 指令进行解压缩。所以不如直接使用 RUN 指令，然后使用 <code>wget</code> 或者 <code>curl</code> 工具下载，处理权限、解压缩、然后清理无用文件更合理。因此，这个功能其实并不实用，而且不推荐使用。</p>
<p>如果 &lt;源路径&gt; 为一个 tar 压缩文件的话，压缩格式为 gzip, bzip2 以及 xz 的情况下，ADD 指令将会自动解压缩这个压缩文件到 &lt;目标路径&gt; 去。</p>
<p>在 Docker 官方的最佳实践文档中要求，尽可能的使用 COPY 。</p>
<p>因此在 COPY 和 ADD 指令中选择的时候，可以遵循这样的原则，所有的文件复制均使用 <code>COPY</code> 指令，仅在需要自动解压缩的场合使用 <code>ADD</code>。</p>
<h2 id="CMD-容器启动命令"><a href="#CMD-容器启动命令" class="headerlink" title="CMD 容器启动命令"></a>CMD 容器启动命令</h2><p>CMD 指令的格式和 RUN 相似，也是两种格式：<br>1） shell 格式：<code>CMD &lt;命令&gt;</code><br>2） exec 格式：<code>CMD [&quot;可执行文件&quot;, &quot;参数1&quot;, &quot;参数2&quot;...]</code><br>3） 参数列表格式：<code>CMD [&quot;参数1&quot;, &quot;参数2&quot;...]</code>。在指定了 ENTRYPOINT 指令后，用 CMD 指定具体的参数。</p>
<p>Docker 不是虚拟机，容器就是进程。既然是进程，那么在启动容器的时候，需要指定所运行的程序及参数。CMD 指令就是用于指定默认的容器主进程的启动命令的。</p>
<p>在运行时可以指定新的命令来替代镜像设置中的这个默认命令，比如，ubuntu 镜像默认的 CMD 是 /bin/bash，如果我们直接 docker run -it ubuntu 的话，会直接进入 bash。我们也可以在运行时指定运行别的命令，如 docker run -it ubuntu cat /etc/os-release。这就是用 cat /etc/os-release 命令替换了默认的 /bin/bash 命令了，输出了系统版本信息。</p>
<p>在指令格式上，一般推荐使用 exec 格式，这类格式在解析时会被解析为 JSON 数组，因此一定要使用双引号 “，而不要使用单引号。</p>
<h2 id="ENTRYPOINT-入口点"><a href="#ENTRYPOINT-入口点" class="headerlink" title="ENTRYPOINT 入口点"></a>ENTRYPOINT 入口点</h2><p>ENTRYPOINT 的目的和 CMD 一样，都是在指定容器启动程序及参数。ENTRYPOINT 在运行时也可以替代，不过比 CMD 要略显繁琐，需要通过 docker run 的参数 –entrypoint 来指定。</p>
<p>当指定了 ENTRYPOINT 后，CMD 的含义就发生了改变，不再是直接的运行其命令，而是将 CMD 的内容作为参数传给 ENTRYPOINT 指令，换句话说实际执行时，将变为：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">&lt;ENTRYPOINT&gt; <span class="string">&quot;&lt;CMD&gt;&quot;</span></span><br></pre></td></tr></table></figure>
<ol>
<li><p>场景一：让镜像变成像命令一样使用</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br></pre></td><td class="code"><pre><span class="line">FROM ubuntu:16.04</span><br><span class="line">RUN apt-get update \</span><br><span class="line">    &amp;&amp; apt-get install -y curl \</span><br><span class="line">    &amp;&amp; rm -rf /var/lib/apt/lists/*</span><br><span class="line">ENTRYPOINT [ <span class="string">&quot;curl&quot;</span>, <span class="string">&quot;-s&quot;</span>, <span class="string">&quot;http://ip.cn&quot;</span> ]</span><br></pre></td></tr></table></figure>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">$ docker run myip -i</span><br></pre></td></tr></table></figure>
<p>这是因为当存在 ENTRYPOINT 后，CMD 的内容将会作为参数传给 ENTRYPOINT，而这里 -i 就是新的 CMD，因此会作为参数传给 curl，从而达到了我们预期的效果。</p>
</li>
<li><p>场景二：应用运行前的准备工作<br>可以写一个脚本，然后放入 ENTRYPOINT 中去执行，而这个脚本会将接到的参数（也就是 <CMD>）作为命令，在脚本最后执行。比如官方镜像 redis 中就是这么做的：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br><span class="line">8</span><br></pre></td><td class="code"><pre><span class="line">FROM alpine:3.4</span><br><span class="line">...</span><br><span class="line">RUN addgroup -S redis &amp;&amp; adduser -S -G redis redis</span><br><span class="line">...</span><br><span class="line">ENTRYPOINT [<span class="string">&quot;docker-entrypoint.sh&quot;</span>]</span><br><span class="line"></span><br><span class="line">EXPOSE 6379</span><br><span class="line">CMD [ <span class="string">&quot;redis-server&quot;</span> ]</span><br></pre></td></tr></table></figure>
<p>可以看到其中为了 redis 服务创建了 redis 用户，并在最后指定了 ENTRYPOINT 为 docker-entrypoint.sh 脚本。</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br><span class="line">8</span><br><span class="line">9</span><br></pre></td><td class="code"><pre><span class="line"><span class="meta">#!/bin/sh</span></span><br><span class="line">...</span><br><span class="line"><span class="comment"># allow the container to be started with `--user`</span></span><br><span class="line"><span class="keyword">if</span> [ <span class="string">&quot;<span class="variable">$1</span>&quot;</span> = <span class="string">&#x27;redis-server&#x27;</span> -a <span class="string">&quot;<span class="subst">$(id -u)</span>&quot;</span> = <span class="string">&#x27;0&#x27;</span> ]; <span class="keyword">then</span></span><br><span class="line">    chown -R redis .</span><br><span class="line">    <span class="built_in">exec</span> su-exec redis <span class="string">&quot;<span class="variable">$0</span>&quot;</span> <span class="string">&quot;<span class="variable">$@</span>&quot;</span></span><br><span class="line"><span class="keyword">fi</span></span><br><span class="line"></span><br><span class="line"><span class="built_in">exec</span> <span class="string">&quot;<span class="variable">$@</span>&quot;</span></span><br></pre></td></tr></table></figure>
<p>该脚本的内容就是根据 CMD 的内容来判断，如果是 redis-server 的话，则切换到 redis 用户身份启动服务器，否则依旧使用 root 身份执行。比如：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br></pre></td><td class="code"><pre><span class="line">$ docker run -it redis id</span><br><span class="line">uid=0(root) gid=0(root) groups=0(root)</span><br></pre></td></tr></table></figure></li>
</ol>
<h2 id="ENV-设置环境变量"><a href="#ENV-设置环境变量" class="headerlink" title="ENV 设置环境变量"></a>ENV 设置环境变量</h2><p>格式有两种：</p>
<ol>
<li><code>ENV &lt;key&gt; &lt;value&gt;</code></li>
<li><code>ENV &lt;key1&gt;=&lt;value1&gt; &lt;key2&gt;=&lt;value2&gt;...</code></li>
</ol>
<p>这个指令很简单，就是设置环境变量而已，无论是后面的其它指令，如 RUN，还是运行时的应用，都可以直接使用这里定义的环境变量。</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br></pre></td><td class="code"><pre><span class="line">ENV VERSION=1.0 DEBUG=on \</span><br><span class="line">    NAME=&quot;Happy Feet&quot;</span><br></pre></td></tr></table></figure>
<p>这个例子中演示了如何换行，以及对含有空格的值用双引号括起来的办法，这和 Shell 下的行为是一致的。</p>
<p>定义了环境变量，那么在后续的指令中，就可以使用这个环境变量。比如在官方 node 镜像 Dockerfile 中，就有类似这样的代码：</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br><span class="line">8</span><br><span class="line">9</span><br></pre></td><td class="code"><pre><span class="line">ENV NODE_VERSION 7.2.0</span><br><span class="line"></span><br><span class="line">RUN curl -SLO &quot;https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz&quot; \</span><br><span class="line">  &amp;&amp; curl -SLO &quot;https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc&quot; \</span><br><span class="line">  &amp;&amp; gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \</span><br><span class="line">  &amp;&amp; grep &quot; node-v$NODE_VERSION-linux-x64.tar.xz\$&quot; SHASUMS256.txt | sha256sum -c - \</span><br><span class="line">  &amp;&amp; tar -xJf &quot;node-v$NODE_VERSION-linux-x64.tar.xz&quot; -C /usr/local --strip-components=1 \</span><br><span class="line">  &amp;&amp; rm &quot;node-v$NODE_VERSION-linux-x64.tar.xz&quot; SHASUMS256.txt.asc SHASUMS256.txt \</span><br><span class="line">  &amp;&amp; ln -s /usr/local/bin/node /usr/local/bin/nodejs</span><br></pre></td></tr></table></figure>

<p>在这里先定义了环境变量 NODE_VERSION，其后的 RUN 这层里，多次使用 $NODE_VERSION 来进行操作定制。可以看到，将来升级镜像构建版本的时候，只需要更新 7.2.0 即可，Dockerfile 构建维护变得更轻松了。</p>
<p>下列指令可以支持环境变量展开： ADD、COPY、ENV、EXPOSE、LABEL、USER、WORKDIR、VOLUME、STOPSIGNAL、ONBUILD。</p>
<p>可以从这个指令列表里感觉到，环境变量可以使用的地方很多，很强大。通过环境变量，我们可以让一份 Dockerfile 制作更多的镜像，只需使用不同的环境变量即可。</p>
<h2 id="ARG-构建参数"><a href="#ARG-构建参数" class="headerlink" title="ARG 构建参数"></a>ARG 构建参数</h2><p>格式：<code>ARG &lt;参数名&gt;[=&lt;默认值&gt;]</code></p>
<p>构建参数和 ENV 的效果一样，都是设置环境变量。所不同的是，ARG 所设置的构建环境的环境变量，在将来容器运行时是不会存在这些环境变量的。但是不要因此就使用 ARG 保存密码之类的信息，因为 docker history 还是可以看到所有值的。</p>
<p>Dockerfile 中的 ARG 指令是定义参数名称，以及定义其默认值。该默认值可以在构建命令 docker build 中用 –build-arg &lt;参数名&gt;=&lt;值&gt; 来覆盖。</p>
<p>在 1.13 之前的版本，要求 –build-arg 中的参数名，必须在 Dockerfile 中用 ARG 定义过了，换句话说，就是 –build-arg 指定的参数，必须在 Dockerfile 中使用了。如果对应参数没有被使用，则会报错退出构建。从 1.13 开始，这种严格的限制被放开，不再报错退出，而是显示警告信息，并继续构建。这对于使用 CI 系统，用同样的构建流程构建不同的 Dockerfile 的时候比较有帮助，避免构建命令必须根据每个 Dockerfile 的内容修改。</p>
<h2 id="VOLUME-定义匿名卷"><a href="#VOLUME-定义匿名卷" class="headerlink" title="VOLUME 定义匿名卷"></a>VOLUME 定义匿名卷</h2><p>格式为：</p>
<ol>
<li><code>VOLUME [&quot;&lt;路径1&gt;&quot;, &quot;&lt;路径2&gt;&quot;...]</code></li>
<li><code>VOLUME &lt;路径&gt;</code></li>
</ol>
<p>之前我们说过，容器运行时应该尽量保持容器存储层不发生写操作，对于数据库类需要保存动态数据的应用，其数据库文件应该保存于卷(volume)中，后面的章节我们会进一步介绍 Docker 卷的概念。为了防止运行时用户忘记将动态文件所保存目录挂载为卷，在 Dockerfile 中，我们可以事先指定某些目录挂载为匿名卷，这样在运行时如果用户不指定挂载，其应用也可以正常运行，不会向容器存储层写入大量数据。</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">VOLUME /data</span><br></pre></td></tr></table></figure>

<p>这里的 /data 目录就会在运行时自动挂载为匿名卷，任何向 /data 中写入的信息都不会记录进容器存储层，从而保证了容器存储层的无状态化。当然，运行时可以覆盖这个挂载设置。比如：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">$ docker run -d -v mydata:/data xxxx</span><br></pre></td></tr></table></figure>
<p>在这行命令中，就使用了 mydata 这个命名卷挂载到了 /data 这个位置，替代了 Dockerfile 中定义的匿名卷的挂载配置。</p>
<h2 id="EXPOSE-声明端口"><a href="#EXPOSE-声明端口" class="headerlink" title="EXPOSE 声明端口"></a>EXPOSE 声明端口</h2><p>格式为 <code>EXPOSE &lt;端口1&gt; [&lt;端口2&gt;...]</code>。</p>
<p>EXPOSE 指令是声明运行时容器提供服务端口，这只是一个声明，在运行时并不会因为这个声明应用就会开启这个端口的服务。在 Dockerfile 中写入这样的声明有两个好处，一个是帮助镜像使用者理解这个镜像服务的守护端口，以方便配置映射；另一个用处则是在运行时使用随机端口映射时，也就是 docker run -P 时，会自动随机映射 EXPOSE 的端口。</p>
<p>此外，在早期 Docker 版本中还有一个特殊的用处。以前所有容器都运行于默认桥接网络中，因此所有容器互相之间都可以直接访问，这样存在一定的安全性问题。于是有了一个 Docker 引擎参数 –icc=false，当指定该参数后，容器间将默认无法互访，除非互相间使用了 –links 参数的容器才可以互通，并且只有镜像中 EXPOSE 所声明的端口才可以被访问。这个 –icc=false 的用法，在引入了 docker network 后已经基本不用了，通过自定义网络可以很轻松的实现容器间的互联与隔离。</p>
<p>要将 EXPOSE 和在运行时使用 -p &lt;宿主端口&gt;:&lt;容器端口&gt; 区分开来。-p，是映射宿主端口和容器端口，换句话说，就是将容器的对应端口服务公开给外界访问，而 EXPOSE 仅仅是声明容器打算使用什么端口而已，并不会自动在宿主进行端口映射。</p>
<h2 id="WORKDIR-指定工作目录"><a href="#WORKDIR-指定工作目录" class="headerlink" title="WORKDIR 指定工作目录"></a>WORKDIR 指定工作目录</h2><p>格式为 WORKDIR &lt;工作目录路径&gt;。</p>
<p>使用 WORKDIR 指令可以来指定工作目录（或者称为当前目录），以后各层的当前目录就被改为指定的目录，如该目录不存在，WORKDIR 会帮你建立目录。</p>
<p>之前提到一些初学者常犯的错误是把 Dockerfile 等同于 Shell 脚本来书写，这种错误的理解还可能会导致出现下面这样的错误：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br></pre></td><td class="code"><pre><span class="line">RUN <span class="built_in">cd</span> /app</span><br><span class="line">RUN <span class="built_in">echo</span> <span class="string">&quot;hello&quot;</span> &gt; world.txt</span><br></pre></td></tr></table></figure>

<p>如果将这个 Dockerfile 进行构建镜像运行后，会发现找不到 /app/world.txt 文件，或者其内容不是 hello。原因其实很简单，在 Shell 中，连续两行是同一个进程执行环境，因此前一个命令修改的内存状态，会直接影响后一个命令；而在 Dockerfile 中，这两行 RUN 命令的执行环境根本不同，是两个完全不同的容器。这就是对 Dokerfile 构建分层存储的概念不了解所导致的错误。</p>
<p>之前说过每一个 RUN 都是启动一个容器、执行命令、然后提交存储层文件变更。第一层 RUN cd /app 的执行仅仅是当前进程的工作目录变更，一个内存上的变化而已，其结果不会造成任何文件变更。而到第二层的时候，启动的是一个全新的容器，跟第一层的容器更完全没关系，自然不可能继承前一层构建过程中的内存变化。</p>
<p>因此如果需要改变以后各层的工作目录的位置，那么应该使用 WORKDIR 指令。</p>
<h2 id="USER-指定当前用户"><a href="#USER-指定当前用户" class="headerlink" title="USER 指定当前用户"></a>USER 指定当前用户</h2><p>格式：<code>USER &lt;用户名&gt;</code></p>
<p>USER 指令和 WORKDIR 相似，都是改变环境状态并影响以后的层。WORKDIR 是改变工作目录，USER 则是改变之后层的执行 RUN, CMD 以及 ENTRYPOINT 这类命令的身份。</p>
<p>当然，和 WORKDIR 一样，USER 只是帮助你切换到指定用户而已，这个用户必须是事先建立好的，否则无法切换。</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br></pre></td><td class="code"><pre><span class="line">RUN groupadd -r redis &amp;&amp; useradd -r -g redis redis</span><br><span class="line">USER redis</span><br><span class="line">RUN [ &quot;redis-server&quot; ]</span><br></pre></td></tr></table></figure>

<p>如果以 root 执行的脚本，在执行期间希望改变身份，比如希望以某个已经建立好的用户来运行某个服务进程，不要使用 su 或者 sudo，这些都需要比较麻烦的配置，而且在 TTY 缺失的环境下经常出错。建议使用 gosu，可以从其项目网站看到进一步的信息：<a target="_blank" rel="noopener" href="https://github.com/tianon/gosu">https://github.com/tianon/gosu</a></p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br><span class="line">8</span><br></pre></td><td class="code"><pre><span class="line"># 建立 redis 用户，并使用 gosu 换另一个用户执行命令</span><br><span class="line">RUN groupadd -r redis &amp;&amp; useradd -r -g redis redis</span><br><span class="line"># 下载 gosu</span><br><span class="line">RUN wget -O /usr/local/bin/gosu &quot;https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64&quot; \</span><br><span class="line">    &amp;&amp; chmod +x /usr/local/bin/gosu \</span><br><span class="line">    &amp;&amp; gosu nobody true</span><br><span class="line"># 设置 CMD，并以另外的用户执行</span><br><span class="line">CMD [ &quot;exec&quot;, &quot;gosu&quot;, &quot;redis&quot;, &quot;redis-server&quot; ]</span><br></pre></td></tr></table></figure>

<h2 id="HEALTHCHECK-健康检查"><a href="#HEALTHCHECK-健康检查" class="headerlink" title="HEALTHCHECK 健康检查"></a>HEALTHCHECK 健康检查</h2><p>格式：</p>
<ol>
<li><code>HEALTHCHECK [选项] CMD &lt;命令&gt;</code>：设置检查容器健康状况的命令</li>
<li><code>HEALTHCHECK NONE</code>：如果基础镜像有健康检查指令，使用这行可以屏蔽掉其健康检查指令</li>
</ol>
<p>HEALTHCHECK 指令是告诉 Docker 应该如何进行判断容器的状态是否正常，这是 Docker 1.12 引入的新指令。</p>
<p>在没有 HEALTHCHECK 指令前，Docker 引擎只可以通过容器内主进程是否退出来判断容器是否状态异常。很多情况下这没问题，但是如果程序进入死锁状态，或者死循环状态，应用进程并不退出，但是该容器已经无法提供服务了。在 1.12 以前，Docker 不会检测到容器的这种状态，从而不会重新调度，导致可能会有部分容器已经无法提供服务了却还在接受用户请求。</p>
<p>而自 1.12 之后，Docker 提供了 HEALTHCHECK 指令，通过该指令指定一行命令，用这行命令来判断容器主进程的服务状态是否还正常，从而比较真实的反应容器实际状态。</p>
<p>当在一个镜像指定了 HEALTHCHECK 指令后，用其启动容器，初始状态会为 starting，在 HEALTHCHECK 指令检查成功后变为 healthy，如果连续一定次数失败，则会变为 unhealthy。</p>
<p>HEALTHCHECK 支持下列选项：</p>
<ol>
<li><code>--interval=&lt;间隔&gt;</code>：两次健康检查的间隔，默认为 30 秒；</li>
<li><code>--timeout=&lt;时长&gt;</code>：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被视为失败，默认 30 秒；</li>
<li><code>--retries=&lt;次数&gt;</code>：当连续失败指定次数后，则将容器状态视为 unhealthy，默认 3 次。</li>
</ol>
<p>和 CMD, ENTRYPOINT 一样，HEALTHCHECK 只可以出现一次，如果写了多个，只有最后一个生效。</p>
<p>在 HEALTHCHECK [选项] CMD 后面的命令，格式和 ENTRYPOINT 一样，分为 shell 格式，和 exec 格式。命令的返回值决定了该次健康检查的成功与否：0：成功；1：失败；2：保留，不要使用这个值。</p>
<p>假设我们有个镜像是个最简单的 Web 服务，我们希望增加健康检查来判断其 Web 服务是否在正常工作，我们可以用 curl 来帮助判断，其 Dockerfile 的 HEALTHCHECK 可以这么写：</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br></pre></td><td class="code"><pre><span class="line">FROM nginx</span><br><span class="line">RUN apt-get update &amp;&amp; apt-get install -y curl &amp;&amp; rm -rf /var/lib/apt/lists/*</span><br><span class="line">HEALTHCHECK --interval=5s --timeout=3s \</span><br><span class="line">  CMD curl -fs http://localhost/ || exit 1</span><br></pre></td></tr></table></figure>

<p>这里我们设置了每 5 秒检查一次（这里为了试验所以间隔非常短，实际应该相对较长），如果健康检查命令超过 3 秒没响应就视为失败，并且使用 curl -fs <a target="_blank" rel="noopener" href="http://localhost/">http://localhost/</a> || exit 1 作为健康检查命令。</p>
<p>使用 docker build 来构建这个镜像：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">$ docker build -t myweb:v1 .</span><br></pre></td></tr></table></figure>
<p>构建好了后，我们启动一个容器：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">$ docker run -d --name web -p 80:80 myweb:v1</span><br></pre></td></tr></table></figure>
<p>当运行该镜像后，可以通过 docker ps 看到最初的状态为 (health: starting)：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br></pre></td><td class="code"><pre><span class="line">$ docker ps</span><br><span class="line">CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                            PORTS               NAMES</span><br><span class="line">03e28eb00bd0        myweb:v1            <span class="string">&quot;nginx -g &#x27;daemon off&quot;</span>   3 seconds ago       Up 2 seconds (health: starting)   80/tcp, 443/tcp     web</span><br></pre></td></tr></table></figure>
<p>在等待几秒钟后，再次 docker ps，就会看到健康状态变化为了 (healthy)：</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br></pre></td><td class="code"><pre><span class="line">$ docker ps</span><br><span class="line">CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                    PORTS               NAMES</span><br><span class="line">03e28eb00bd0        myweb:v1            <span class="string">&quot;nginx -g &#x27;daemon off&quot;</span>   18 seconds ago      Up 16 seconds (healthy)   80/tcp, 443/tcp     web</span><br></pre></td></tr></table></figure>
<p>如果健康检查连续失败超过了重试次数，状态就会变为 (unhealthy)。</p>
<p>为了帮助排障，健康检查命令的输出（包括 stdout 以及 stderr）都会被存储于健康状态里，可以用 docker inspect 来查看。</p>
<figure class="highlight bash"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br><span class="line">8</span><br><span class="line">9</span><br><span class="line">10</span><br><span class="line">11</span><br><span class="line">12</span><br><span class="line">13</span><br></pre></td><td class="code"><pre><span class="line">$ docker inspect --format <span class="string">&#x27;&#123;&#123;json .State.Health&#125;&#125;&#x27;</span> web | python -m json.tool</span><br><span class="line">&#123;</span><br><span class="line">    <span class="string">&quot;FailingStreak&quot;</span>: 0,</span><br><span class="line">    <span class="string">&quot;Log&quot;</span>: [</span><br><span class="line">        &#123;</span><br><span class="line">            <span class="string">&quot;End&quot;</span>: <span class="string">&quot;2016-11-25T14:35:37.940957051Z&quot;</span>,</span><br><span class="line">            <span class="string">&quot;ExitCode&quot;</span>: 0,</span><br><span class="line">            <span class="string">&quot;Output&quot;</span>: <span class="string">&quot;&lt;!DOCTYPE html&gt;\n&lt;html&gt;\n&lt;head&gt;\n&lt;title&gt;Welcome to nginx!&lt;/title&gt;\n&lt;style&gt;\n    body &#123;\n        width: 35em;\n        margin: 0 auto;\n        font-family: Tahoma, Verdana, Arial, sans-serif;\n    &#125;\n&lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;h1&gt;Welcome to nginx!&lt;/h1&gt;\n&lt;p&gt;If you see this page, the nginx web server is successfully installed and\nworking. Further configuration is required.&lt;/p&gt;\n\n&lt;p&gt;For online documentation and support please refer to\n&lt;a href=\&quot;http://nginx.org/\&quot;&gt;nginx.org&lt;/a&gt;.&lt;br/&gt;\nCommercial support is available at\n&lt;a href=\&quot;http://nginx.com/\&quot;&gt;nginx.com&lt;/a&gt;.&lt;/p&gt;\n\n&lt;p&gt;&lt;em&gt;Thank you for using nginx.&lt;/em&gt;&lt;/p&gt;\n&lt;/body&gt;\n&lt;/html&gt;\n&quot;</span>,</span><br><span class="line">            <span class="string">&quot;Start&quot;</span>: <span class="string">&quot;2016-11-25T14:35:37.780192565Z&quot;</span></span><br><span class="line">        &#125;</span><br><span class="line">    ],</span><br><span class="line">    <span class="string">&quot;Status&quot;</span>: <span class="string">&quot;healthy&quot;</span></span><br><span class="line">&#125;</span><br></pre></td></tr></table></figure>
<h2 id="ONBUILD-为他人做嫁衣裳"><a href="#ONBUILD-为他人做嫁衣裳" class="headerlink" title="ONBUILD 为他人做嫁衣裳"></a>ONBUILD 为他人做嫁衣裳</h2><p>格式：<code>ONBUILD &lt;其它指令&gt;</code>。</p>
<p>ONBUILD 是一个特殊的指令，它后面跟的是其它指令，比如 RUN, COPY 等，而这些指令，在当前镜像构建时并不会被执行。只有当以当前镜像为基础镜像，去构建下一级镜像的时候才会被执行。</p>
<p>Dockerfile 中的其它指令都是为了定制当前镜像而准备的，唯有 ONBUILD 是为了帮助别人定制自己而准备的。</p>
<p>假设我们要制作 Node.js 所写的应用的镜像。我们都知道 Node.js 使用 npm 进行包管理，所有依赖、配置、启动信息等会放到 package.json 文件里。在拿到程序代码后，需要先进行 npm install 才可以获得所有需要的依赖。然后就可以通过 npm start 来启动应用。因此，一般来说会这样写 Dockerfile：</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br></pre></td><td class="code"><pre><span class="line">FROM node:slim</span><br><span class="line">RUN &quot;mkdir /app&quot;</span><br><span class="line">WORKDIR /app</span><br><span class="line">COPY ./package.json /app</span><br><span class="line">RUN [ &quot;npm&quot;, &quot;install&quot; ]</span><br><span class="line">COPY . /app/</span><br><span class="line">CMD [ &quot;npm&quot;, &quot;start&quot; ]</span><br></pre></td></tr></table></figure>

<p>把这个 Dockerfile 放到 Node.js 项目的根目录，构建好镜像后，就可以直接拿来启动容器运行。但是如果我们还有第二个 Node.js 项目也差不多呢？好吧，那就再把这个 Dockerfile 复制到第二个项目里。那如果有第三个项目呢？再复制么？文件的副本越多，版本控制就越困难，让我们继续看这样的场景维护的问题。</p>
<p>如果第一个 Node.js 项目在开发过程中，发现这个 Dockerfile 里存在问题，比如敲错字了、或者需要安装额外的包，然后开发人员修复了这个 Dockerfile，再次构建，问题解决。第一个项目没问题了，但是第二个项目呢？虽然最初 Dockerfile 是复制、粘贴自第一个项目的，但是并不会因为第一个项目修复了他们的 Dockerfile，而第二个项目的 Dockerfile 就会被自动修复。</p>
<p>那么我们可不可以做一个基础镜像，然后各个项目使用这个基础镜像呢？这样基础镜像更新，各个项目不用同步 Dockerfile 的变化，重新构建后就继承了基础镜像的更新？好吧，可以，让我们看看这样的结果。那么上面的这个 Dockerfile 就会变为：</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br></pre></td><td class="code"><pre><span class="line">FROM node:slim</span><br><span class="line">RUN &quot;mkdir /app&quot;</span><br><span class="line">WORKDIR /app</span><br><span class="line">CMD [ &quot;npm&quot;, &quot;start&quot; ]</span><br></pre></td></tr></table></figure>
<p>这里我们把项目相关的构建指令拿出来，放到子项目里去。假设这个基础镜像的名字为 my-node 的话，各个项目内的自己的 Dockerfile 就变为：</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br></pre></td><td class="code"><pre><span class="line">FROM my-node</span><br><span class="line">COPY ./package.json /app</span><br><span class="line">RUN [ &quot;npm&quot;, &quot;install&quot; ]</span><br><span class="line">COPY . /app/</span><br></pre></td></tr></table></figure>

<p>基础镜像变化后，各个项目都用这个 Dockerfile 重新构建镜像，会继承基础镜像的更新。</p>
<p>那么，问题解决了么？没有。准确说，只解决了一半。如果这个 Dockerfile 里面有些东西需要调整呢？比如 npm install 都需要加一些参数，那怎么办？这一行 RUN 是不可能放入基础镜像的，因为涉及到了当前项目的 ./package.json，难道又要一个个修改么？所以说，这样制作基础镜像，只解决了原来的 Dockerfile 的前4条指令的变化问题，而后面三条指令的变化则完全没办法处理。</p>
<p>ONBUILD 可以解决这个问题。让我们用 ONBUILD 重新写一下基础镜像的 Dockerfile:</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br><span class="line">2</span><br><span class="line">3</span><br><span class="line">4</span><br><span class="line">5</span><br><span class="line">6</span><br><span class="line">7</span><br></pre></td><td class="code"><pre><span class="line">FROM node:slim</span><br><span class="line">RUN &quot;mkdir /app&quot;</span><br><span class="line">WORKDIR /app</span><br><span class="line">ONBUILD COPY ./package.json /app</span><br><span class="line">ONBUILD RUN [ &quot;npm&quot;, &quot;install&quot; ]</span><br><span class="line">ONBUILD COPY . /app/</span><br><span class="line">CMD [ &quot;npm&quot;, &quot;start&quot; ]</span><br></pre></td></tr></table></figure>

<p>这次我们回到原始的 Dockerfile，但是这次将项目相关的指令加上 ONBUILD，这样在构建基础镜像的时候，这三行并不会被执行。然后各个项目的 Dockerfile 就变成了简单地：</p>
<figure class="highlight plaintext"><table><tr><td class="gutter"><pre><span class="line">1</span><br></pre></td><td class="code"><pre><span class="line">FROM my-node</span><br></pre></td></tr></table></figure>
<p>是的，只有这么一行。当在各个项目目录中，用这个只有一行的 Dockerfile 构建镜像时，之前基础镜像的那三行 ONBUILD 就会开始执行，成功的将当前项目的代码复制进镜像、并且针对本项目执行 npm install，生成应用镜像。</p>
<h2 id="Reference"><a href="#Reference" class="headerlink" title="Reference"></a>Reference</h2><p>Docker–从入门到实践: <a target="_blank" rel="noopener" href="https://yeasy.gitbooks.io/docker_practice/content/">https://yeasy.gitbooks.io/docker_practice/content/</a><br>Dockerfie 官方文档：<a target="_blank" rel="noopener" href="https://docs.docker.com/engine/reference/builder/">https://docs.docker.com/engine/reference/builder/</a><br>Dockerfile 最佳实践文档：<a target="_blank" rel="noopener" href="https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/">https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/</a></p>

  
  
    
    <div class='footer'>
      
      
        
  <div class="related_posts">
    <section class='header'>
      <i class="fas fa-bookmark fa-fw" aria-hidden="true"></i><span>相关文章</span>
    </section>
    <section class='body'>
      <div class="vlts-rps"><a class="item" href="\docker-save-export" title="docker备份恢复之save与export" rel="bookmark "><img src="data:image/png;base64,666" /><span class="title">docker备份恢复之save与export</span></a><a class="item" href="\docker-registry" title="docker仓库" rel="bookmark "><img src="data:image/png;base64,666" /><span class="title">docker仓库</span></a><a class="item" href="\docker-first" title="docker初体验" rel="bookmark "><img src="data:image/png;base64,666" /><span class="title">docker初体验</span></a><a class="item" href="\docker-container" title="docker容器" rel="bookmark "><img src="data:image/png;base64,666" /><span class="title">docker容器</span></a><a class="item" href="\CentOS7-anonymous-Samba" title="CentOS7安装配置匿名访问Samba" rel="bookmark "><img src="data:image/png;base64,666" /><span class="title">CentOS7安装配置匿名访问Samba</span></a></div></section></div>
      
      
      
    </div>
  
  
    


  <div class='article-meta' id="bottom">
    <div class='new-meta-box'>
      
        
          
<div class='new-meta-item author'>
  <a class='author' href="/about/" rel="nofollow">
    <img no-lazy src="/img/avatar.jpg">
    <p>杨晓东</p>
  </a>
</div>

        
      
        
          <div class="new-meta-item date">
  <a class='notlink'>
    <i class="fas fa-calendar-alt fa-fw" aria-hidden="true"></i>
    <p>发布于：2017年5月22日</p>
  </a>
</div>

        
      
        
          <div class="new-meta-item date" itemprop="dateUpdated" datetime="2021-10-17T22:00:16+08:00">
  <a class='notlink'>
    <i class="fas fa-edit fa-fw" aria-hidden="true"></i>
    <p>更新于：2021年10月17日</p>
  </a>
</div>

        
      
        
          
  <div class='new-meta-item category'>
    <a class='notlink'>
      <i class="fas fa-folder-open fa-fw" aria-hidden="true"></i>
      <a class="category-link" href="/categories/yelog/">yelog</a><span class="sep"></span><a class="category-link" href="/categories/yelog/%E8%BF%90%E7%BB%B4/">运维</a>
    </a>
  </div>


        
      
        
          
  <div class="new-meta-item browse busuanzi">
    <a class='notlink'>
      <i class="fas fa-eye fa-fw" aria-hidden="true"></i>
      <p>
        <span id="busuanzi_value_page_pv">
          <i class="fas fa-circle-notch fa-spin fa-fw" aria-hidden="true"></i>
        </span>
        次浏览
      </p>
    </a>
  </div>


        
      
        
          
<div class="new-meta-item comments-count">
  
  <a href="/Dockerfile#comments">
    <i class="fas fa-comment-dots fa-fw"></i>
    <span class="valine-comment-count" data-xid="/Dockerfile">0</span>
    <span class="leancloud-comments-count">&nbsp;</span>
  </a>
</div>


        
      
        
          
  <div class="new-meta-item wordcount">
    <a class='notlink'>
      <i class="fas fa-keyboard fa-fw" aria-hidden="true"></i>
      <p>字数：6.1k字</p>
    </a>
  </div>
  <div class="new-meta-item readtime">
    <a class='notlink'>
      <i class="fas fa-hourglass-half fa-fw" aria-hidden="true"></i>
      <p>时长：24分钟</p>
    </a>
  </div>


        
      
        
          
  
  <div class="new-meta-item meta-tags"><a class="tag" href="/tags/docker/" rel="nofollow"><i class="fas fa-hashtag fa-fw" aria-hidden="true"></i><p>docker</p></a></div>


        
      
        
          
  <div class="new-meta-item share -mob-share-list">
  <div class="-mob-share-list share-body">
    
      
        <a class="-mob-share-qq" title="" rel="external nofollow noopener noreferrer noopener"
          
          target="_blank" href="http://connect.qq.com/widget/shareqq/index.html?url=http://www.demo443.com:9527/Dockerfile&title=Dockerfile指令详解 - ☕憩息屋&summary="
          
          >
          
            <img src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/qq.png" class="lazyload" data-srcset="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/qq.png" srcset="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII=">
          
        </a>
      
    
      
        <a class="-mob-share-qzone" title="" rel="external nofollow noopener noreferrer noopener"
          
          target="_blank" href="https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http://www.demo443.com:9527/Dockerfile&title=Dockerfile指令详解 - ☕憩息屋&summary="
          
          >
          
            <img src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/qzone.png" class="lazyload" data-srcset="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/qzone.png" srcset="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII=">
          
        </a>
      
    
      
        <a class="-mob-share-weibo" title="" rel="external nofollow noopener noreferrer noopener"
          
          target="_blank" href="http://service.weibo.com/share/share.php?url=http://www.demo443.com:9527/Dockerfile&title=Dockerfile指令详解 - ☕憩息屋&summary="
          
          >
          
            <img src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/weibo.png" class="lazyload" data-srcset="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/weibo.png" srcset="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII=">
          
        </a>
      
    
      
        
        <div class='hoverbox'>
          <a class='share'><img src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/wechat.png" class="lazyload" data-srcset="https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/wechat.png" srcset="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII="></a>
          <div class='target'>
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPgAAAD4CAAAAADkunTXAAACRklEQVR42u3ayZHDMAwEQOWf9G4ELgED+oKbP5V1oOkPCsPr70fXBQ4ODg4Ovgh+hevhi5vPPfq9en+3XnBwcHBw8I3wcgMQFtQt/NH3pvWCg4ODg4Nvhk8LqRZ2t4Hd63K94ODg4ODg4GVoOpDobgw4ODg4ODh4Du8GD9VA4eMbGHBwcHBw8A+Ctwf0xQbmDnR60AEODg4ODv5L8PjA3Juu43rBwcHBwcEXwafrWQ1Qd6BR/j44ODg4OPgieNogdAOCacB/rD5wcHBwcPCF8HSQXx1UVAOEdOAwDhTAwcHBwcEXwNNCphuUDjragxBwcHBwcPBF8HTwPw0SToHbjRE4ODg4OPgieHcQ0d2A04HFOMgABwcHBwdfCD/dqEwHDWmgcHsNDg4ODg6+GD4t4HRAcTpgAAcHBwcH3wifDhSmjUn19+kGgIODg4ODb4KnAUL3YF8aNKTBwm0DAw4ODg4OvgCeNghpQ5FuWNrwtAMFcHBwcHDwBfBTA4hTwUPaWI2TFHBwcHBw8C+CP+tA36mGaBo4gIODg4ODb4Z3P/SsAwPdBqhcLzg4ODg4+CL4dKUDhnc9Dw4ODg4Ovgl+hSsdSHQbo27D1A4UwMHBwcHBF8DTQX+1wNPBQnpQABwcHBwcfDP81QHCqUHHuIEBBwcHBwcHL99fvZ6+52UNDDg4ODg4+BfDTwUG6XvLwQc4ODg4OPhi+KkBfwrsHkRo/yHg4ODg4OAL4WljkA72T29oHCiAg4ODg4N/MfzXFjg4ODg4+IL1D+eiAkwAG2o9AAAAAElFTkSuQmCC">
          </div>
        </div>
      
    
      
    
  </div>
</div>



        
      
    </div>
  </div>


  
  

  
    <div class="prev-next">
      
        <a class='prev' href='/CentOS-DNS-GW-IP'>
          <p class='title'><i class="fas fa-chevron-left" aria-hidden="true"></i>CentOS修改DNS/GW/IP</p>
          <p class='content'>1.修改DNS解决方案一：修改网卡的DNS的配置文件
1$ vim /etc/resolv.conf
添加以下内容,设置两条dns
12nameserver 8.8.8.8 #google域名服...</p>
        </a>
      
      
        <a class='next' href='/docker-image'>
          <p class='title'>docker镜像<i class="fas fa-chevron-right" aria-hidden="true"></i></p>
          <p class='content'>WhatDocker 镜像是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文件外，还包含了一些为运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。镜像不包含任何动态数据...</p>
        </a>
      
    </div>
  
</article>


  

  <article class="post white-box reveal shadow blur floatable" id="comments">
    <p ct><i class='fas fa-comments'></i> 评论</p>
    
      <p cst>测试阶段</p>
    
    <div id="valine_container" class="valine_thread">
  <i class="fas fa-cog fa-spin fa-fw fa-2x"></i>
</div>

  </article>






</div>
<aside class='l_side'>
  
  
    
    



  <section class="widget toc-wrapper shadow blur floatable desktop mobile" id="toc-div" >
    
  <header>
    
      <i class="fas fa-list fa-fw" aria-hidden="true"></i><span class='name'>本文目录</span>
    
  </header>


    <div class='content'>
        <ol class="toc"><li class="toc-item toc-level-2"><a class="toc-link" href="#%E6%9E%84%E5%BB%BA%E9%95%9C%E5%83%8F"><span class="toc-number">1.</span> <span class="toc-text">构建镜像</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#RUN-%E6%89%A7%E8%A1%8C%E5%91%BD%E4%BB%A4"><span class="toc-number">2.</span> <span class="toc-text">RUN 执行命令</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#COPY-%E5%A4%8D%E5%88%B6%E6%96%87%E4%BB%B6"><span class="toc-number">3.</span> <span class="toc-text">COPY 复制文件</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#ADD%E6%9B%B4%E9%AB%98%E7%BA%A7%E7%9A%84%E5%A4%8D%E5%88%B6%E6%96%87%E4%BB%B6"><span class="toc-number">4.</span> <span class="toc-text">ADD更高级的复制文件</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#CMD-%E5%AE%B9%E5%99%A8%E5%90%AF%E5%8A%A8%E5%91%BD%E4%BB%A4"><span class="toc-number">5.</span> <span class="toc-text">CMD 容器启动命令</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#ENTRYPOINT-%E5%85%A5%E5%8F%A3%E7%82%B9"><span class="toc-number">6.</span> <span class="toc-text">ENTRYPOINT 入口点</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#ENV-%E8%AE%BE%E7%BD%AE%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F"><span class="toc-number">7.</span> <span class="toc-text">ENV 设置环境变量</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#ARG-%E6%9E%84%E5%BB%BA%E5%8F%82%E6%95%B0"><span class="toc-number">8.</span> <span class="toc-text">ARG 构建参数</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#VOLUME-%E5%AE%9A%E4%B9%89%E5%8C%BF%E5%90%8D%E5%8D%B7"><span class="toc-number">9.</span> <span class="toc-text">VOLUME 定义匿名卷</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#EXPOSE-%E5%A3%B0%E6%98%8E%E7%AB%AF%E5%8F%A3"><span class="toc-number">10.</span> <span class="toc-text">EXPOSE 声明端口</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#WORKDIR-%E6%8C%87%E5%AE%9A%E5%B7%A5%E4%BD%9C%E7%9B%AE%E5%BD%95"><span class="toc-number">11.</span> <span class="toc-text">WORKDIR 指定工作目录</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#USER-%E6%8C%87%E5%AE%9A%E5%BD%93%E5%89%8D%E7%94%A8%E6%88%B7"><span class="toc-number">12.</span> <span class="toc-text">USER 指定当前用户</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#HEALTHCHECK-%E5%81%A5%E5%BA%B7%E6%A3%80%E6%9F%A5"><span class="toc-number">13.</span> <span class="toc-text">HEALTHCHECK 健康检查</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#ONBUILD-%E4%B8%BA%E4%BB%96%E4%BA%BA%E5%81%9A%E5%AB%81%E8%A1%A3%E8%A3%B3"><span class="toc-number">14.</span> <span class="toc-text">ONBUILD 为他人做嫁衣裳</span></a></li><li class="toc-item toc-level-2"><a class="toc-link" href="#Reference"><span class="toc-number">15.</span> <span class="toc-text">Reference</span></a></li></ol>
    </div>
  </section>


  

  
    
    

<section class="widget blogger shadow blur floatable desktop mobile">
  <div class='content'>
    
      
        <a class='avatar flat-box circle' href='/about/'>
          <img no-lazy src='/img/avatar.jpg'/>
        </a>
      
    
    
      <div class='text'>
        
          <h2>杨晓东</h2>
        
        
          <p>过去无法挽回，<br>未来可以改变！</p>

        
        
      </div>
    
    
      <div class="social-wrapper">
        
          
            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3458888444&amp;site=qq&amp;menu=yes"
              class="social fab fa-qq flat-btn"
              target="_blank"
              rel="external nofollow noopener noreferrer">
              
            </a>
          
        
          
            <a href="mailto:3458888444@qq.com"
              class="social fas fa-envelope flat-btn"
              target="_blank"
              rel="external nofollow noopener noreferrer">
              
            </a>
          
        
          
            <a href="http://www.demo443.com"
              class="social fas fa-wrench flat-btn"
              target="_blank"
              rel="external nofollow noopener noreferrer">
              
            </a>
          
        
          
            <a href="https://music.163.com/"
              class="social fas fa-music flat-btn"
              target="_blank"
              rel="external nofollow noopener noreferrer">
              
            </a>
          
        
      </div>
    
  </div>
</section>

  

  
    
    

<section class="widget shadow blur floatable desktop">
  
  <header>
    
      <i class="fas fa-award fa-fw" aria-hidden="true"></i><span class='name'>站点信息</span>
    
  </header>


  <div class='content'>
    <div class="webinfo">
      
        <div class="webinfo-item">
          <div>文章数目：</div>
          <div>146 篇</div>
        </div>
      

      
        <div class="webinfo-item">
          <div>已运行时间：</div>
          <div id="webinfo-runtime-count" publish_date="03/24/2020 21:34:09"></div>
        </div>
        <script>
          var BirthDay = new Date(new Date('2021/08/23'));
          var today = new Date();
          var timeold = (today.getTime() - BirthDay.getTime());
          var daysold = Math.floor(timeold / (24 * 60 * 60 * 1000));
          document.getElementById('webinfo-runtime-count').innerHTML = daysold + ' 天';
        </script>
      


      
        <div class="webinfo-item">
          <div>本站总字数：</div>
          <div>167.4k 字</div>
        </div>
      

      
        <div class="webinfo-item">
          <div>本站访客数：</div>
          
          <div><span id="busuanzi_value_site_uv"><i class="fas fa-fan fa-spin fa-fw" aria-hidden="true"></i></span> 人</div>
          
        </div>
      

      
        <div class="webinfo-item">
          <div>本站总访问量：</div>
          
          <div><span id="busuanzi_value_site_pv"><i class="fas fa-fan fa-spin fa-fw" aria-hidden="true"></i></span> 次</div>
          
        </div>
      

      
        <div class="webinfo-item">
          <div>最后活动时间：</div>
          
            <div id="last-update" style="display: none;">Fri Dec 24 2021 22:12:07 GMT+0800 (中国标准时间)</div>
            <div id="last-update-show">2021-12-24 日</div>
          
        </div>
        
        <script>
          function timeago(dateTimeStamp) {
              var minute = 1000 * 60; //把分，时，天，周，半个月，一个月用毫秒表示
              var hour = minute * 60;
              var day = hour * 24;
              var week = day * 7;
              var month = day * 30;
              var now = new Date().getTime(); //获取当前时间毫秒
              var diffValue = now - dateTimeStamp; //时间差
              if (diffValue < 0) {
                  return;
              }
              var minC = diffValue / minute; //计算时间差的分，时，天，周，月
              var hourC = diffValue / hour;
              var dayC = diffValue / day;
              var weekC = diffValue / week;
              var monthC = diffValue / month;
              if (monthC >= 1 && monthC <= 3) {
                  result = " " + parseInt(monthC) + " 月前"
              } else if (weekC >= 1 && weekC <= 3) {
                  result = " " + parseInt(weekC) + " 周前"
              } else if (dayC >= 1 && dayC <= 6) {
                  result = " " + parseInt(dayC) + " 天前"
              } else if (hourC >= 1 && hourC <= 23) {
                  result = " " + parseInt(hourC) + " 小时前"
              } else if (minC >= 1 && minC <= 59) {
                  result = " " + parseInt(minC) + " 分钟前"
              } else if (diffValue >= 0 && diffValue <= minute) {
                  result = "刚刚"
              } else {
                  var datetime = new Date();
                  datetime.setTime(dateTimeStamp);
                  var Nyear = datetime.getFullYear();
                  var Nmonth = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                  var Ndate = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                  var Nhour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
                  var Nminute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
                  var Nsecond = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
                  result = Nyear + "-" + Nmonth + "-" + Ndate
              }
              return result;
          }
          var lastUpDate = document.getElementById('last-update').innerHTML;
          try {
            document.getElementById('last-update-show').innerHTML = timeago(new Date(lastUpDate));
          } catch (error) {
            document.getElementById('last-update-show').innerHTML = '2021-12-24 日';
          }
        </script>
        
      
    </div>
  </div>
</section>

  


</aside>



		  
		  <!--此文件用来存放一些不方便取值的变量-->
<!--思路大概是将值藏到重加载的区域内-->

<script>
  window.pdata={}
  pdata.ispage=true;
  pdata.postTitle="Dockerfile指令详解";
  pdata.commentPath="";
  pdata.commentPlaceholder="";
  // header 这里无论是否开启pjax都需要
  var l_header=document.getElementById("l_header");
  
  l_header.classList.add("show");
  
  
    // cover
    var cover_wrapper=document.querySelector('.cover-wrapper');
    
    cover_wrapper.id="none";
    cover_wrapper.style.display="none";
    
  
</script>

        </div>
        
  
  <footer class="footer clearfix">
    <br><br>
    
      
        <div class="aplayer-container">
          

  
    <meting-js
      theme='#1BCDFC'
      autoplay='false'
      volume='0.7'
      loop='all'
      order='random'
      fixed='false'
      list-max-height='320px'
      server='netease'
      type='playlist'
      id='6929517097'
      list-folded='true'>
    </meting-js>
  


        </div>
      
    
      
        <div class='copyright'>
        <p><a href="/">Copyright © 2021 ☕憩息屋 All Rights Reserved. designed and developed by yangkaiqun.</a></p>

        </div>
      
    
  </footer>


        <a id="s-top" class="fas fa-arrow-up fa-fw" href="javascript:void(0)"></a>
      </div>
    </div>
    <div>
      <script>
/************这个文件存放不需要重载的全局变量和全局函数*********/
window.volantis={};
window.volantis.loadcss=document.getElementById("loadcss");
/******************** Pjax ********************************/
function VPjax(){
	this.list=[] // 存放回调函数
	this.start=()=>{
	  for(var i=0;i<this.list.length;i++){
		this.list[i].run();
	  }
	}
	this.push=(fn,name)=>{
		var f=new PjaxItem(fn,name);
		this.list.push(f);
	}
	// 构造一个可以run的对象
	function PjaxItem(fn,name){
		// 函数名称
		this.name = name || fn.name
		// run方法
		this.run=()=>{
			fn()
		}
	}
}
volantis.pjax={}
volantis.pjax.method={
	complete: new VPjax(),
	error: new VPjax(),
	send: new VPjax()
}
volantis.pjax={
	...volantis.pjax,
	push: volantis.pjax.method.complete.push,
	error: volantis.pjax.method.error.push,
	send: volantis.pjax.method.send.push
}
/********************脚本懒加载函数********************************/
// 已经加入了setTimeout
function loadScript(src, cb) {
	setTimeout(function() {
		var HEAD = document.getElementsByTagName('head')[0] || document.documentElement;
		var script = document.createElement('script');
		script.setAttribute('type','text/javascript');
		if (cb) script.onload = cb;
		script.setAttribute('src', src);
		HEAD.appendChild(script);
	});
}
//https://github.com/filamentgroup/loadCSS
var loadCSS = function( href, before, media, attributes ){
	var doc = window.document;
	var ss = doc.createElement( "link" );
	var ref;
	if( before ){
		ref = before;
	}
	else {
		var refs = ( doc.body || doc.getElementsByTagName( "head" )[ 0 ] ).childNodes;
		ref = refs[ refs.length - 1];
	}
	var sheets = doc.styleSheets;
	if( attributes ){
		for( var attributeName in attributes ){
			if( attributes.hasOwnProperty( attributeName ) ){
				ss.setAttribute( attributeName, attributes[attributeName] );
			}
		}
	}
	ss.rel = "stylesheet";
	ss.href = href;
	ss.media = "only x";
	function ready( cb ){
		if( doc.body ){
			return cb();
		}
		setTimeout(function(){
			ready( cb );
		});
	}
	ready( function(){
		ref.parentNode.insertBefore( ss, ( before ? ref : ref.nextSibling ) );
	});
	var onloadcssdefined = function( cb ){
		var resolvedHref = ss.href;
		var i = sheets.length;
		while( i-- ){
			if( sheets[ i ].href === resolvedHref ){
				return cb();
			}
		}
		setTimeout(function() {
			onloadcssdefined( cb );
		});
	};
	function loadCB(){
		if( ss.addEventListener ){
			ss.removeEventListener( "load", loadCB );
		}
		ss.media = media || "all";
	}
	if( ss.addEventListener ){
		ss.addEventListener( "load", loadCB);
	}
	ss.onloadcssdefined = onloadcssdefined;
	onloadcssdefined( loadCB );
	return ss;
};
</script>
<script>
  
  loadCSS("https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.14/css/all.min.css", window.volantis.loadcss);
  
  
  loadCSS("https://cdn.jsdelivr.net/gh/l-lin/font-awesome-animation/dist/font-awesome-animation.min.css", window.volantis.loadcss);
  
  
  loadCSS("https://cdn.jsdelivr.net/npm/node-waves@0.7.6/dist/waves.min.css", window.volantis.loadcss);
  
  
  loadCSS("https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@10/build/styles/solarized-light.min.css", window.volantis.loadcss);
  
</script>
<!-- required -->

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5/dist/jquery.min.js"></script>

<script>
  function pjax_fancybox() {
    $(".md .gallery").find("img").each(function () { //渲染 fancybox
      var element = document.createElement("a"); // a 标签
      $(element).attr("class", "fancybox");
      $(element).attr("pjax-fancybox", "");  // 过滤 pjax
      $(element).attr("href", $(this).attr("src"));
      if ($(this).attr("data-original")) {
        $(element).attr("href", $(this).attr("data-original"));
      }
      $(element).attr("data-fancybox", "images");
      var caption = "";   // 描述信息
      if ($(this).attr('alt')) {  // 判断当前页面是否存在描述信息
        $(element).attr('data-caption', $(this).attr('alt'));
        caption = $(this).attr('alt');
      }
      var div = document.createElement("div");
      $(div).addClass("fancybox");
      $(this).wrap(div); // 最外层套 div ，其实主要作用还是 class 样式
      var span = document.createElement("span");
      $(span).addClass("image-caption");
      $(span).text(caption); // 加描述
      $(this).after(span);  // 再套一层描述
      $(this).wrap(element);  // 最后套 a 标签
    })
    $(".md .gallery").find("img").fancybox({
      selector: '[data-fancybox="images"]',
      hash: false,
      loop: false,
      closeClick: true,
      helpers: {
        overlay: {closeClick: true}
      },
      buttons: [
        "zoom",
        "close"
      ]
    });
  };
  function SCload_fancybox() {
    if ($(".md .gallery").find("img").length == 0) return;
    loadCSS("https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css", document.getElementById("loadcss"));
    loadScript('https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js', pjax_fancybox)
  };
  $(function () {
    SCload_fancybox();
  });
  function Pjax_SCload_fancybox(){
	if (typeof $.fancybox == "undefined") {
	 SCload_fancybox();
    } else {
	 pjax_fancybox();
    }
  }
  volantis.pjax.push(Pjax_SCload_fancybox)
  volantis.pjax.send(()=>{
      if (typeof $.fancybox != "undefined") {
        $.fancybox.close();    // 关闭弹窗
      }
  },'fancybox')
</script>


<!-- internal -->



  
  

  <div id="rightmenu-wrapper">
    <ul class="list-v rightmenu" id="rightmenu-content">
      <li class='option'>
        <a class='vlts-menu opt fix-cursor-default' id='menu-copy-text' onclick="document.execCommand('copy')"><i class='fa fa-copy fa-fw'></i>复制文本</a>
        <hr id='hr-text'>
        <a class='vlts-menu opt fix-cursor-default' id='menu-copy-href'><i class='fa fa-link fa-fw'></i>复制链接</a>
        <a class='vlts-menu opt fix-cursor-default' id='menu-open-href'><i class='fa fa-external-link-square-alt fa-fw'></i>在新标签页打开</a>
        <hr id='hr-href'>
        <a class='vlts-menu opt fix-cursor-default' id='menu-copy-src'><i class='fa fa-image fa-fw'></i>复制图片地址</a>
        <hr id='hr-src'>
      </li>
      
        <li class='navigation'>
          <a class='nav icon-only fix-cursor-default' onclick='history.back()'><i class='fa fa-arrow-left fa-fw'></i></a>
          <a class='nav icon-only fix-cursor-default' onclick='history.forward()'><i class='fa fa-arrow-right fa-fw'></i></a>
          <a class='nav icon-only fix-cursor-default' onclick='window.location.reload()'><i class='fa fa-redo fa-fw'></i></a>
          <a class='nav icon-only fix-cursor-default' href='/'><i class='fa fa-home fa-fw'></i></a>
        </li>
      
      <hr>
      
        
      
        
          <hr>
        
      
        
          
    <li>
      <a class='vlts-menu fix-cursor-default ' href=http://www.demo443.com
        
        
        
        
          id="http:wwwdemo443com"
        >
        <i class='fa fa-fan fa-spin fa-fw'></i> 工具箱
      </a>
    </li>
  
        
      
        
          
    <li>
      <a class='vlts-menu fix-cursor-default ' 
        
        
        
          onclick="document.execCommand('print')"
        
        >
        <i class='fa fa-print fa-fw'></i> 打印页面
      </a>
    </li>
  
        
      
        
          <li class='music name'>
            <p class='nav music-title fix-cursor-default'></p>
          </li>
          <li class='music ctrl'>
            <a class='nav icon-only backward fix-cursor-default' onclick='aplayerBackward()'><i class='fa fa-step-backward fa-fw'></i></a>
            <a class='nav icon-only toggle fix-cursor-default' onclick='aplayerToggle()'><i class='fa fa-play fa-fw'></i></a>
            <a class='nav icon-only forward fix-cursor-default' onclick='aplayerForward()'><i class='fa fa-step-forward fa-fw'></i></a>
          </li>
          <li class='music volume'>
            <a class='nav volume'>
              <div class="aplayer-volume-bar-wrap">
                <div class="aplayer-volume-bar fix-cursor-pointer">
                  <div class="aplayer-volume"></div>
                  <i class='left fa fa-volume-off fa-fw'></i>
                  <i class='right fa fa-volume-up fa-fw'></i>
                </div>
              </div>
            </a>
          </li>
        
      
    </ul>
  </div>

  <script>
    window.document.oncontextmenu = function (event) {
      if (event.ctrlKey) return true;
      if (/Android|webOS|BlackBerry/i.test(navigator.userAgent)) return true;
      return popMenu(event);
    };
    document.addEventListener("click", function (event) {
      var mymenu = document.getElementById('rightmenu-wrapper');
      mymenu.style.display = "none";
    });
    function popMenu(event) {
      var mymenu = document.getElementById('rightmenu-wrapper');
      var menuContent = document.getElementById('rightmenu-content');
      var screenWidth = document.documentElement.clientWidth || document.body.clientWidth;
      var screenHeight = document.documentElement.clientHeight || document.body.clientHeight;
      mymenu.style.left = event.clientX + "px"; // 获取鼠标位置
      mymenu.style.top = event.clientY + "px";
      mymenu.style.display = 'block';
      if (event.clientX * 2 > screenWidth) {
        menuContent.classList.add('left');
      } else {
        menuContent.classList.remove('left');
      }
      if (event.clientY * 2 > screenHeight) {
        menuContent.classList.add('top');
      } else {
        menuContent.classList.remove('top');
      }

      let hrText = document.getElementById('hr-text');
      let hrSrc = document.getElementById('hr-src');
      let hrHref = document.getElementById('hr-href');

      // 选中图片
      let copySrc = document.getElementById('menu-copy-src');
      if (copySrc != undefined) {
        if (event.target.currentSrc) {
          copySrc.style.display = 'block';
          copySrc.addEventListener("click", function (e) {
            copyString(event.target.currentSrc);
          },{once: true});
          hrSrc.style.display = 'block';
        } else {
          copySrc.style.display = 'none';
          hrSrc.style.display = 'none';
        }
      }

      // 选中按钮
      // 判断是不是按钮
      let href = '';
      if (event.path) {
        for (i = 0; i < event.path.length; i++) {
          if (event.path[i].href != undefined && event.path[i].href.length > 0) {
            href = event.path[i].href;
          }
        }
      }

      let copyText = document.getElementById('menu-copy-text');
      copyText.style.display = 'none';
      hrText.style.display = 'none';
      if (href.length == 0) {
        // 选中文本
        if (window.getSelection().toString()) {
          if ('true' == 'true') {
            copyText.style.display = 'block';
            hrText.style.display = 'block';
          }
        }
      }

      // 在新标签页打开
      let openHref = document.getElementById('menu-open-href');
      if (openHref != undefined) {
        if (href.length > 0) {
          openHref.style.display = 'block';
          openHref.addEventListener("click", function (e) {
            window.open(href);
          },{once: true});
          hrHref.style.display = 'block';
        } else {
          openHref.style.display = 'none';
          hrHref.style.display = 'none';
        }
      }
      // 复制链接
      let copyHref = document.getElementById('menu-copy-href');
      if (copyHref != undefined) {
        if (href.length > 0) {
          copyHref.style.display = 'block';
          copyHref.addEventListener("click", function (e) {
            copyString(href);
          },{once: true});
        } else {
          copyHref.style.display = 'none';
        }
      }
      // 有音乐播放器 see: layout/_third-party/aplayer/script.ejs
      
      if(volantis.APlayerLoaded){ // APlayer加载完成？
        // 如果有aplayer，初始化一下
        checkAPlayer();
      }
      
      return false; // 该行代码确保系统自带的右键菜单不会被调出
    }
    function hideMenu() {
      document.getElementById('rightmenu-wrapper').style.display = 'none';
    }
    function copyString(str) {
      const input = document.createElement('input');
      input.setAttribute('readonly', 'readonly');
      document.body.appendChild(input);
      input.setAttribute('value', str);
      input.select();
      document.execCommand('copy');
      document.body.removeChild(input);
    }
    document.execCommand('click');
  </script>




<script>
  function loadIssuesJS() {
    if ($(".md").find(".issues-api").length == 0) return;
	
	  loadScript('/js/issues.js');
	
  };
  $(function () {
    loadIssuesJS();
  });
  volantis.pjax.push(()=>{
	if (typeof IssuesAPI == "undefined") {
	  loadIssuesJS();
	}
  },"IssuesJS")
</script>



  <script defer src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@17.1.0/dist/lazyload.min.js"></script>
<script>
  // https://www.npmjs.com/package/vanilla-lazyload
  // Set the options globally
  // to make LazyLoad self-initialize
  window.lazyLoadOptions = {
    elements_selector: ".lazyload",
    threshold: 0
  };
  // Listen to the initialization event
  // and get the instance of LazyLoad
  window.addEventListener(
    "LazyLoad::Initialized",
    function (event) {
      window.lazyLoadInstance = event.detail.instance;
    },
    false
  );
  document.addEventListener('DOMContentLoaded', function () {
    lazyLoadInstance.update();
  });
  document.addEventListener('pjax:complete', function () {
    lazyLoadInstance.update();
  });
</script>




  

<script async src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-volantis@2/js/instant_page.js" type="module" defer integrity="sha384-OeDn4XE77tdHo8pGtE1apMPmAipjoxUQ++eeJa6EtJCfHlvijigWiJpD7VDPWXV1"></script>





  <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
<script>
    var clipboard = new ClipboardJS('.btn-copy', {
        target: function (trigger) {
            return trigger.nextElementSibling
        }
    });
    function wait(callback, seconds) {
        var timelag = null;
        timelag = window.setTimeout(callback, seconds)
    }
    function pjax_initCopyCode() {
		if($(".highlight .code pre").length+$(".article pre code").length==0)return;
        var copyHtml = '';
        copyHtml += '<button class="btn-copy" data-clipboard-snippet="">';
        copyHtml += '<i class="fas fa-copy"></i><span>COPY</span>';
        copyHtml += '</button>';
        $(".highlight .code pre").before(copyHtml);
        $(".article pre code").before(copyHtml);
        clipboard.off('success').on('success', function (e) {
            let $btn = $(e.trigger);
            $btn.addClass('copied');
            let $icon = $($btn.find('i'));
            $icon.removeClass('fa-copy');
            $icon.addClass('fa-check-circle');
            let $span = $($btn.find('span'));
            $span[0].innerText = 'COPIED';
            wait(function () {
                $icon.removeClass('fa-check-circle');
                $icon.addClass('fa-copy');
                $span[0].innerText = 'COPY'
            }, 2000)
        });
        clipboard.off('error').on('error', function (e) {
            e.clearSelection();
            let $btn = $(e.trigger);
            $btn.addClass('copy-failed');
            let $icon = $($btn.find('i'));
            $icon.removeClass('fa-copy');
            $icon.addClass('fa-times-circle');
            let $span = $($btn.find('span'));
            $span[0].innerText = 'COPY FAILED';
            wait(function () {
                $icon.removeClass('fa-times-circle');
                $icon.addClass('fa-copy');
                $span[0].innerText = 'COPY'
            }, 2000)
        })
    }
    $(function () {
        pjax_initCopyCode()
    });
	volantis.pjax.push(pjax_initCopyCode)
</script>




   <script type="text/javascript">
  loadScript("https://cdn.jsdelivr.net/npm/scrollreveal@4.0.6/dist/scrollreveal.min.js")
  function pjax_scrollrebeal() {
    ScrollReveal().reveal('.l_main .reveal', {
      distance: '32px',
      duration: '800',
      interval: '20',
      scale: '1',
      easing: 'ease-out'
    });
  }
  $(function () {
  var checkScrollReveal = setInterval(function () {
    if ($("#safearea").css("display")!="block") return
    if (typeof ScrollReveal=="undefined") return
    clearInterval(checkScrollReveal)
	pjax_scrollrebeal();
  }, 100)
  });
  volantis.pjax.push(pjax_scrollrebeal)
</script>




  <script>
  let APlayerController = new Object();
  APlayerController.id = '6929517097';  // 设定全局音乐播放ID
  APlayerController.volume = '0.7';
  loadCSS("https://cdn.jsdelivr.net/npm/aplayer@1.10/dist/APlayer.min.css", window.volantis.loadcss);
  // APlayer 需要在  MetingJS 之前加载
  loadScript("https://cdn.jsdelivr.net/npm/aplayer@1.10/dist/APlayer.min.js")
  window.volantis.APlayerLoaded=0 // APlayer加载完成状态
  var checkAPlayer = setInterval(function () {
    if (!window.APlayer) return // APlayer加载完成？
	  if ($("#safearea").css("display")!="block") return // 文章内容加载完成？ see: source/css/first.styl
    clearInterval(checkAPlayer)
	  if (!window.volantis.APlayerLoaded&&!window.MetingJSElement){ // APlayer只能加载一次
      window.volantis.APlayerLoaded=1 // APlayer加载完成
      loadScript("https://cdn.jsdelivr.net/npm/meting@2.0/dist/Meting.min.js") // 加载 MetingJS
	  }
  }, 2500) // 按照网速调节差分2.5s
  // rightmenu see: layout/_partial/rightmenu.ejs

  
    loadScript("/js/aplayer.js")
  

</script>




  
  
<script src="https://cdn.jsdelivr.net/npm/valine@1.4/dist/Valine.min.js"></script>


<script>
  function emoji(path, idx, ext) {
    return path + "/" + path + "-" + idx + "." + ext;
  }
  var emojiMaps = {};
  for (var i = 1; i <= 54; i++) {
    emojiMaps['tieba-' + i] = emoji('tieba', i, 'png');
  }
  for (var i = 1; i <= 101; i++) {
    emojiMaps['qq-' + i] = emoji('qq', i, 'gif');
  }
  for (var i = 1; i <= 116; i++) {
    emojiMaps['aru-' + i] = emoji('aru', i, 'gif');
  }
  for (var i = 1; i <= 125; i++) {
    emojiMaps['twemoji-' + i] = emoji('twemoji', i, 'png');
  }
  for (var i = 1; i <= 4; i++) {
    emojiMaps['weibo-' + i] = emoji('weibo', i, 'png');
  }
  function pjax_valine() {
    if(!document.querySelectorAll("#valine_container")[0])return;
    let pagePlaceholder = pdata.commentPlaceholder || "快来评论吧~";
    let path = pdata.commentPath;
    if (path.length == 0) {
      let defaultPath = '';
      path = defaultPath || decodeURI(window.location.pathname);
    }
    var valine = new Valine();
    valine.init(Object.assign({"path":null,"placeholder":"快来评论吧~","appId":"0tm20G2zAnSoNq82yF7TCkjp-gzGzoHsz","appKey":"gdthrGg8z8Gw8swEWqKfwMli","meta":["nick","mail","link"],"requiredFields":["nick","mail"],"enableQQ":true,"recordIP":true,"avatar":"robohash","pageSize":10,"lang":"zh-cn","highlight":true,"mathJax":false,"js":"https://cdn.jsdelivr.net/npm/valine@1.4/dist/Valine.min.js","visitor":true}, {
      el: '#valine_container',
      path: path,
      placeholder: pagePlaceholder,
      emojiCDN: 'https://cdn.jsdelivr.net/gh/volantis-x/cdn-emoji/valine/',
      emojiMaps: emojiMaps,
    }))
  }
  $(function () {
    pjax_valine();
  });
  volantis.pjax.push(pjax_valine);
</script>




  <script defer src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-busuanzi@2.3/js/busuanzi.pure.mini.js" data-pjax></script>



  
<script src="/js/app.js"></script>



<!-- optional -->

  <script>
const SearchServiceimagePath="https://cdn.jsdelivr.net/gh/volantis-x/cdn-volantis@master/img/";
const ROOT =  ("/" || "/").endsWith('/') ? ("/" || "/") : ("//" || "/" );

$('.input.u-search-input').one('focus',function(){
	
		loadScript('https://cdn.jsdelivr.net/gh/volantis-x/cdn-volantis@2.6.4/js/search.js',setSearchService);
	
})

function listenSearch(){
  
    customSearch = new HexoSearch({
      imagePath: SearchServiceimagePath
    });
  
}
function setSearchService() {
	listenSearch();
	
		document.addEventListener("pjax:success", listenSearch);
	
}
</script>





  
<script src="https://cdn.jsdelivr.net/npm/node-waves@0.7.6/dist/waves.min.js"></script>

<script type="text/javascript">
$(function () {
  Waves.attach('.flat-btn', ['waves-button']);
  Waves.attach('.float-btn', ['waves-button', 'waves-float']);
  Waves.attach('.float-btn-light', ['waves-button', 'waves-float', 'waves-light']);
  Waves.attach('.flat-box', ['waves-block']);
  Waves.attach('.float-box', ['waves-block', 'waves-float']);
  Waves.attach('.waves-image');
  Waves.init();
});
</script>



  
<script src="https://cdn.jsdelivr.net/gh/volantis-x/cdn-volantis@2/js/comment_typing.js"></script>




  

<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@10/build/highlight.min.js"></script>

<script>hljs.initHighlightingOnLoad();</script>

<script>
volantis.pjax.push(()=>{
	document.querySelectorAll('pre code').forEach((block) => {
	  hljs.highlightBlock(block);
	});
},"highlightjs")
</script>





  <script>
const rootElement = document.documentElement;
const darkModeStorageKey = "user-color-scheme";
const rootElementDarkModeAttributeName = "data-user-color-scheme";

const setLS = (k, v) => {
    localStorage.setItem(k, v);
};

const removeLS = (k) => {
    localStorage.removeItem(k);
};

const getLS = (k) => {
    return localStorage.getItem(k);
};

const getModeFromCSSMediaQuery = () => {
  return window.matchMedia("(prefers-color-scheme: dark)").matches
    ? "dark"
    : "light";
};

const resetRootDarkModeAttributeAndLS = () => {
  rootElement.removeAttribute(rootElementDarkModeAttributeName);
  removeLS(darkModeStorageKey);
};

const validColorModeKeys = {
  dark: true,
  light: true,
};

const applyCustomDarkModeSettings = (mode) => {
  const currentSetting = mode || getLS(darkModeStorageKey);

  if (currentSetting === getModeFromCSSMediaQuery()) {
    resetRootDarkModeAttributeAndLS();
  } else if (validColorModeKeys[currentSetting]) {
    rootElement.setAttribute(rootElementDarkModeAttributeName, currentSetting);
  } else {
    resetRootDarkModeAttributeAndLS();
  }
};

const invertDarkModeObj = {
  dark: "light",
  light: "dark",
};

/**
 * get target mode
 */
const toggleCustomDarkMode = () => {
  let currentSetting = getLS(darkModeStorageKey);

  if (validColorModeKeys[currentSetting]) {
    currentSetting = invertDarkModeObj[currentSetting];
  } else if (currentSetting === null) {
    currentSetting = invertDarkModeObj[getModeFromCSSMediaQuery()];
  } else {
    return;
  }
  setLS(darkModeStorageKey, currentSetting);
  return currentSetting;
};

/**
 * bind click event for toggle button
 */
var btn=$("#wrapper .toggle-mode-btn,#rightmenu-wrapper .toggle-mode-btn");
function bindToggleButton() {
    btn.on('click',(e) => {
      const mode = toggleCustomDarkMode();
      applyCustomDarkModeSettings(mode);
    });
}

applyCustomDarkModeSettings();
document.addEventListener("DOMContentLoaded", bindToggleButton);
volantis.pjax.push(bindToggleButton);
volantis.pjax.send(()=>{
	btn.unbind('click');
},'toggle-mode-btn-unbind');
</script>





<!-- baidu Analytics -->
<script>
var _hmt = _hmt || [];
(function() {
  setTimeout(function() {
    loadScript("https://hm.baidu.com/hm.js?VnXOrCA4S07hLqXKYg8UjNVb")
  }, 5000);
})();
// 关于百度统计对 SPA 页面的处理：
// 方案一：百度统计>管理>单页应用设置中，打开开启按钮即可对SPA进行统计。 https://tongji.baidu.com/web/help/article?id=324
// 方案二：取消注释下列代码。 https://tongji.baidu.com/web/help/article?id=235
volantis.pjax.push(()=>{_hmt.push(['_trackPageview', document.location.pathname]);},'baidu_analytics')
</script>




<script>
function listennSidebarTOC() {
  const navItems = document.querySelectorAll(".toc li");
  if (!navItems.length) return;
  const sections = [...navItems].map((element) => {
    const link = element.querySelector(".toc-link");
    const target = document.getElementById(
      decodeURI(link.getAttribute("href")).replace("#", "")
    );
    link.addEventListener("click", (event) => {
      event.preventDefault();
      window.scrollTo({
		top: target.offsetTop + 100,
		
		behavior: "smooth"
		
	  });
    });
    return target;
  });

  function activateNavByIndex(target) {
    if (target.classList.contains("active-current")) return;

    document.querySelectorAll(".toc .active").forEach((element) => {
      element.classList.remove("active", "active-current");
    });
    target.classList.add("active", "active-current");
    let parent = target.parentNode;
    while (!parent.matches(".toc")) {
      if (parent.matches("li")) parent.classList.add("active");
      parent = parent.parentNode;
    }
  }

  function findIndex(entries) {
    let index = 0;
    let entry = entries[index];
    if (entry.boundingClientRect.top > 0) {
      index = sections.indexOf(entry.target);
      return index === 0 ? 0 : index - 1;
    }
    for (; index < entries.length; index++) {
      if (entries[index].boundingClientRect.top <= 0) {
        entry = entries[index];
      } else {
        return sections.indexOf(entry.target);
      }
    }
    return sections.indexOf(entry.target);
  }

  function createIntersectionObserver(marginTop) {
    marginTop = Math.floor(marginTop + 10000);
    let intersectionObserver = new IntersectionObserver(
      (entries, observe) => {
        let scrollHeight = document.documentElement.scrollHeight + 100;
        if (scrollHeight > marginTop) {
          observe.disconnect();
          createIntersectionObserver(scrollHeight);
          return;
        }
        let index = findIndex(entries);
        activateNavByIndex(navItems[index]);
      },
      {
        rootMargin: marginTop + "px 0px -100% 0px",
        threshold: 0,
      }
    );
    sections.forEach((element) => {
      element && intersectionObserver.observe(element);
    });
  }
  createIntersectionObserver(document.documentElement.scrollHeight);
}

document.addEventListener("DOMContentLoaded", listennSidebarTOC);
document.addEventListener("pjax:success", listennSidebarTOC);
</script>

<!-- more -->

 
	   
	    


<script src="https://cdn.jsdelivr.net/npm/pjax@0.2.8/pjax.min.js"></script>


<script>
    var pjax;
    document.addEventListener('DOMContentLoaded', function () {
      pjax = new Pjax({
        elements: 'a[href]:not([href^="#"]):not([href="javascript:void(0)"]):not([pjax-fancybox])',
        selectors: [
          "title",
          
          "#pjax-container",
          "#pjax-header-nav-list"
        ],
        cacheBust: false,   // url 地址追加时间戳，用以避免浏览器缓存
        timeout: 5000
      });
    });

    document.addEventListener('pjax:send', function (e) {
      //window.stop(); // 相当于点击了浏览器的停止按钮

      try {
        var currentUrl = window.location.pathname;
        var targetUrl = e.triggerElement.href;
        var banUrl = [""];
        if (banUrl[0] != "") {
          banUrl.forEach(item => {
            if(currentUrl.indexOf(item) != -1 || targetUrl.indexOf(item) != -1) {
              window.location.href = targetUrl;
            }
          });
        }
      } catch (error) {}

      window.subData = null; // 移除标题（用于一二级导航栏切换处）

      volantis.$switcher.removeClass('active'); // 关闭移动端激活的搜索框
      volantis.$header.removeClass('z_search-open'); // 关闭移动端激活的搜索框
      volantis.$wrapper.removeClass('sub'); // 跳转页面时关闭二级导航

      // 解绑事件 避免重复监听
      volantis.$topBtn.unbind('click');
      $('.menu a').unbind('click');
      $(window).unbind('resize');
      $(window).unbind('scroll');
      $(document).unbind('scroll');
      $(document).unbind('click');
      $('body').unbind('click');
	  // 使用 volantis.pjax.send 方法传入pjax:send回调函数 参见layout/_partial/scripts/global.ejs
	  volantis.pjax.method.send.start();
    });

    document.addEventListener('pjax:complete', function () {
      $('.nav-main').find('.list-v').not('.menu-phone').removeAttr("style",""); // 移除小尾巴的移除
      $('.menu-phone.list-v').removeAttr("style",""); // 移除小尾巴的移除
      $('script[data-pjax], .pjax-reload script').each(function () {
        $(this).parent().append($(this).remove());
      });
      try{
		// 使用 volantis.pjax.push 方法传入重载函数 参见layout/_partial/scripts/global.ejs
		volantis.pjax.method.complete.start();
      } catch (e) {
        console.log(e);
      }
    });

    document.addEventListener('pjax:error', function (e) {
	  // 使用 volantis.pjax.error 方法传入pjax:error回调函数 参见layout/_partial/scripts/global.ejs
	  volantis.pjax.method.error.start();
      window.location.href = e.triggerElement.href;
    });
</script>
 
	  
    </div>
  </body>
</html>
