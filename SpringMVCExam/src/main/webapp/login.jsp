<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<script type="text/javascript">
	function check(form) {
		
		if (document.forms.loginForm.password.value == "") {
			//如果 为""则弹出提示
			alert("密码不能为空");
			//将输入焦点定位到没有输入的地方
			document.forms.loginForm.password.focus();
			//返回错误
			return false;
		}	
	}
</script>
</head>
<body>

<h2>10945-刘宜捷</h2>

<form name="loginForm" action="${pageContext.request.contextPath }/loginCheck.action">
	用户名:<input type="text" name="firstName"/><br/>
	密码：<input type="password" name="password"/><br/>
	<input type="submit" value="登录" onclick="return check(this);"/>
</form>
<br/>
<c:if test="${error != null }">
	${error}
</c:if>

</body>
</html>