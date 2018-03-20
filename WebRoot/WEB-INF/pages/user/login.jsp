<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人博客系统登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
 
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script src="${pageContext.request.contextPath}/js/ga.js"></script>
	
	<jsp:include page="/common/head.jsp"></jsp:include>

  </head>
  
  <body>
  
    	<script type="text/javascript">
    	

    	function checkUser(){
    		var message;
    		 $.ajax({
    	         type: "GET",
    	         url: "user/checkUser.htm",
    	         data: {user_name:$("#user_name").val(), user_password:$("#user_password").val()},
    	         dataType: "json",
    	         success: function(data){
    	                    if(data.message='正确'){
    	                    	 return true;
    	                    }else{
    	                    	$('#check').innerHTML ="<font color="red">用户名或密码错误</font>"
    	                    	return false;
    	                    }
    	                  }
    	     });
    		 return true;
    	}
    	
    	
  		var protocol = window.location.protocol;
  		document.write('<script type="text/javascript" src="' +protocol+ '//csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random() + '"></'+'script>');
	</script>
  
     <div class="main" style="background: url(${pageContext.request.contextPath}/img/login-bg.png);min-width:1024px;">
      <div class="container container-custom"  style="width:1024px">
  
	<div class="row wrap-login">
		<div class="login-banner col-sm-6 col-md-7 col-lg-7 hidden-xs">
			<a href="/index.jsp" target="_blank">
			<img src="${pageContext.request.contextPath}/img/login-banner.png" 
			class="img-responsive"></a>
		</div>
		<div class="login-user col-xs-12 col-sm-6 col-md-5 col-lg-5">
			<div class="login-part">
				<h3>帐号登录</h3>
				<div class="user-info">
					<div class="user-pass">

						<form id="fm1" action="${pageContext.request.contextPath}/user/checkUser.htm" method="post">

							<input id="username" name="user_name" tabindex="1"
							placeholder="输入用户名" value=""class="user-name" type="text" value="" /> 
								
							<input id="password"name="user_password" tabindex="2" placeholder="输入密码"
								class="pass-word" type="password" value="" autocomplete="off" />

							<div class="error-mess" style="display:none;">
								<span class="error-icon"></span><span id="error-message"></span>
							</div>
							<div class="row forget-password">
								<span class="col-xs-6 col-sm-6 col-md-6 col-lg-6"> 
								<input type="checkbox" name="rememberMe" id="rememberMe" value="true" class="auto-login" tabindex="4" /> 
								<label for="rememberMe">下次自动登录</label>
								</span> 
								<span class="col-xs-6 col-sm-6 col-md-6 col-lg-6 forget tracking-ad" data-mod="popu_26">
								 <a href="#"tabindex="5">忘记密码</a>
								</span>
							</div>
							<div id="checkUser"></div>

							 <input class="logging"  value="登 录" tabindex="6"type="submit"id="submit" />

						</form>
					</div>
				</div>
				
				 <div class="line"></div>
              <div class="third-part tracking-ad" data-mod="popu_27">

                <div class="register-now"><span>还没有博客帐号？</span>
	                <span class="register tracking-ad" data-mod="popu_28">
	                	<a href="${pageContext.request.contextPath}/user/register.htm">立即注册</a>
	                </span>
               	</div>
              </div>
            </div>
				
			</div>
		</div>
	</div>
	</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
