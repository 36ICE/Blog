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
									<a href="${pageContext.request.contextPath}/user/alterUserPage.htm">修改基本信息</a>
								</button> --%>
								<button type="button" class="btn btn-default">
									<a href="${pageContext.request.contextPath}/user/alterUserPasswordPage.htm">修改密码</a>
								</button>
							</c:if>
						</div>
					</div>
				</div>
				<table class="table">
					<caption>
						<h2 class="text-center">个人基本信息</h2>
					</caption>
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><h4>姓名</h4></td>
							<td><h4>${user.getUser_name()}</h4></td>
							
						</tr>
						<tr>
							<td><h4>职业</h4></td>
							<td><h4>${user.getUser_job()}</h4></td>
							
						</tr>
						<tr>
							<td><h4>邮箱</h4></td>
							<td><h4>${user.getUser_mail()}</h4></td>
							
						</tr>
						<tr>
							<td><h4>性别</h4></td>
							<td><h4>${user.getUser_sex()}</h4></td>
							
						</tr>
						<tr>
							<td><h4>出生日期</h4></td>
							<td><h4>${user.getUser_birthday()}</h4></td>
							
						</tr>
					</tbody>
				</table>


			</div>

		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>