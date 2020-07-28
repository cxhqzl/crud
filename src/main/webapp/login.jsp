<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<script type="text/javascript"
	src="${path }/static/js/jquery-3.5.1.min.js"></script>
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="width: 30%">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD登录</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" id="login_from">
					<div class="form-group form-group-lg">
						<label class="col-sm-3 control-label" for="userId">账&nbsp;&nbsp;&nbsp;&nbsp;号</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" name="userId"
								id="userId" placeholder="请输入账号">
						</div>
					</div>
					<div class="form-group form-group-lg">
						<label class="col-sm-3 control-label" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
						<div class="col-sm-9">
							<input class="form-control" type="password" name="password"
								id="password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group form-group-lg">
						<label class="col-sm-3 control-label" for="veri_code">验证码</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="veri_code"
								id="veri_code" placeholder="请输入验证码">
						</div>
						<div class="col-sm-3">
							<img alt="图片" src="${path}/get_code" width="100%" id="img_code">
						</div>
					</div>
					<div class="form-group form-group-lg">
						<div class="col-sm-4 col-sm-offset-8">
							<button type="button" class="btn btn-primary" style="width:100%" id="submit_login">登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#img_code").click(function() {
			this.src = "${path}/get_code?time=" + new Date().getTime();
		});
		$("#submit_login").click(function(){
			
			$.ajax({
				url:"${path}/login",
				type:"GET",
				data:$("#login_from").serialize(),
				success:function(res){
					if(res.code == 200){
						alert(res.msg);
					}else{
						 window.location = "${path}/toIndex";
					}
				}, 
				error:function(msg){
					
				}
			});
		});
	</script>
</body>
</html>