<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link media="all" href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<jsp:include page="/common/header.jsp"></jsp:include>
<jsp:include page="/common/tab.jsp"></jsp:include>

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
					<form class="form-horizontal" action="${pageContext.request.contextPath}/user/alterUserInfo.htm" method="post">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" name="user_birthday">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="user_mail"
									placeholder="请输入邮箱">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">职业</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="user_job"
									placeholder="请输入职业">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">秀别</label>
							<div class="col-sm-10">
								<input type="radio" name="user_sex" value="男" checked="checked" />男
                              <input type="radio" name="user_sex" value="女"  />女
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" class="btn btn-default"  value="修改">
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script>
 function alterUser() {  
        var form = document.forms[0];  
        form.action = "${pageContext.request.contextPath}/user/alterUserInfo.htm";  
        form.method = "post";  
        form.submit();  
    }  

</script>
