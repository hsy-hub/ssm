<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">图书管理&gt;&gt;</div>
	</div>
		<div class="content">
			<table class="box">
			  <tbody>
			  <tr>
					<td class="field">图书编号：</td>
					<td>${product.id}<input type="hidden" id="billId" value="${product.id}"></td>
			  </tr>
			   <tr>
					<td class="field">书籍名称：</td>
					<td><c:out value="${product.productName}"></c:out></td>
			   </tr>
			   <tr>
					<td class="field">作者：</td>
					<td><c:out value="${product.productUnit}"></c:out></td>
				</tr>
				<tr>
					<td class="field">书籍数量：</td>
					<td><c:out value="${product.productCount}"></c:out></td>
				</tr>
				<tr>
					<td class="field">价格：</td>
					<td><c:out value="${product.billMoney}"></c:out></td>
				</tr>
			   <tr>
					<td class="field">出版社：</td>
				   <td><c:if test="${product.proId=='0'}">中华出版社</c:if>
					   <c:if test="${product.proId=='1'}">清华出版社</c:if>
					   <c:if test="${product.proId=='2'}">成光出版社</c:if></td>
					<%--<td><c:out value="${product.proId}"></c:out></td>--%>
				</tr>
				 <tr>
					<td class="field">是否借出：</td>
					 <td>
						 <c:if test="${product.payed=='1'}">是</c:if>
						 <c:if test="${product.payed=='0'}">否</c:if>
					 </td>
					<%--<td><c:out value="${product.payed}"></c:out></td>--%>
				</tr>
			</tbody>
			</table>
		</div>
		<div class="buttons">
			<a href="${pageContext.servletContext.contextPath}/selectProductByid.action?id=${product.id}">
				<input type="button" name="update" id="update" value="修改" class="input-button"></a>
			<a href="${pageContext.servletContext.contextPath}/deleteProduct.action?id=${product.id}">
				<input type="button" name="del" id="del" value="删除" class="input-button"></a>
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button"> 
		</div>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bill/view.js"></script>


</body></html>