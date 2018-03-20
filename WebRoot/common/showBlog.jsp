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

var blog_id=${blog.getBlog_id()};
 blogcom_parentid=0;

window.onload=function myfun()
{
    //alert(blogcom_parentid);
}
function myrep(id) {
	//id.innerHTML="a";
	//alert(id);
	//$('#comment_content').attr("value",'test');
	blogcom_parentid=id;
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

function addBlog_Comment(){
	var blogcom_content=document.getElementById("blogcom_content").value;
	//alert(blogcom_parentid);
	url="${base}/blog/addComment.htm?user_id=${user.getUser_id()}&blog_id=${blog.getBlog_id()}&blogcom_parentid="+blogcom_parentid+"&blogcom_content="+blogcom_content;
	url=encodeURI(encodeURI(url));
	window.location=url;
}
</script>

<h2 class="text-center">
	<strong>${blog.getBlog_title()}</strong>
</h2>

<p class="text-right">时间:${blog.getBlog_time()}点击量：${blog.getBlog_readtimes()}</p>
<br>
<hr>

<span style="margin-left: 30px;"> <span
	class="glyphicon glyphicon-th-list" aria-hidden="true"></span>分类:
</span>

<font color="red">${blog.getBlog_type_name()}</font>
<hr>
${blog.getBlog_content()}


<hr>
<div class="row" style="background:black;" >
 <h4><strong><font color="white">发表评论</font></strong></h4>
 </div>
<div class="row">
 <hr>
${data}
  <hr>
</div>
<div class="row" style="margin-left: 30px;">
	<h5>评论内容:</h5>
		<textarea rows="10" style="width:80%; height:200px;"
			class="comment_content" id="blogcom_content" name="blogcom_content"></textarea>
		
		<div class="span7 text-center" style="padding: 20px;">
			<c:if test="${empty myuser.getUser_id()}">
				<input type="submit" class="btn btn-primary btn-lg" id="commit"
					disabled="disabled" style="margin: 30px;" value="提交" />
			</c:if>
			<c:if test="${not empty myuser.getUser_id()}">
				<input type="submit" class="btn btn-primary btn-lg" id="commit"
					style="margin: 30px;" value="提交" onclick="addBlog_Comment()"/>
			</c:if>
		</div>
		<h4 class="text-center">* 以上用户言论只代表其个人观点，不代表博主的观点或立场</h4>

</div>