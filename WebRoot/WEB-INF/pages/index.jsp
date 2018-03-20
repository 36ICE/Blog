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
				<ul id="myTab" class="nav nav-tabs">
					<li  class="active"><a href="#home" data-toggle="tab">博客首页</a></li>
					<!-- 访问者下面点击将提示未登录 -->
					<li><a href="#article" data-toggle="tab">博主博客</a></li>
					<li><a href="#album" data-toggle="tab">博主相册</a>
					<li><a href="#message" data-toggle="tab">博主留言</a></li>
					<li><a href="#recommend" data-toggle="tab">博主推荐</a></li>
					<li><a href="#info" data-toggle="tab">博主信息</a></li>
					<!--  -->
				</ul>
			</div>
		</div>
	</div>
</nav>
<div class="container-fluid" style="width:1024px">
<div class="row">

<jsp:include page="/common/nav.jsp"></jsp:include>
	
	<div class="col-sm-8" style="border:1px solid #555;margin-left: 20px;">
	<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">


	</div>
	<div class="tab-pane fade" id="article">
	
	<!-- 如果是访客则隐藏 -->
	<div class="row">
	<div class="text-right">
	<div class="btn-group" role="group">
	<button type="button" class="btn btn-default">管理博客</button>
	<button type="button" class="btn btn-default">写新博客</button>
	<button type="button" class="btn btn-default">编辑博文</button>
	</div>
    </div>
	</div>
	<!--  -->
	
	<jsp:include page="/common/showBlog.jsp"></jsp:include>
	</div>
	<div class="tab-pane fade" id="album">
	
	</div>
	<div class="tab-pane fade" id="message">
	
	<jsp:include page="test.jsp"></jsp:include>
	</div>
	<div class="tab-pane fade" id="recommend">
	
	</div>
	<div class="tab-pane fade" id="info">
	
	<jsp:include page="user/showInfo.jsp"></jsp:include>
	</div>
	</div>
</div>
</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>