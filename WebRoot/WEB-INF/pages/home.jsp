<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/common/header.jsp"></jsp:include>

<script>
   $(function () {
      $('#myTab li:eq(0) a').tab('show');
   });
</script>

<nav class="navbar navbar-default" style="min-width:1024px;">
	<div class="container-fluid" style="width:1024px">
		<div class="row">
			<div class="col-lg-4 text-center"></div>
			<div class="col-lg-6 text-center">
				<ul  class="nav nav-tabs">
					<li  class="active"><a href="${pageContext.request.contextPath}/home.htm">首页</a></li>
					<!-- 访问者下面点击将提示未登录 -->
					<c:if test="${ empty myuser.getUser_id()}">  
					<li><a href="${base}/user/login.htm" >我的博客</a></li>
					</c:if>
					<c:if test="${ not empty myuser.getUser_id()}">  
					<li><a href="${base}/user/index.htm?blog_userid=${myuser.getUser_id()}" >我的博客</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>

<div class="container-fluid" style="width:1024px">
	<div class="row">
		<jsp:include page="/common/homenav.jsp"></jsp:include>
		<div class="col-sm-8" style="border:1px solid #555;margin-left: 20px;">
			
			<jsp:include page="/common/home.jsp"></jsp:include>
		
		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>