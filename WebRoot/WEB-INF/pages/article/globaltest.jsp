<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	span{cursor:pointer;text-decoration:underline;}
	div{margin-top:10px;}
</style>
<script>
//设置cookie   
 function setCookie(NameOfCookie, value,expiredays)  
  {
  	var exdate=new Date()
  	exdate.setDate(exdate.getDate()+expiredays)
  	document.cookie=NameOfCookie+ "=" +escape(value)+((expiredays==null) ? "" : "; expires="+exdate.toGMTString())
  	window.location.reload();
  }
</script>
</head>
<body>
    <a href="test.htm?langType=zh">中文</a> | <a href="test.htm?langType=en">英文</a><br/>
	<br/>
	<div style="border:1px solid #ccc">
		<p>通过js改变cookie实现切换</p>
		<span onclick="setCookie('lang','zh',10000);">中文 </span> | <span onclick="setCookie('lang','en',10000);">英文</span>
 	</div>
 	<div style="border:1px solid #ccc">
		    下面展示的是后台获取的国际化信息：<br/>
		  ${title}<br/>
		  ${content}<br/>
    </div>
	<div style="border:1px solid #ccc">
	    下面展示的是视图中直接绑定的国际化信息：<br/>
	    <spring:message code="title"/><br/>
	    <spring:eval expression="contentModel.title"></spring:eval><br/>
	    <spring:message code="content"/><br/>
	    <spring:eval expression="contentModel.content"></spring:eval><br/>
	 </div>
    
</body>
</html>