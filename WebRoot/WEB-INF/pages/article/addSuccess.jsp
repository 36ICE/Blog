<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="pageContent">
<form method="post" action="<c:url value='/article/save.htm' />" >
	<div id="mainDiv">
		
		<p>
			标题：${article.title}
		</p>
		<p>
			内容：${article.content}
			
		</p>
		<p>
			文件列表：
			 <c:forEach  items="${fileNameList}" var="item">
          		 <div style="border:1px dashed #ccc;padding:10px;"><c:out value="${item}"></c:out></div>
     		</c:forEach>
		</p>
		<p>
			错误信息：${errors}
		</p>
	</div>
</form>
</div>