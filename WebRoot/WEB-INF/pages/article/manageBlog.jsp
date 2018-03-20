<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/common/header.jsp"></jsp:include>
<jsp:include page="/common/tab.jsp"></jsp:include>
<div class="container-fluid" style="width:1024px">
	<div class="row">
		<div class="col-sm-12" style="border:1px solid #555;">
			<div id="myTabContent" class="tab-content">
				<!-- 如果是访客则隐藏 -->
				<div class="row">
					<div class="text-left">
						<ol class="breadcrumb">
							<li><a href="${pageContext.request.contextPath}/home.htm">Home</a></li>
							<li><a href="${base}/user/index.htm?blog_userid=${myuser.getUser_id()}">博主博客</a></li>
							<li class="active">管理博客</li>
						</ol>
					</div>
					<div class="text-right">
						<div class="btn-group" role="group">

							<c:if test="${not empty myuser.getUser_id()}">
								<button type="button" class="btn btn-default">
									<a
										href="${pageContext.request.contextPath}/user/index.htm?blog_userid=${myuser.getUser_id()}">目录视图</a>
								</button>
								<button type="button" class="btn btn-default">
									<a
										href="${pageContext.request.contextPath}/blog/editBlogPage.htm?blog_id=0">写新博客</a>
								</button>
							</c:if>
						</div>
					</div>
				</div>

				<jsp:include page="/common/manageBlog.jsp"></jsp:include>
			</div>

		</div>
	</div>
					<div class="row">
					<div class="col-xs-12">
					
					
				   
				    <form method="post" name="form1" action="<c:url value='/blog/addBlog_Type.htm' />" >
				    <h4>添加博客分类</h4>
				     <input type="text" style="width: 80%" name="blog_type_name" value="${blog.getBlog_type_name()}"> 
				    
				 
				    <input type="submit" class="btn btn-primary" id="commit" style="margin: 30px;"  value="提交" />
				 
				   
				   </form>
				    </div>
				    <div class="col-xs-12">
				    <h4>博客分类</h4>
				    </div>
				    <div class="col-xs-12">
				    
				    <c:forEach items="${blog_TypeList}" var="blog_Type">
				    
				    <span class="col-xs-3">
				    <button type="button" class="btn btn-default">${blog_Type}</button>
				    </span>
				    
				    </c:forEach>
				    </div>
				</div>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>