<%@ page contentType="text/html;charset=UTF-8" import="java.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<div class="col-sm-3" style="border:1px solid #555;padding:0px;padding-top: 5px;">
	<div class="list-group">
		  <a href="#" class="list-group-item active">个人资料</a>
		  <a href="#" class="list-group-item">姓名：${user.getUser_name()}</a>
		  <a href="#" class="list-group-item">职业:${user.getUser_job()}</a>
		  <a href="#" class="list-group-item">邮箱:${user.getUser_mail()}</a>
		  <a href="#" class="list-group-item">性别:${user.getUser_sex()}</a>
		  <a href="#" class="list-group-item">访问：156</a>
		  <a href="#" class="list-group-item">积分：155</a>
	</div>
	<div class="list-group">
		  <a href="#" class="list-group-item active">阅读排行</a>
		  <c:forEach items="${rankBlogList}" var="blog">
		  	
		  	<!-- 截取字符串 -->
			<c:set var="title1" value="${blog.getBlog_title()}" />
			<c:set var="title2" value="${fn:substring(string1, 0, 20)}" />
				<a  class="list-group-item " href="${pageContext.request.contextPath}/blog/showBlog.htm?blog_id=${blog.getBlog_id()}&blog_userid=${blog.getUser_id()}">
				${blog.getBlog_title()}
				<span class="text-right">(${blog.getBlog_readtimes()})</span>
				</a>
		  </c:forEach>
	</div>
	<div class="list-group">
		  <a href="#" class="list-group-item active">分类</a>
		  
		   <c:forEach items="${strBlog_TypeList}" var="strBlog_Type">
		   	<a  class="list-group-item " href="#">
				${strBlog_Type}
				</a>
		   </c:forEach>
	</div>
	</div>