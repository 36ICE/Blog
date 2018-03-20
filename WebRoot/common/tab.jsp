<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<nav class="navbar navbar-default" style="min-width:1024px;">
	<div class="container-fluid" style="width:1024px">
		<div class="row">
			<div class="col-lg-4 text-center"></div>
			<div class="col-lg-6 text-center">
				<ul id="myTab" class="nav nav-tabs">
					<!-- <li  class="active"><a href="#home" data-toggle="tab">博客首页</a></li> -->
					<!-- 访问者下面点击将提示未登录 -->
					<li><a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}">博主博客</a></li>
					<li><a href="${pageContext.request.contextPath}/album/showAlbumList.htm?user_id=${user.getUser_id()}" >博主相册</a>
					<li><a href="${pageContext.request.contextPath}/message/showMessage.htm?user_id=${user.getUser_id()}" >博主留言</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/showRecommend.htm?blog_userid=${user.getUser_id()}" >博主推荐</a></li>
					<li><a href="${pageContext.request.contextPath}/user/showInfo.htm?user_id=${user.getUser_id()}">博主信息</a></li>
					<!--  -->
				</ul>
			</div>
		</div>
	</div>
</nav>