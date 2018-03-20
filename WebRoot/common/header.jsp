<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/common/head.jsp"></jsp:include>

    <nav class="navbar navbar-inverse"style="min-width:1024px">
  <div class="container-fluid" style="width:1024px">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
      aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home.htm">个人多功能博客系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

<!-- 	<form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form> -->

      <ul class="nav navbar-nav navbar-right">
      <!--如果 用户已登陆 或者用户名不为空 -->
      <c:if test="${not empty myuser.getUser_id()}">  
        <li><a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${myuser.getUser_id()}">${myuser.getUser_name()}的博客</a></li>
        <li><a href="${pageContext.request.contextPath}/user/quitLogin.htm">退出登录</a></li>
      </c:if>
        <!-- 如果未登录 -->
        <c:if test="${empty myuser.getUser_id()}">  
        <li><a href="${pageContext.request.contextPath}/user/login.htm">登录</a></li>
		</c:if>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>