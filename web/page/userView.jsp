<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>
		</div>
			<div class="content">
				<table class="box">
					<tbody>
					<tr>
						<td class="field">用户编号：</td>
						<td>${user.id}<input type="hidden" id="userId" value="${user.id}"></td>

					</tr>
					<tr>
						<td class="field">用户名：</td>
						<td><c:out value="${user.name}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户账号：</td>
						<td><c:out value="${user.loginName}"></c:out></td>
					</tr>

					<tr>
						<td class="field">用户性别：</td>
						<td>
							<c:if test="${user.gender=='1'}">
								男
							</c:if>
							<c:if test="${user.gender=='2'}">
								女
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td><c:out value="${user.birthDate}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><c:out value="${user.phone}"></c:out></td>

					</tr>
					<tr>
						<td class="field">用户地址：</td>
						<td><c:out value="${user.address}"></c:out></td>
					</tr>
					<tr>
						<td class="field">用户权限：</td>
						<td>
							<c:if test="${user.userType=='1'}">管理员</c:if>
							<c:if test="${user.userType=='2'}">普通用户</c:if>
						</td>
						<%--<td><c:out value="${user.userType}"></c:out></td>--%>
					</tr>

				</tbody>
				</table>
			</div>
			<div class="buttons">
		<a href="${pageContext.servletContext.contextPath}/selectUserByid.action?id=${user.id}"><input type="button" id="update" value="修改" class="input-button"></a>
				<a href="${pageContext.servletContext.contextPath}/deleteUser.action?id=${user.id}"><input type="button" id="del" value="删除" class="input-button"></a>
				<input type="button" id="repassword" value="重置密码" class="input-button"> 
				<input type="button" id="backButton" onclick="history.back(-1)" value="返回" class="input-button">
			</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/user/view.js"></script>

</body>
</html>