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
				<div class="row">
				<div class="text-left">
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/home.htm">Home</a></li>
						<li class="active">博主相册</li>
					</ol>
				</div>
				<!-- 如果是访客则隐藏 -->
					
						<div class="text-right">
							<div class="btn-group" role="group">
							<c:if test="${not empty myuser.getUser_id()}">
								<button type="button" class="btn btn-default" onclick="disp_prompt()">
									添加相册
								</button>
							</c:if>		
							</div>
						</div>
						<!-- 访客无权限 -->

					</div>
					<jsp:include page="/common/showAlbumList.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script type="text/javascript">
function disp_prompt()
  {
  var album_name=prompt("请输入相册名","")
  if (album_name!=null && album_name!="")
    {
    document.write("Hello " + album_name + "!")
    url="${pageContext.request.contextPath}/album/createAlbum.htm?album_name="+album_name;
	url=encodeURI(encodeURI(url));
	window.location=url;
    }
  }
</script>