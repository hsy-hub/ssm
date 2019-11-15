<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>图书管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function logout() {
		top.location = "login.jsp";
	}
</script>
</head>
<body class="frame-bd">
<input type="hidden" name="userType" value="${userType}">
	<ul class="left-menu">
		<div name="button">
		<li><a href="${pageContext.servletContext.contextPath}/billList.action" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_bill.gif" />
		<%--<li><a href="billList.jsp" target="mainFrame"><img--%>
				<%--src="images/btn_bill.gif" />--%>
		</a>
		</li>
		</div>
		<li><a href="${pageContext.servletContext.contextPath}/bill2.action" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_jieyue.gif" />
		</a>
		</li>
		<div name="button">
		<li><a href="${pageContext.servletContext.contextPath}/userList.action" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_users.gif" />
		<%--<li><a href="userList.jsp" target="mainFrame"><img--%>
				<%--src="images/btn_users.gif" />--%>
		</a>
		</li>
		</div>
		<li><a href="${pageContext.servletContext.contextPath}/updatePwd.action" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_password.gif" />
		</a>
		</li>
		<%--<li><a href="updatePwd.jsp" target="mainFrame"><img--%>
				<%--src="images/btn_password.gif" />--%>
		<%--</a>--%>
		<%--</li>--%>
		<li><a href="${pageContext.servletContext.contextPath}/login.action" onClick="logout();">
			<img src="<%=request.getContextPath()%>/images/btn_exit.gif" />
		</a>
		</li>
	</ul>
<script>
	$(function () {
			console.log($("input[name=userType]").val())
			if ($("input[name=userType]").val()=="2"){
				$("div[name=button]").prop("style","display: none")
			}
	})
</script>
</body>
</html>
