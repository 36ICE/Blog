<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
		<!--百度编辑器-->
        <!-- 配置文件 -->  
        <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>  
        <!-- 编辑器源码文件 -->  
        <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>  
        <!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->  
        <script type="text/javascript" src="../ueditor/lang/zh-cn/zh-cn.js"></script>  

<c:if test="${not empty blog}">  
<form method="post" name="form1" action="<c:url value='/blog/editBlog.htm?blog_id=${blog.getBlog_id()}' />" >

 		<h4 class="">
 		类别:<form:select path="blog.blog_type_name" style="width: 80%">  
 		<%-- <option/>${blog.getBlog_type_name() } --%>
 		<form:options items="${blog_typeMap}"  />
 		</form:select>
 		</h4> 
 		<br/>
		<h4 >
	   <span class="">标题:</span>
		<input type="text" style="width: 80%" name="blog_title"value="${blog.getBlog_title()}" />
		</h4>
		
		 <br/>
        <script id="container" name="blog_content" type="text/plain"  style="width:100%;height:820px;" >${blog.getBlog_content()}</script>  
        <script type="text/javascript">  
            var editor = UE.getEditor('container');        
        </script>  
	<div class="span7 text-center" style="padding: 30px;">
    <input type="submit" class="btn btn-primary btn-lg" id="commit" style="margin: 30px;"  value="提交" />
	</div>
	 </form>
</c:if>

<c:if test="${ empty blog}">   
<form method="post" name="form1" action="<c:url value='/blog/addBlog.htm?user_id=${myuser.getUser_id()}' />" >
 		<h4><%-- 类别:<input type="text" style="width: 80%" name="blog_type_name" value="${blog.getBlog_type_name()}"> --%>
 		类别:<form:select path="blog_type.blog_type_name" items="${blog_typeMap}" class=""  style="width: 80%"/>  
 		</h4> <br/>
		<h4>标题:<input type="text" style="width: 80%" name="blog_title"value="${blog.getBlog_title()}"/> </h4> <br/>
        <script id="container" name="blog_content" type="text/plain"  style="width:100%;height:820px;" >${blog.getBlog_content()}</script>  
        <script type="text/javascript">  
            var editor = UE.getEditor('container');       
        </script>  
	<div class="span7 text-center" style="padding: 30px;">
	<input type="submit" class="btn btn-primary btn-lg" id="commit" style="margin: 30px;"  value="提交" />
	</div>
	 </form>
</c:if>
<%-- <c:if test="${not empty blog}">  
<form method="post" name="form1" action="<c:url value='${pageContext.request.contextPath}/blog/editBlog?blog_id=${blog.getBlog_id()}' />" >
 

 		<h4>类别:<input type="text" style="width: 80%" name="blog_type_name" value="${blog.getBlog_type_name()}"></h4> <br/>
		<h4>标题:<input type="text" style="width: 80%" name="blog_title"value="${blog.getBlog_title()}"/> </h4> <br/>
        <script id="container" name="blog_content" type="text/plain"  style="width:100%;height:820px;" >${blog.getBlog_content()}</script>  
        <script type="text/javascript">  
            var editor = UE.getEditor('container'); 
            
        </script>  

	<div class="span7 text-center" style="padding: 30px;">
	<c:if test="${not empty blog}">  
	<a href="${pageContext.request.contextPath}/blog/editBlog?blog_id=${blog.getBlog_id()}"><input type="submit" class="btn btn-primary btn-lg" id="commit" style="margin: 30px;"  value="提交" /></a>
	</c:if>
	<c:if test="${ empty blog}">  
	<a href="${pageContext.request.contextPath}/blog/addBlog?user_id=${myuser.getUser_id()}"><input type="submit" class="btn btn-primary btn-lg" id="commit" style="margin: 30px;"  value="提交" /></a>
	</c:if>
	
	</div>
	 </form>
</c:if> --%>
		