<%@ page contentType="text/html;charset=UTF-8" import="java.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<script>
function changeRecommend(blog_id,obj){
		//out=$.ajax({url:"${pageContext.request.contextPath}/blog/changeRecommend.htm?blog_id="+blog_id});
		/* $.post("${base}/blog/changeRecommend.htm?blog_id=${blog.getBlog_id()}",function(out) {
			obj.innerHTML=out;
		}); */
	

		//obj.innerHTML=="设为推荐";
	    /*  $.ajax({
	           type: "POST",
	           dataType: "json",
	           url: "${base}/blog/changeRecommend.htm?blog_id="+blog_id,   
	           success: function(out){
	               alert(out);
	               obj.innerHTML=out;
	           },
	           error: function () {//XMLHttpRequest, textStatus, errorThrown
	               alert("请求失败"); 
	           } 
	    }); */
	    
		//alert("成功");
}
</script>


<table class="table table-striped">
   <caption>博客管理</caption>
   <thead>
      <tr>
         <th>标题</th>
         <th>阅读</th>
         <th>时间</th>
         <th>分类</th>
         <th>操作</th>
      </tr>
   </thead>
   <tbody>
  
<c:forEach items="${blogList}" var="blog">
      <tr>
         <td><h5><a href="${pageContext.request.contextPath}/blog/showBlog.htm?blog_id=${blog.getBlog_id()}&blog_userid=${blog.getUser_id()}">${blog.getBlog_title()}</a></h5></td>
         <td><h5>${blog.getBlog_readtimes()}</h5></td>
         <td><h5>${blog.getBlog_time()}</h5></td>
         <td><h5>${blog.getBlog_type_name() }</h5></td>
         <td><h5>
         <a href="${pageContext.request.contextPath}/blog/editBlogPage.htm?blog_id=${blog.getBlog_id()}">编辑</a>|     
         <a href="${pageContext.request.contextPath}/blog/deleteBlog.htm?blog_id=${blog.getBlog_id()}&pageNow=${page.getPageNow()}">删除</a>|
        
         <a href="${pageContext.request.contextPath}/blog/changeRecommend.htm?blog_id=${blog.getBlog_id()}&pageNow=${page.getPageNow()}"  >
         		<c:if test="${blog.getBlog_recommend()=='否'}">  
         		设为推荐
         	   </c:if>
         	    <c:if test="${blog.getBlog_recommend()=='是'}">  
         	         设为未推荐
         	     </c:if>
         </a> 
         </h5></td>
      </tr>
</c:forEach>
</tbody>
</table>
<!-- 分页功能 start -->
	<div align="center">
		<font size="2">共 ${page.getTotalPageCount()} 页</font> <font size="2">第
			${page.getPageNow()} 页</font> <a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=1">首页</a>
		<c:choose>
			<c:when test="${page.getPageNow() - 1 > 0}">
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=${page.getPageNow() - 1}">上一页</a>
			</c:when>
			<c:when test="${page.getPageNow() - 1 <= 0}">
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=1">上一页</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.getTotalPageCount()==0}">
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=${page.getPageNow()}">下一页</a>
			</c:when>
			<c:when test="${page.getPageNow() + 1 < page.getTotalPageCount()}">
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=${page.getPageNow() + 1}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.getTotalPageCount()}">
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=${page.getTotalPageCount()}">下一页</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.getTotalPageCount()==0}">
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=${page.getPageNow()}">尾页</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/blog/manageBlogPage.htm?pageNow=${page.getTotalPageCount()}">尾页</a>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 分页功能 End -->
	
	

	