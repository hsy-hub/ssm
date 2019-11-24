<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书管理系统-用户管理</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="menu">

		<table>
			<tbody>
				<tr>
					<td>	<input name="method" value="query" class="input-text" type="hidden"/>
						用户名：<input name="name" class="input-text" type="text" value="<c:out value="${searchName}"></c:out>"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input value="查 询" type="submit" name="search"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="main">

		<div class="optitle clearfix">
			<em><input value="添加用户" class="input-button" onclick="window.location='<%=request.getContextPath()%>/page/userAdd.jsp'" type="button">
			</em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<thead>
				<tr>
					<td width="70" height="29"><div class="STYLE1" align="center">编号</div>
					</td>
					<td width="80"><div class="STYLE1" align="center">用户名</div>
					</td>
					<td width="80"><div class="STYLE1" align="center">用户账号</div>
					</td>
					<td width="100"><div class="STYLE1" align="center">性别</div>
					</td>
					<td width="100"><div class="STYLE1" align="center">生日</div>
					</td>
					<td width="150"><div class="STYLE1" align="center">电话</div>
					</td>
					<td width="150"><div class="STYLE1" align="center">权限</div>
					</td>
					<td width="150"><div class="STYLE1" align="center">头像</div>
					</td>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="user" items="${pageinfo.list}">
					<tr>
						<td><c:out value="${user.id}"></c:out></td>
						<td><c:out value="${user.name}"></c:out></td>
			<td><a href="${pageContext.servletContext.contextPath}/selectUserViewByid.action?id=${user.id}">
						<c:out value="${user.loginName}"></c:out></a></td>
						<td>
							<c:if test="${user.gender=='1'}">
								男
							</c:if>
							<c:if test="${user.gender=='2'}">
								女
							</c:if>
						</td>
						<%--<td><c:out value="${user.gender}"></c:out></td>--%>
						<td><c:out value="${user.birthDate}"></c:out></td>
						<td><c:out value="${user.phone}"></c:out></td>
					<td>
						<c:if test="${user.userType=='1'}">管理员</c:if>
						<c:if test="${user.userType=='2'}">普通用户</c:if>
					</td>
					<td>
						<img src="/pic/${user.headpath}" width="30" height="30"/>
					</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div align="center">
				当前页是第<span>${pageinfo.pageNum}</span>页&nbsp;一共<span>${pageinfo.pages}</span>页
				<c:if test="${pageinfo.isFirstPage==false}">
					<a href="<%=request.getContextPath()%>/userList.action?page=${pageinfo.prePage}">上一页</a>
				</c:if>
				<c:if test="${pageinfo.isFirstPage==true}">上一页</c:if>

				<c:if test="${pageinfo.isLastPage==false}">
					<a href="<%=request.getContextPath()%>/userList.action?page=${pageinfo.nextPage}">下一页</a>
				</c:if>
				<c:if test="${pageinfo.isLastPage==true}">下一页</c:if>
			</div>
		</div>
	</div>
<script>

    $(function () {
        $("input[name=search]").on("click", function () {
            var name = $("input[name=name]").val();
            location.href = "<%=request.getContextPath()%>/userList.action?name=" + name;
        })
    })
</script>

<%--<script type="text/javascript">--%>
	<%--$(function () {--%>
		<%--var a = $("a");--%>
		<%--a.on("click",function () {--%>
			<%--for (var i=0;i<a.length;i++){--%>
				<%--var id = $(this)[i].parentNode.parentNode.children[0].innerHTML;--%>
				<%--console.log(id);--%>
				<%--location.href = "<%=request.getContextPath()%>/selectUserByid.action?id="+id;--%>
			<%--}--%>
		<%--})--%>
	<%--})--%>
<%--</script>--%>
</body>
</html>