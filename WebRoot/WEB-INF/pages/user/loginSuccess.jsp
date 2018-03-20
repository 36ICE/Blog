<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/common/head.jsp"></jsp:include>

zcd
<c:forEach items="${map}" var="user">
${user.userName}

</c:forEach>


<script type="text/javascript">
//前台用jquery+ajax
$.ajax({
            type:'POST',
            url:'${contextPath}/address',
            dataType:'json',
            success:function(data){
                    $.each(data.list,function(i,item){
                        alert(i);
                        alert(item.userId);
                        alert(item.userName);
                    });
            }
        });
</script>
