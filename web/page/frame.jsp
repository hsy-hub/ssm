<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<style>
* {padding:0px; margin:0px;height:100%; width:100%;}
.content  {padding-top:100px;box-sizing:border-box}
.top {height:100px; width:100%;position:absolute; top:0px;}
.left{ float:left;width:20%;}
.right{ float:left;width:80%;}
#top{height:100px;}
</style>
</head>
<body>
<div class="content">
	<form action="<%=request.getContextPath()%>/frame.action" method="post">
			<div class="top">
				<iframe src="<%=request.getContextPath()%>/page/top.jsp"  scrolling="No"  id="top" noresize="noresize">
				</iframe>
			</div>
				<div class="main">
					<div class="left">
						<iframe src="<%=request.getContextPath()%>/page/left.jsp" scrolling="No"  id="left" noresize="noresize">
					  </iframe>
						</div>
					<div class="right">
						<iframe src="<%=request.getContextPath()%>/page/main.jsp"  id="mainFrame" name="mainFrame" noresize="noresize" >
					  </iframe>
						</div>
				</div>
	</form>
</div>

</body>
</html>