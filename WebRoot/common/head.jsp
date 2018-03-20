<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
<link media="all" href="${pageContext.request.contextPath}/css/common.css" type="text/css" rel="stylesheet"/>
<link media="all" href="${pageContext.request.contextPath}/css/style1.css" type="text/css" rel="stylesheet">
<link media="all" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
<link media="all" href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />



<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/javascript/public.js" type="text/javascript"></script>
		<!--百度编辑器-->
        <!-- 配置文件 -->  
        <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>  
        <!-- 编辑器源码文件 -->  
        <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>  
        <!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->  
        <script type="text/javascript" src="../ueditor/lang/zh-cn/zh-cn.js"></script>  
<script type="text/javascript">
var PATH = "${pageContext.request.contextPath}";
</script>