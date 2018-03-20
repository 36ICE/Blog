<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>注册</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/font/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">


		<!--注册验证  -->
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
		
		
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
<%--         <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/ico/apple-touch-icon-57-precomposed.png"> --%>
<style>
.navbar-brand {
	background-image:
		url(${pageContext.request.contextPath}/img/logo@2x.png) !important;
	background-repeat: no-repeat !important;
	background-size: 123px 49px !important;
}
</style>
<script type="text/javascript">
	//必须同意协议后才可注册
	function enable(){
		var terms = document.getElementById("terms");
		var register = document.getElementById("register");
		if(terms.checked){
			register.disabled=false;
		}else{
			register.disabled=true;
		}
	}
	//检查用户名是否合法,只能由英文字母、数字和下划线组成，且开头不能为数字
	function checkName(){
		var name = document.getElementById("name");
		var pic = document.getElementById("pic");
		var checkName = document.getElementById("checkName");
		var patrn=/^[a-zA-Z_]{1}\w{5,16}$/; 
		if (!patrn.exec(name.value)){
			 checkName.style.color="red";
			 checkName.innerHTML="用户名输入有误!";
			 return false;
		}else{	
			 checkName.style.color="green";
			 checkName.innerHTML="√ 输入正确";
			 return true;
		}
	}
	//检查用户名是否存在
	var req;
	function checkNE(){
		var name = document.getElementById("name");
		if(checkName()){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置回调函数
			req.onreadystatechange = callbackForName;
			var url = "checkNameExist?name="+name.value;
			req.open("get",url,true);
			req.send(null);
			return true;
		}else{
			return false;
		}
		
	}
	function callbackForName(){
		var name = register_form.name.value;
		var checkName = document.getElementById("checkName");
		var state = req.readyState;
		if(state==4){
			var doms = req.responseXML;
			var user = doms.getElementsByTagName("user");
			if(user[0].getElementsByTagName("name")[0].firstChild.data=="exist"){//用户名已经存在
				//window.open("exist.jsp","fail","width=180,height=120,left=200,top=180");
				checkName.style.color = "red";
				checkName.innerHTML="账号"+name+"已经存在!";	
			}else{
				//window.open("notExist.jsp","success","width=180,height=120,left=200,top=180");
				checkName.style.color = "green";
				checkName.innerHTML="恭喜账号"+name+"可用!";	
			}
		}
	}
	//检查密码,只能由英文字母和数字组成
	function checkPassword(){
		var password1 = document.getElementById("password1");
		var pwdRemind = document.getElementById("pwdRemind");
		var patrn=/^[a-z,A-Z,0-9]{6,15}$/;
		if (!patrn.exec(password1.value)){
			pwdRemind.style.color="red";
			pwdRemind.innerHTML="密码格式输入有误!";
			return false;
		}else{
			pwdRemind.style.color="green";
			pwdRemind.innerHTML="√ 输入正确";
			return true;
		}
	}
	//确认密码
	function checkPwd(){
		var password1 = document.getElementById("user_password");
		var password2 = document.getElementById("user_password2");
		var checkPwd = document.getElementById("checkPwd");
		if(password1.value!=password2.value){
			checkPwd.style.color="red";
			checkPwd.innerHTML="两次密码输入不一致!";
			return false;
		}else{
			checkPwd.style.color="green";
			checkPwd.innerHTML="两次密码输入一致!";
			return true;
		}
	}
	//验证邮箱格式
	function checkMail(){
		var email = document.getElementById("email");
		var patrn=/((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
		var checkMail = document.getElementById("checkMail");
		if(!patrn.exec(email.value)){
			checkMail.style.color="red";
			checkMail.innerHTML="邮箱格式输入有误!";
			return false;
		}else{
			checkMail.style.color="green";
			checkMail.innerHTML="√ 邮箱输入正确!";
			return true;
		}
	}
	//校验邮政编码,必须是六位数字，且第一位不能为0
	function isPostalCode()
	{
	var postCode = document.getElementById("postcode");
	var remindPostCode = document.getElementById("remindPostCode");
	var patrn=/^[1-9]{1}(\d){5}$/;
	if (!patrn.exec(postCode.value)){
		remindPostCode.style.color="red";
		remindPostCode.innerHTML="邮政编码输入有误";
		return false;
	}else{
		remindPostCode.style.color="green";
		remindPostCode.innerHTML="√ 输入正确";
		return true
	}
	}
	//校验固定电话号码
	function checkPhone(){
		var phone = document.getElementById("phone");
		var checkPhone = document.getElementById("checkPhone");
		var patrn=/^[+]{0,1}\d{3,5}-?\d{5,9}$/;
		if (!patrn.exec(phone.value)){
			checkPhone.style.color="red";
			checkPhone.innerHTML="电话格式不正确";
			return false;
		}else{
			checkPhone.style.color="green";
			checkPhone.innerHTML="√ 输入正确";
			return true;
		}
	}
	//校验移动电话号码
	function checkMPhone(){
		var phone = document.getElementById("mphone");
		var checkMphone = document.getElementById("checkMphone");
		var patrn=/^1[356]\d{9}|01[356]\d{9}$/;
		if (!patrn.exec(phone.value)){
			checkMphone.style.color="red";
			checkMphone.innerHTML="手机格式不正确";
			return false;
		}else{
			checkMphone.style.color="green";
			checkMphone.innerHTML="√ 输入正确";
			return true;
		}
	}
	//检查验证码是否正确
	function checkCode(){
		var code = document.getElementById("code");
		var codeR = document.getElementById("codeR");
		if(code.value != null){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置回调函数
			req.onreadystatechange = callbackForCode;
			var url = "checkRandomCode?code="+code.value;
			req.open("get",url,true);
			req.send(null);
			return true;
		}else{
			codeR.style.color="red";
			codeR.innerHTML="请输入验证码";
			return false;
		}
		
	}
	function callbackForCode(){
		var state = req.readyState;
		var codeR = document.getElementById("codeR");
		if(state==4){
			var doms = req.responseXML;
			var code = doms.getElementsByTagName("code");
			var message = code[0].getElementsByTagName("message")[0].firstChild.data;
			if(code[0].getElementsByTagName("message")[0].firstChild.data=="correct"){//验证码输入正确
				codeR.style.color="green";
				codeR.innerHTML="√ 输入正确";
			}else{
				codeR.style.color="red";
				codeR.innerHTML="输入错误";
			}
		}
	}
	//必须所有信息填写正确才能成功提交信息
	function checkAll(){
	
		alert("aaa");
		if(checkName()&&checkPassword()&&checkPwd()&&checkMail()&&checkMPhone()&&checkCode()){
			document.register_form.submit();	
		}
		
	}
	//清除用户名错误提示
	function clearRN(){
		var checkName = document.getElementById("checkName");
		checkName.style.color="black";
		checkName.innerHTML="英文字母或下划线(6-15)字符组成";
	}
	//清除密码验证错误提示
	function clearPwd(){
		var checkPwd = document.getElementById("checkPwd");
		var pwdRemind = document.getElementById("pwdRemind");
		checkPwd.style.color="black";
		checkPwd.innerHTML="由英文字母和数字(6-15)字符组成";
		pwdRemind.innerHTML="";
	}
	//清除邮箱错误提示
	function clearMail(){
		var checkMail = document.getElementById("checkMail");
		checkMail.style.color="black";
		checkMail.innerHTML="请输入正确的邮箱地址";
	}
	//清除邮政编码错误提示
	function clearPostR(){
		var remindPostCode = document.getElementById("remindPostCode");
		remindPostCode.innerHTML="";
	}
	//清除固定电话错误提示
	function clearPhoneR(){
		var checkPhone = document.getElementById("checkPhone");
		checkPhone.innerHTML="";
	}
	//清除移动电话错误提示
	function clearMphoneR(){
		var checkMphone = document.getElementById("checkMphone");
		checkMphone.innerHTML="";
	}
	//刷新验证码
	function refreshCode(){
		var safeCode = document.getElementById("safeCode");
		safeCode.src = "code";
	}
</script>
</head>

    <body style="background: url(${pageContext.request.contextPath}/img/backgrounds/1.jpg) ;">

 
		Top menu
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/user/login.htm" style="">个人博客系统注册</a>
				</div>
			
			</div>
		</nav>

        <!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>软通</strong> 个人博客系统注册
						</h1>

					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">

						<form role="form"action="${pageContext.request.contextPath}/user/checkRegister.htm" method="post" class="registration-form">

							<fieldset>
								<div class="form-top">
									<div class="form-top-left">
										<h3>Step 1 / 2</h3>

									</div>
									<div class="form-top-right">
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="form-bottom" id="form-bottom">
									<div class="form-group">
										<label class="sr-only" id="validate_user_name"
											for="form-first-name"></label> <input type="text"
											name="user_name" placeholder="user_name"
											class="form-first-name form-control" id="user_name">

									</div>
									<div class="form-group">
										<label class="sr-only" for="form-last-name">sex</label> 
										<input type="radio" name="user_sex" value="男" checked="checked" />男
                              <input type="radio" name="user_sex" value="女"  />女
										<!-- <input
											type="text" name="user_sex" placeholder="Sex"
											class="form-last-name form-control" id="user_sex"> -->
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-about-yourself">Job</label> <input
											name="user_job" placeholder="you job..."
											class="form-about-yourself form-control" id="user_job">
									</div>
									<button type="button" id="step_1" class="btn btn-next">Next</button>
								</div>
							</fieldset>

							<fieldset>
								<div class="form-top">
									<div class="form-top-left">
										<h3>Step 2 / 2</h3>

									</div>
									<div class="form-top-right">
										<i class="fa fa-key"></i>
									</div>
								</div>
								<div class="form-bottom">
									<div class="form-group">
										<label class="sr-only" for="form-email">Email</label> <input
											type="text" name="user_mail" placeholder="Email..."
											class="form-email form-control" id="user_mail">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-password">Password</label> <input
											type="password" name="user_password"
											placeholder="Password..." class="form-password form-control"
											id="user_password">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-repeat-password" id="checkPwd">Repeat password</label>
											 <input type="password" name="user_password2"
											placeholder="Repeat password..."
											class="form-repeat-password form-control"
											id="user_password2" onblur="checkPwd()">
									</div>
									<button type="button" class="btn btn-previous">Previous</button>
									<button type="submit" class="btn" onclick="checkAll()" >Sign me up!</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Javascript -->
       <script src="${pageContext.request.contextPath}/js/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/js/jquery.backstretch.min.js"></script> 
        <script src="${pageContext.request.contextPath}/js/js/retina-1.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/js/scripts.js"></script> 
        
        <!--[if lt IE 10]>
            <script src="${pageContext.request.contextPath}/js/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>