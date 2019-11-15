<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<form id="form1" name="form1" method="post" action="${pageContext.servletContext.contextPath}/userUpdate.action?id=${user.id}" enctype="multipart/form-data">
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户管理&gt;&gt;</div>

	</div>
		<input type="hidden" name="method" value="update">
		<div class="content">
			<font color="red"></font><table class="box">
			<tbody><tr>
					<td class="field">用户编号：</td>
					<td><input type="hidden" name="userId" value="${user.id}"> ${user.id}</td>
				</tr>
				<tr>
					<td class="field">用户名：</td>
					<td><input type="text" name="name" class="text" id="name" value="<c:out value="${user.name}"></c:out>"> <font color="red">*</font><font color="red" id="name_span"></font></td>
				</tr>
			<tr>
				<td class="field">用户账号：</td>
				<td><input type="text" name="loginName" class="text" id="loginName" value="<c:out value="${user.loginName}"></c:out>"> <font color="red">*</font><font color="red" id="loginName_span"></font></td>
			</tr>
				<tr>
					<td class="field">用户性别：</td>
					<%--<c:out value="${user.gender}"></c:out>打印出gender的值--%>
					<td>
						<select name="gender" id="gender">
						<option value="1" <c:if  test="${user.gender=='1'}">selected</c:if>>男</option>
						<option value="2"  <c:if  test="${user.gender=='2'}">selected</c:if>>女</option>
					    </select>
					</td>
				</tr>
				<tr>
					<td class="field">出生日期：</td>
					<td><input type="text" name="birthDate" class="text" id="birthDate" value="<c:out value="${user.birthDate}"></c:out>"> <font color="red">*</font><font color="red" id="birthDate_span"></font></td>
				</tr>
				<tr>
					<td class="field">用户电话：</td>
					<td><input type="text" name="phone" class="text" id="phone" value="<c:out value="${user.phone}"></c:out>"> <font color="red">*</font><font color="red" id="phone_span"></font></td>

				</tr>
				<tr>
					<td class="field">用户地址：</td>
					<td><input name="address" id="address" class="text" value="<c:out value="${user.address}"></c:out>"></td>
				</tr>
				<tr>
					<td class="field">用户权限：</td>
					<td><input type="radio" name="userType" value="1" <c:if  test="${user.userType=='1'}">checked</c:if>>管理员
						<input type="radio" name="userType" value="2" <c:if  test="${user.userType=='2'}">checked</c:if>>普通用户
					</td>
					<%--<td>--%>
						<%--<input type="radio" name="userType" value="1" <c:if test="${user.userType==1}">--%>
							<%--<c:out value="checked" default=""></c:out></c:if>>管理员--%>
						<%--<input type="radio" name="userType" value="2" <c:if test="${user.userType==2}">--%>
							<%--<c:out value="checked" default=""></c:out></c:if>>普通用户--%>
					<%--</td>--%>
				</tr>
			<tr>
				<td class="field">头像</td>
				<td>
					<img src="/pic/${user.headpath}" width="30" height="30"/>
					<input type="file" name="pictureFile" value="${user.headpath}" readonly/>
				</td>
			</tr>

			</tbody>
		</table>
		</div>
		<div class="buttons">
			<input type="submit" name="update" id="update" value="修改" class="input-button">
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button"> 
		</div>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/user/update.js"></script>

</form>
</body>
</html>