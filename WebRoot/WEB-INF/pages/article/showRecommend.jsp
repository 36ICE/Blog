<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<jsp:include page="/common/header.jsp"></jsp:include>
<jsp:include page="/common/tab.jsp"></jsp:include>
<div class="container-fluid" style="width:1024px">
	<div class="row">
		<jsp:include page="/common/nav.jsp"></jsp:include>
		<div class="col-sm-8" style="border:1px solid #555;margin-left: 20px;">
			<div id="myTabContent" class="tab-content">
				<!-- 如果是访客则隐藏 -->
				<div class="row">
					<div class="text-left">
						<ol class="breadcrumb">
							<li><a href="${pageContext.request.contextPath}/home.htm">Home</a></li>
							<li class="active">博主推荐</li>
						</ol>
					</div>
					<div class="text-right">
						<div class="btn-group" role="group">
							<c:if test="${not empty myuser.getUser_id()}">
								<button type="button" class="btn btn-default">
									<a
										href="${pageContext.request.contextPath}/blog/manageBlogPage.htm">管理博客</a>
								</button>
								<button type="button" class="btn btn-default">
									<a
										href="${pageContext.request.contextPath}/blog/editBlogPage.htm?blog_id=0">写新博客</a>
								</button>
							</c:if>
						</div>
					</div>
					<!-- 访客无权限 -->
				</div>
				<jsp:include page="/common/showRecommend.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>