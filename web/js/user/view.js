﻿// //跳转修改页面
// $("#update").bind("click",function(){
// 	var userId=$("#userId").val();
// 	// window.location="userUpdate.jsp";
// 	location.href="${pageContext.servletContext.contextPath}/selectUserByidServlet?id=${user.id}"
// });
//删除
$("#del").bind("click",function(){
		if(confirm("确认删除？")){
			
		}
});
//重置密码
$("#repassword").bind("click",function(){
	var userId=$("#userId").val();
	if(confirm("确认重置密码？")){
		
	}
});
