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

	<c:forEach items="${photoList}" var="photo">
		<div class="col-sm-4">
			<div class="panel panel-info" id="${photo.getPhoto_id()}">
				<div class="panel-heading ">
					<h3 class="panel-title  text-right">
						<c:if test="${not empty myuser.getUser_id()}">
							<a
								href="javascript:if(confirm('确实要删除该内容吗?'))location='${pageContext.request.contextPath}/album/deletePhoto.htm?album_id=${album.getAlbum_id()}&user_id=${myuser.getUser_id()}&photo_id=${photo.getPhoto_id()}'">
								<button type="button" class="btn btn-default text-right">
									<span class="glyphicon glyphicon-trash text-right"
										aria-hidden="true"></span>
								</button>
							</a>
						</c:if>
					</h3>
				</div>
				<div class="panel-body text-center">

					<a href="${photo.getPhoto_path()}" class="thumbnail" onMouseOver="ShowDiv('${photo.getPhoto_path()}')" onMouseOut="HideDiv()">
					<div id="divPic"></div>
					<img src="${photo.getPhoto_path()}" style="z-index: 1" />
					</a>
				</div>
				
					
				
			</div>
		</div>
	</c:forEach>
	<c:if test="${ empty photoList}">
	<div class="col-sm-4">
				<h3>空空如也</h3>
		</div>
	</c:if>
</div>

<script>
divPic=document.getElementById('divPic');
function ShowDiv(pic)
{
 divPic.innerHTML="<img src="+pic+" style='z-index: 99;position:absolute;width:300px;height:300px;'>";
 divPic.style.display="block";

 //还可以让div跟着图片所在的当前窗体位置居中，代码略。
}
function HideDiv()
{
 divPic.style.display="none";
}

</script>