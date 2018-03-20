<%@ page contentType="text/html;charset=UTF-8" import="java.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>

<script>
//var blog_id=${blog.getBlog_id()};
messagecom_parentid=0;
function myrep(id) {
	//id.innerHTML="a";
	//alert(id);
	//$('#comment_content').attr("value",'test');
	messagecom_parentid=id;
	//$('#blogcom_parentid').val(blogcom_parentid);
	//$('#comment_msg').innerHTML='回复博客号:'+${blog.getBlog_id()}+'评论号:'+id;
	//blog_id=${blog.getBlog_id()};
	
	//alert("blog_id"+blog_id);
	//$("html,body").animate({scrollTop:$('#'+id).offset().top},100);//1000是ms,也可以用slow代替
	//$(document).height() - $(window).height()
	$("html,body").animate({scrollTop:$(document).height() - $(window).height()},1000);
	//$("#comment_msg").text(id);
	//$("#myhref").attr("href",'${base}/blog/addComment.htm?user_id=${user.getUser_id()}&blog_id=${blog.getBlog_id()}&blogcom_parentid=1');
}

function addMessage_Comment(){
	var messagecom_content=document.getElementById("messagecom_content").value;
	//alert(blogcom_parentid);
	url="${base}/message/createMessage.htm?message_userid=${user.getUser_id()}&messagecom_parentid="+messagecom_parentid+"&messagecom_content="+messagecom_content;
	url=encodeURI(encodeURI(url));
	//alert(url);
	window.location=url;
}
</script>
<div class="row" style="background:black;" >
 <h4><strong><font color="white">发表留言</font></strong></h4>
 </div>
<div class="row">
 <hr>
${data}
  <hr>
</div>
<div class="row" style="margin-left: 30px;">
	<h5>评论内容:</h5>
		<textarea rows="10" style="width:80%; height:200px;"
			class="messagecom_content" id="messagecom_content" name="messagecom_content"></textarea>
		<div class="span7 text-center" style="padding: 20px;">
			<c:if test="${empty myuser.getUser_id()}">
				<input type="submit" class="btn btn-primary btn-lg" id="commit"
					disabled="disabled" style="margin: 30px;" value="提交" />
			</c:if>
			<c:if test="${not empty myuser.getUser_id()}">
				<input type="submit" class="btn btn-primary btn-lg" id="commit"
					style="margin: 30px;" value="提交" onclick="addMessage_Comment()"/>
			</c:if>
		</div>
		<h4 class="text-center">* 以上用户言论只代表其个人观点，不代表博主的观点或立场</h4>
</div>
