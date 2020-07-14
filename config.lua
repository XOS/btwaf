--WAF config file,enable = "on",disable = "off"

--waf status
config_waf_enable = "on"
--log dir
config_log_dir = "/www/wwwlogs/btwaf"
--rule setting
config_rule_dir = "/www/server/nginx/btwaf/wafconf"
--enable/disable white url
config_white_url_check = "on"
--enable/disable white ip
config_white_ip_check = "on"
--enable/disable block ip
config_black_ip_check = "on"
--enable/disable url filtering
config_url_check = "on"
--enalbe/disable url args filtering
config_url_args_check = "on"
--enable/disable user agent filtering
config_user_agent_check = "on"
--enable/disable cookie deny filtering
config_cookie_check = "on"
--enable/disable cc filtering
config_cc_check = "on"
--cc rate the xxx of xxx seconds
config_cc_rate = "100/60"
--enable/disable post filtering
config_post_check = "on"
--config waf output redirect/html
config_waf_output = "html"
--if config_waf_output ,setting url
config_waf_redirect_url = "/captcha"
config_waf_captcha_html=[[
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title data-sw-translate>Please enter verification code | WebSite WAF</title>
		<style>
			body { font-family: Tahoma, Verdana, Arial, sans-serif; }
                        .head_title{margin-top:100px; font-family:"微软雅黑"; font-size:50px; font-weight:lighter;}
                        p{font-family:"微软雅黑"; font-size:16px; font-weight:lighter; color:#666666;}
                        .btn{ float:left;margin-left:15px; margin-top:5px; width:85px; height:30px; background:#56c458;font-family:"微软雅黑"; font-size:16px; color:#FFFFFF; border:0;}
                        .inp_s{ float:left; margin-left:15px; margin-top:5px; width:200px; height:30px;}
                        .yz{float:left; width:160px; height:40px;}
                        .fors{ margin:0 auto;width:500px; height:40px;}
                .form {width: 500px; margin: 2em auto;}
        </style>
	</head>
	<body>
		<div align="center">
			<p>
				<h1 class="head_title" data-sw-translate>Sorry...</h1>
			</p>
			<p data-sw-translate>Your query looks similar to an automated request from computer software. In order to protect
				our users, please forgive us for temporarily not processing your request.</p>
			<p data-sw-translate>To continue accessing the webpage, please enter the characters shown below:</p>
			<div class="form">
				<img id="captcha-img" class="yz" src="https://oneinstack.com/api/v1/captcha/BrqDr57p3mjj0xAuEQEW.png" alt="Captcha image">
				<input id="captcha-input" class="inp_s" type="text" name="response" />
				<input id="captcha-id" class="inp_s" type="hidden" name="response" />
				 <input id="captcha-submit" class="btn" type="submit"
				 data-sw-translate value="Submit" />
			</div>
		</div>
		<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
		<script>
			let captcha_id = ''
			var url = 'https://oneinstack.com/api/v1/captcha'
			var urlimg = 'https://oneinstack.com/api/v1/'
			// 获取验证码 hash
			getImg()
			function getImg() {
				$.get(url).then((res) => {
					$('#captcha-img').attr('src', urlimg + '/' + res.data.image_url)
					$('#captcha-id').val(res.data.captcha_id)
				})				
			}
			$('#captcha-img').on('click',function(e) {
				getImg()
			})
			$('#captcha-submit').on('click', function(e) {
				var data = {
					captcha_id: $('#captcha-id').val(),
					captcha_code: document.querySelector('#captcha-input').value,					
				}

                $.ajax({
                    url: `${url}/verify`,
                    type: 'post',
                    dataType: 'json',
					contentType: 'application/json',
                    data: JSON.stringify(data),
					cache: false,
                    success: function(res){
						var targetUrl = new URLSearchParams(location.search).get('continue')
						targetUrl = atob(targetUrl)
						location.href = targetUrl
                    },
                    error: function(e) {
						location.reload()
                    }
                })

			})
			window.SwaggerTranslator = {
				_words: [],
				translate: function() {
					var $this = this;
					$('[data-sw-translate]').each(function() {
						$(this).html($this._tryTranslate($(this).html()));
						$(this).val($this._tryTranslate($(this).val()));
						$(this).attr('title', $this._tryTranslate($(this).attr('title')));
					});
				},

				_tryTranslate: function(word) {
					return this._words[$.trim(word)] !== undefined ? this._words[$.trim(word)] : word;
				},

				learn: function(wordsMap) {
					this._words = wordsMap;
				}
			};

			window.SwaggerTranslator.learn({
				"Please enter verification code | 网站防火墙": "输入验证码 | 网站防火墙",
				"Your query looks similar to an automated request from computer software. In order to protect our users, please forgive us for temporarily not processing your request.": "您的查询看起来类似于来自计算机软件的自动请求。为了保护我们的用户，请原谅我们现在暂时不能处理您的请求。",
				"To continue accessing the webpage, please enter the characters shown below:": "要继续访问网页，请输入下面所示字符：",
				"Sorry...": "很抱歉...",
				"Submit": "提交",
			});

			$(function() {
				window.SwaggerTranslator.translate();
			});
		</script>
	</body>
</html>
]]
config_output_html=[[
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>网站防火墙</title>
<style>
*{margin:0;padding:0;color:#444}
body{font-size:14px;font-family:"宋体"}
.main{width:600px;margin:10% auto;}
.title{background: #20a53a;color: #fff;font-size: 16px;height: 40px;line-height: 40px;padding-left: 20px;}
.content{background-color:#f3f7f9; height:320px;border:1px dashed #c6d9b6;padding:20px}
.t1{border-bottom: 1px dashed #c6d9b6;color: #ff4000;font-weight: bold; margin: 0 0 20px; padding-bottom: 18px;}
.t2{margin-bottom:8px; font-weight:bold}
ol{margin:0 0 20px 22px;padding:0;}
ol li{line-height:30px}
</style>
</head>

<body>
	<div class="main">
		<div class="title">您的请求已被拒绝！</div>
		<div class="content">
			<p class="t1">您的请求带有不合法参数，已被网站管理员设置拦截！</p>
			<p class="t2">可能原因：</p>
			<ol>
				<li>您提交的内容包含危险的攻击请求</li>
				<li>您使用了代理程序请求了该页面</li>
			</ol>
			<p class="t2">如何解决：</p>
			<ol>
				<li>检查提交内容；</li>
				<li>关闭代理程序；</li>
				<li>更换IP或浏览器；</li>
				<li>这是误报，请联系<a href="mailto:admin@nange.cn" target="_blank" rel="nofollow noopener" class="fa fa-envelope" title="给我发邮件"><span class="label">网站管理员</span></a>解除拦截。</li>
				
			</ol>
		</div>
	</div>
</body>
</html>
]]
