<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失败</title>
</head>
<%
	if(session.getAttribute("firstName") == null){
		response.sendRedirect("login.jsp");
	}
%>
<body>
失败
</body>
</html>