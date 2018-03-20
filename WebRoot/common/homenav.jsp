<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
.list-group{
margin-top:3px;
}
</style>
<div class="col-sm-3" style="border:1px solid #555;padding:0px;padding-top: 5px;">
	<div class="list-group">
		  <a href="#" class="list-group-item active" style="background-color: red;">
		  <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
		  	全部分类
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true"style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-phone" aria-hidden="true" ></span>
		  	移动开发
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-blackboard" aria-hidden="true"></span>
		  	Web前端
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-th" aria-hidden="true"></span>
		  	架构设计
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-registration-mark" aria-hidden="true"></span>
		  	编程语言
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
		  	 互联网
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>
		  	数据库
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
		  	系统运维
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>
		  	云计算
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
		  	研发管理
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
		  <a href="#" class="list-group-item">
		  <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
		  综合管理
		  <span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="float: right;"></span>
		  </a>
	</div>
	
	<div class="list-group">
		  <a href="#" class="list-group-item active" style="background-color: gray;">推荐专家</a>
		  
			<div class="row text-center" >
				<div class="col-sm-6">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/img/1/3_cp790621656.jpg">
						<div class="caption">
							
							<p>牛华腾</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/img/1/3_mao0514.jpg" >
						<div class="caption">
							
							<p>满春</p>
						</div>
					</div>
				</div>
			</div>
		
		  <div class="row text-center" >
				<div class="col-sm-6">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/img/1/3_mchdba.jpg">
						<div class="caption">
							
							<p>陈鹏</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/img/1/1.jpg">
						<div class="caption">
							
							<p>毛伟</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-center" >
				<div class="col-sm-6">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/img/1/3_qq_26787115.jpg">
						<div class="caption">
							
							<p>刘桂林</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/img/1/3_qq_30739519.jpg" >
						<div class="caption">
							
							<p>翼正</p>
						</div>
					</div>
				</div>
			</div>
			
	</div>
	<div class="list-group">
		  <a href="#" class="list-group-item active" style="background-color: gray;">博客专家</a>
		<h5 style="margin: 20px;">
			<strong>移动开发</strong>
		</h5>
		<div class="row text-center"style="margin: 10px;">
			<div class="col-sm-6">
				<a>李海东</a>
			</div>
			<div class="col-sm-6">
				<a>陈吉</a>
			</div>
		</div>
		
		<div class="row text-center"style="margin: 10px;">
			<div class="col-sm-6">
				<a>李斌</a>
			</div>
			<div class="col-sm-6">
				<a>张鑫</a>
			</div>
		</div>
		
		<div class="row text-center" style="margin: 10px;">
			<div class="col-sm-6">
				<a>黄风大</a>
			</div>
			<div class="col-sm-6">
				<a>王宏伟</a>
			</div>
		</div>
		<hr>

		<h5 style="margin: 20px;">
			<strong>Web前端</strong>
		</h5>
		<div class="row text-center"style="margin: 10px;">
			<div class="col-sm-6">
				<a>李桂林</a>
			</div>
			<div class="col-sm-6">
				<a>王元迪</a>
			</div>
		</div>
		
		<div class="row text-center"style="margin: 10px;">
			<div class="col-sm-6">
				<a>李立总</a>
			</div>
			<div class="col-sm-6">
				<a>张俊琳</a>
			</div>
		</div>
		
		<div class="row text-center"style="margin: 10px;">
			<div class="col-sm-6">
				<a>陈区</a>
			</div>
			<div class="col-sm-6">
				<a>李常在</a>
			</div>
		</div>
		<hr>
		
		


	</div>
	
	</div>