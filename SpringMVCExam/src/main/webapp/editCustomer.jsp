<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入新的用户</title>
<script type="text/javascript">
	function check(form) {
		//document.forms.form1.username.value取得form1中Username的值 并判断是否为空
		if (document.forms.customerForm.firstName.value == "") {
			//如果 为""则弹出提示
			alert("firstName不能为空");
			//将输入焦点定位到没有输入的地方
			document.forms.customerForm.firstName.focus();
			//返回错误
			return false;
		}
		if (document.forms.customerForm.lastName.value == "") {
			//如果 为""则弹出提示
			alert("lastName不能为空");
			
			//返回错误
			return false;
		}
		
	}
</script>
</head>
<%
	if(session.getAttribute("firstName") == null){
		response.sendRedirect("login.jsp");
	}
%>
<body>

<form name="customerForm" action="${pageContext.request.contextPath }/updateCustomer.action">
	<input type="hidden" name="customerId" value="${customer.customerId }"/>
	<table>
		<tr>
			<td>First Name</td>
			<td><input type="text" name="firstName" value="${customer.firstName }"/></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lastName" value="${customer.lastName }"/></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value="${customer.email }"/></td>
		</tr>
		<tr>
			<td>address</td>
			<td>
				<select name="addressId">
					<c:forEach items="${addressInfo }" var="address">
						<option value="${address.addressId }"
							<c:if test="${address.addressId == customer.addressId }">
								selected
							</c:if>
						>${address.address }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<input type="submit" value="添加" onclick="return check(this);" />
</form>

</body>
</html>