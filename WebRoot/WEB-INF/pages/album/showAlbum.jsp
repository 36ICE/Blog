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
							<li><a
								href="${pageContext.request.contextPath}/album/showAlbumList.htm?user_id=${user.getUser_id()}">博主相册</a></li>
							<li class="active">${album.getAlbum_name()}</li>
						</ol>
					</div>
					<!-- 如果是访客则隐藏 -->

					<div class="text-right">
						<div class="btn-group" role="group">
							<c:if test="${not empty myuser.getUser_id()}">
								<!-- <button type="button" class="btn btn-default"
									onclick="disp_prompt()">上传照片</button> -->

								<button type="button" class="btn btn-default"onClick="upImage()">上传图片</button>
								
								<!-- <button type="button" onClick="upFiles()">调用上传文件模块</button> -->
							</c:if>
						</div>
					</div>
					<!-- 访客无权限 -->
				</div>
				<jsp:include page="/common/showAlbum.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>

<script type="text/plain" id="j_ueditorupload" style="height:5px;display:none;" ></script>
    <script>
      //实例化编辑器
      var o_ueditorupload = UE.getEditor('j_ueditorupload',
      {
        autoHeightEnabled:false
      });
      o_ueditorupload.ready(function ()
      {
	
	o_ueditorupload.hide();//隐藏编辑器
	
	//监听图片上传
	o_ueditorupload.addListener('beforeInsertImage', function (t,arg)
	{
		for(var temp in arg){
			//alert('这是图片地址：'+arg[temp].src);
			url="${pageContext.request.contextPath}/album/uploadPhoto.htm?photoPaths="+arg[temp].src+"&album_id=${album.getAlbum_id()}";
			url=encodeURI(encodeURI(url));
			window.location=url;
		}
		
		/* url="${pageContext.request.contextPath}/album/uploadPhoto.htm?photoPaths="+arg+"&album_id=${album.getAlbum_id()}";
		url=encodeURI(encodeURI(url));
		window.location=url; */
	});
	
	/* 文件上传监听
	 * 需要在ueditor.all.min.js文件中找到
	 * d.execCommand("insertHtml",l)
	 * 之后插入d.fireEvent('afterUpfile',b)
	 */
        o_ueditorupload.addListener('afterUpfile', function (t, arg)
        {
          alert('这是文件地址：'+arg[0].url);
        });
      });
      
      //弹出图片上传的对话框
      function upImage()
      {
        var myImage = o_ueditorupload.getDialog("insertimage");
        myImage.open();
      }
      //弹出文件上传的对话框
      function upFiles()
      {
        var myFiles = o_ueditorupload.getDialog("attachment");
        myFiles.open();
      } 
    </script>