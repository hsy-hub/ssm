<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">图书管理&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/RegisterProduct.action">
		<input type="hidden" name="method" value="add">
		<div class="content">
			<table class="box">
			   <tbody><tr>
					<td class="field">书籍名称：</td>
					<td><input type="text" name="productName" class="text" id="productName" value=""> <font color="red">*</font><font color="red" id="productName_span"></font></td>
				</tr>
				 <tr>
					<td class="field">作者：</td>
					<td><input type="text" name="productUnit" class="text" id="productUnit" value=""> <font color="red">*</font><font color="red" id="productUnit_span"></font></td>
				</tr>
				<tr>
					<td class="field">商品数量：</td>
					<td><input type="text" name="productCount" class="text" id="productCount" value=""> <font color="red">*</font><font color="red" id="productCount_span"></font></td>
				</tr>
				<tr>
					<td class="field">价格：</td>
					<td><input name="billMoney" id="billMoney" class="text" value=""><font color="red">*</font><font color="red" id="billMoney_span"></font></td>
				</tr>
			   <tr>
					<td class="field">出版社：</td>
					<td>
						<select name="proId" id="proId">
							
								<option value="0">中华出版社</option>
							
								<option value="1">清华出版社</option>
							
								<option value="2">成光出版社</option>
							
						</select>
						<font color="red">*</font><font color="red" id="proId_span"></font>
					</td>
				</tr>
				 <tr>
					<td class="field">是否借出：</td>
					<td><input type="radio" name="payed" value="1">是<input type="radio" name="payed" checked="" value="0">否</td>
				</tr>
			</tbody></table>
		</div>
		<div class="buttons">
			<input type="button" name="add" id="add" value="保存" class="input-button">
			<input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button"> 
		</div>

	</form>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bill/add.js"></script>


</body></html>