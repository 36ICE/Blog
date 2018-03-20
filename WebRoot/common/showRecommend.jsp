<%@ page contentType="text/html;charset=UTF-8" import="java.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<h3 class="text-center"><strong>博主推荐文章</strong></h3>
<hr>
<!-- 博文摘要视图-->
<c:forEach items="${blogList}" var="blog">	
		<div id="${blog.getBlog_id()}">
		<div>		
			<h3>
				<strong>
				<a href="${pageContext.request.contextPath}/blog/showBlog.htm?blog_id=${blog.getBlog_id()}&blog_userid=${blog.getUser_id()}">${blog.getBlog_title()}</a>
				</strong>
			</h3>
			<!-- 截取字符串 -->
			<c:set var="string1" value="${blog.getBlog_content()}" />
			<c:set var="string2" value="${fn:substring(string1, 0, 300)}" />
			<p>${string2}</p>	
			</div>
			<div>
			<h4><span class="text-right"><p>${blog.getBlog_time()}</p> </span></h4>
			<hr>
			</div>
		
		</div>
</c:forEach>

<!-- 分页功能 start -->
	<div align="center">
		<font size="2">共 ${page.getTotalPageCount()} 页</font> <font size="2">第
			${page.getPageNow()} 页</font> <a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=1">首页</a>
		<c:choose>
			<c:when test="${page.getPageNow() - 1 > 0}">
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=${page.getPageNow() - 1}">上一页</a>
			</c:when>
			<c:when test="${page.getPageNow() - 1 <= 0}">
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=1">上一页</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.getTotalPageCount()==0}">
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=${page.getPageNow()}">下一页</a>
			</c:when>
			<c:when test="${page.getPageNow() + 1 < page.getTotalPageCount()}">
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=${page.getPageNow() + 1}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.getTotalPageCount()}">
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=${page.getTotalPageCount()}">下一页</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.getTotalPageCount()==0}">
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=${page.getPageNow()}">尾页</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${user.getUser_id()}&pageNow=${page.getTotalPageCount()}">尾页</a>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 分页功能 End -->