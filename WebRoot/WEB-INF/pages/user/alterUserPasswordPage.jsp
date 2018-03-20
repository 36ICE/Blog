<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link media="all" href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<jsp:include page="/common/header.jsp"></jsp:include>
<jsp:include page="/common/tab.jsp"></jsp:include>
<script type="text/javascript">


function checkAll() {
	var oldPasswordmsg = document.getElementById("oldPasswordmsg");
	var renewPasswordmsg = document.getElementById("renewPasswordmsg");
	if(oldPasswordmsg.innerHTML=="成功"&& renewPasswordmsg.innerHTML == "密码一致"){
		var newPassword =  document.form1.newPassword.value;
		url="${pageContext.request.contextPath}/user/alterPassword.htm?newPassword="+newPassword;
		url=encodeURI(encodeURI(url));
		window.location=url;
		
		return true;
	}else{
		return false;
	}
} 


	function checkoldPassword(x) {
		var oldPasswordmsg = document.getElementById("oldPasswordmsg");
		
		$.ajax({
			type : "POST",
			url : PATH + "/user/checkoldPassword.htm?oldPassword=" + x.value,
			contentType : 'application/json',
			dataType : "json",
			success : function(data) {
				
				if (data.message == 'true') {
					
					oldPasswordmsg.innerHTML = "<font size=4 color='gree'>成功</font>";
					return true;
				} else {
					//alert("密码错误");
					oldPasswordmsg.innerHTML = "<font  size=4  color='red'>密码错误</font>";
					return false;
				}
			},
			error : function(data) {
				alert("error");
			}
		});
	}
	function checkrenewPassword() {
		var renewPasswordmsg = document.getElementById("renewPasswordmsg");
		var newPassword = document.getElementById("newPassword").value;
		var renewPassword = document.getElementById("renewPassword").value;
		//alert(newPassword);
		//alert(renewPassword);
		if (newPassword == renewPassword) {
			renewPasswordmsg.innerHTML =  "<font  size=4  color='gree'>密码一致</font>";
			return true;
		} else {
			renewPasswordmsg.innerHTML = "<font  size=4  color='red'>密码不一致</font>";
			return false;
		}

	}
</script>
<div class="container-fluid" style="width:1024px;">
	<div class="row" style="">
		<jsp:include page="/common/nav.jsp"></jsp:include>
		<div class="col-sm-8" style="border:1px solid #555;margin-left: 20px;height:100%;">
			<div id="myTabContent" class="tab-content">
				<!-- 如果是访客则隐藏 -->
				<div class="row">
					<div class="text-left">
						<ol class="breadcrumb">
							<li><a href="${pageContext.request.contextPath}/home.htm">Home</a></li>
							<li class="active">博主信息</li>
						</ol>
					</div>
					<div class="text-right">
						<div class="btn-group" role="group">

							<c:if test="${not empty myuser.getUser_id()}">
								<%-- <button type="button" class="btn btn-default">
									<a
										href="${pageContext.request.contextPath}/user/alterUserPage.htm">修改基本信息</a>
								</button> --%>
								<button type="button" class="btn btn-default">
									<a
										href="${pageContext.request.contextPath}/user/alterUserPasswordPage.htm">修改密码</a>
								</button>
								
							</c:if>
						</div>
					</div>
				</div>
				<div class="row">
					<form id="form1" class="form-horizontal" action="${pageContext.request.contextPath}/user/alterPassword.htm"
					
					 method="post" role="form">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">旧密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="oldPassword" name="oldPassword"
								onblur="checkoldPassword(this);"  placeholder="请输入旧密码">
							</div>
							<div class="col-sm-2">
							<span id="oldPasswordmsg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="newPassword" name="newPassword"
									placeholder="请输入新密码">
							</div>
							<div class="col-sm-2">
							<span id="newPasswordmsg"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">确认新密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control"id="renewPassword" name="renewPassword"
							onblur="checkrenewPassword(this);"	placeholder="请确认新密码">
							</div>
							<div class="col-sm-2">
							<span id="renewPasswordmsg"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">修改</button>
							</div>
						</div>
					</form>
				</div>



			</div>

		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
