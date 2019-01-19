<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>用户登录</title>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/header.css" />
		<link rel="stylesheet" href="css/footer.css" />
		<link rel="stylesheet" href="css/login.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
		<script>
			$(function() {
				$(".input p input").focus(function() {
					$(this).css("border", "2px solid #00AEFF");
					//清空文字
				});
				$(".input p input").blur(function() {
					$(this).css("border", "1px solid gray");
				});
				$("#modlgn_username").blur(function() {
					if($(this).val() == '') {
						$(this).prev().show();
						$(this).prev().html("学号不能为空");
						$("#login").attr("disabled", true); 
					}
				});
				$("#modlgn_pwd").blur(function() {
					if($(this).val() == '') {
						$(this).prev().show();
						$(this).prev().html("密码不能为空");
						$("#login").attr("disabled", true); 
					}
				});
				$("#checkcode").click(function(){
				    var newSrc="${pageContext.request.contextPath}/checkImg?sss="+new Date().getTime();
				    $(this).attr("src",newSrc);
				});
		});
		</script>
	</head>

	<body>
		<!--登录页页面的头部-->
		<div class="header">
			<div>
				<a href="index.jsp" id="logo"><img src="images/logo2.png" alt="logo" /></a>
				<div class="navigation">
					<ul class="first">
						<li class="first">
							<a href="admin/adminLogin.jsp">管理员登录入口</a>
						</li>
						<li>
							<a href="eleResources.jsp">电子资源</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/index.action">返回首页</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--中间模块-->
		<div class="login_top">
			<div class="container">
				<div class="col-md-6">
					<div class="login-page">
						<h4 class="title">注册账户</h4>
						<p>&nbsp;&nbsp;校园图书公益换阅平台是玉林师范学院推广的一个旧书籍循环利用，公益借阅的一个平台。 在这里，你可以找到自己所需要的书籍，同时在借阅他们的书籍时，请爱护他人书籍，不在书本乱改乱画，按时主动归还。 在这里，你可以找到书籍交流的“知音”，可以畅享书的海洋。 本校同学，学号密码登录，原始密码是123456。如果登录不成功，则是您的账号未注册，请及时注册，等待管理员的审理，注册成功 后，方可借阅和分享自己的书籍。
						</p>
						<div class="button1">
							<a href="register.jsp"><input type="submit" name="Submit" value="创建用户"></a>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="login-page">
						<div class="login-title">
							<h4 class="title">账户登录</h4>
							<div style="color: red;"><%=request.getAttribute("StuloginInfo")==null?"":request.getAttribute("StuloginInfo")%></div>
							<div id="loginbox" class="loginbox">
								<form action="${pageContext.request.contextPath}/login.action" method="post" id="login-form">
									<fieldset class="input">
										<p id="login-form-username">
											<label for="modlgn_username">学号</label>
											<span class="hit_span"></span>
											<input id="modlgn_username" type="text" name="stuid" class="inputbox" size="20" placeholder="例如 201506401125" autocomplete="off"/>
										</p>
										<p id="login-form-pwd">
											<label for="modlgn_pwd">密码</label>
											<span class="hit_span"></span>
											<input id="modlgn_pwd" type="password" name="stupwd" class="inputbox" size="20" placeholder="原始密码 abc123" />
										</p>
										<p style="margin-top: 10px;">											
											<div class="col-md-7">
												<input type="text" class="inputbox" id="inputCode" name="checkCode" style="border: 1px #00AEFF solid;margin:0px;" autocomplete="off">
											</div>
											<div class="col-md-5">
												<img src="${pageContext.request.contextPath}/checkImg" alt="验证码" style="border: 1px gray solid;" id="checkcode"/>
											</div>
										</p>
										<br>
										<div class="remember">
											<p id="login-form-remember">
												<label for="modlgn_remember"><a href="password.index">忘记密码? </a></label>
											</p>
											<input type="submit" name="SubmitLogin" id="login"class="button" value="登录">
											<div class="clear"></div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--底部声明-->
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
