<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 使用Spring标签 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
<script type='text/javascript'  src='${base}/js/jquery-1.10.2.min.js'></script>
<script type="text/javascript">
	var PATH = "${pageContext.request.contextPath}";
	$(function() {  
	    $('#form1').submit(function() {  
	        if ($('#file1').val() == '') {  
	            alert('请选择上传导入文件!');  
	            $('#file1').focus();  
	            return false;  
	        }else{  
	            if(!isvalidatefile($('#file1').val()))  
	                  return false;  
	                  
	        }  
	    }); 
	    function isvalidatefile(obj) {  
		    var extend = obj.substring(obj.lastIndexOf(".") + 1);  
		    //alert(extend);  
		    if (extend == "") { 
		    	return false; 
		    } else {  
		        if (!(extend == "xls" ) && !(extend == "xlsx" )) {  
		            alert("请上传后缀名为xls(Excel2003)或xlsx(Excel2007)的文件!");  
		            return false;  
		        }  
		    }  
		    return true;  
		}   
	});  
</script>
</head>
<body>
<div class="pageContent">
<!-- 如果是要上传 文件，那么FORM的enctype一定要为：enctype="multipart/form-data" -->
<form method="post" name="form1"  id="form1" enctype="multipart/form-data" action="<c:url value='/article/save2.htm' />" >
	<div id="mainDiv">
		<p>
			<spring:message code="title" />：<input type="text" name="title" value="" />
		</p>
		<p>
			<spring:message code="content" />：<input type="text" name="content" value=""/>
		</p>
		<p>
			文件1：<input type="file" name="myFile" id="file1" />
			文件2：<input type="file" name="myFile"/>
		</p>
		<p>
			<input type="submit" id="subBtn" name="subBtn" value="递交" />
		</p>
		<p>
			<input type="button" name="subBtn2" onclick="jsonTest();" value="ajax测试" />
		</p>
		<!--<p>
			<input type="button" name="subBtn2" onclick="fSubmit();" value="ajax递交" />
		</p>
		--><p ${not empty errors ?"style='color : red;'":""}>${errors}</p>  
	</div>
</form>
<script>
	//json测试
	function jsonTest(){
		var data1={title:"test",content:"张三"};  
		$.ajax({
	        type: "post",
	        dataType: "json",
	        contentType : 'application/json;charset=UTF-8',
	       	url: PATH + "/article/ajax.htm",
	        data: JSON.stringify(data1), 
	       	success: function(data) {
	       		alert(data.article.title);
	        },
	        error: function(err) {
	        	//$("#progress_percent").text("Error");
	        }
    	});
		
	}
   function fSubmit(){
   		document.form1.action="${pageContext.request.contextPath}/article/ajaxUpload.htm";
   		document.form1.submit();
   }
	function getProgress() {
		var now = new Date();
	    $.ajax({
	        type: "post",
	        dataType: "json",
	       // url: PATH + "/fileStatus/upfile/progress",
	        data: now.getTime(),
	        success: function(data) {
	        },
	        error: function(err) {
	        	//$("#progress_percent").text("Error");
	        }
    	});
    }
</script>
</div>
</body>
</html>