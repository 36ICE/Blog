<%@ page contentType="text/html;charset=UTF-8" import="java.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<hr>
<!-- 博文摘要视图-->
<div class="row">

	<c:forEach items="${albumList}" var="album">
		<div class="col-sm-4">
			<div class="panel panel-info" id="${album.getAlbum_id()}">
				<div class="panel-heading">
					<h3 class="panel-title">
					<a href="${pageContext.request.contextPath}/album/showAlbum.htm?album_id=${album.getAlbum_id()}&user_id=${user.getUser_id()}">${album.getAlbum_name()}</a>
						<c:if test="${not empty myuser.getUser_id()}">
							<a
								href="javascript:if(confirm('确实要删除该内容吗?'))location='${pageContext.request.contextPath}/album/deleteAlbum.htm?album_id=${album.getAlbum_id()}&user_id=${myuser.getUser_id()}'">
								<button type="button" class="btn btn-default text-right">
									<span class="glyphicon glyphicon-trash text-right"
										aria-hidden="true"></span>
								</button>
							</a>
						</c:if>
					</h3>
				</div>
				<div class="panel-body text-center">
				<a  href="${pageContext.request.contextPath}/album/showAlbum.htm?album_id=${album.getAlbum_id()}&user_id=${user.getUser_id()}" class="thumbnail">
					<img src="${album.getAlbum_pic()}" />
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${ empty albumList}">
	<div class="col-sm-4">
			
				<h3>空空如也</h3>
			
		</div>
	</c:if>
	<%-- <c:if test="${not empty myuser.getUser_id()}">
		<div class="col-sm-4">
			<div class="panel panel-info"">
				<div class="panel-heading">
					<h3 class="panel-title">增加相册</h3>
				</div>
				<div class="panel-body text-center">
				<button type="button" value="点我"  onclick="disp_prompt()" >
					<span class="glyphicon glyphicon-plus" aria-hidden="true"
						style="font-size: 155px;color:green;">
					
						</span>
				</button>
				</div>
			</div>
		</div>
	</c:if> --%>
</div>

