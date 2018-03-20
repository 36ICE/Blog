<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="pageContent">
<form method="post" name="form1" action="<c:url value='/article/save.htm' />"  onsubmit="return check();">
	<div id="mainDiv">
		<p>
			<spring:message code="title" />：<input type="text" name="title" value="" />
		</p>
		<p>
			<spring:message code="content" />：<input type="text" name="content" value=""/>
		</p>
		
		<p>
			<input type="submit" name="subBtn" value="递交" />
		</p>
	</div>
</form>
<script>
	function check(){
		if(document.form1.title.value.length<6){
			alert("标题至少为6个字符");
			return false;
		}
		return true;
	}

</script>
</div>