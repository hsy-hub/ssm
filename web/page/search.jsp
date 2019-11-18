<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/18
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<tr>
    <td>	<input name="method" value="query" class="input-text" type="hidden"/>
        用户名：<input name="name" class="input-text" type="text"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <input value="查 询" type="submit" name="search"/>
    </td>
</tr>
<table>
<tbody>

</tbody>
</table>
<script>
    $(function () {
        $("input[name=search]").on("click", function () {
            var name = $("input[name=name]");
                var data = {"name": name.val()}
                $.ajax({
                    url: "<%=request.getContextPath()%>/search.action",
                    dataType: 'json',
                    type: "post",
                    data: JSON.stringify(data),
                    contentType: 'application/json',
                    success: function (d) {
                        $("tbody").empty();
                        for (var i = 0; i < d.length; i++) {
                            console.log(d[i].name);
                            $("tbody").append("<tr><td>" + d[i].name + "</td></tr>")
                        }
                    }
                })
            })
        })
</script>
</body>
</html>
