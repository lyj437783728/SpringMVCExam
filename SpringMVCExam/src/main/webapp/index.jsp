<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	if(session.getAttribute("firstName") == null){
		response.sendRedirect("login.jsp");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
 <script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>客户管理界面</title>
<script type="text/javascript">
$(document).ready(function(){           
		$(".pageNow").on("click",function(event){
			event.preventDefault();
			$.ajax({
				type:"post",
				url:"showCustomerByPage.action",
				data:{spageNow:$(this).text()},
				dateType:"json",           /* 返回的是json */
				success:function(data){
					listCustomer(data);
				}
			});
		});
	});
	
	function listCustomer(data){
		$("#info").empty();
		   $.each(data,function(i,customer){
				var option =  "<tr>"+
				"<td><a href=\"${pageContext.request.contextPath }/updateCustomerJsp.action?customerId="+customer.customerId+
					"&firstName="+customer.firstName+"&lastName="+customer.lastName+"&email="+customer.email+
					"&addressId="+customer.addressId+"\""+
					">编辑</a> | <a href=\"#\">删除</a></td>"+	
					"<td>"+customer.firstName+"</td>"+
					"<td>"+customer.lastName+"</td>"+
					"<td>"+customer.address+"</td>"+
					"<td>"+customer.email+"</td>"+
					"<td>"+customer.addressId+"</td>"+
					"<td>"+new Date(customer.lastUpdate)+"</td>"+
				"</tr>";
				             
			     $("#info").append(option);
			});
	}
</script>
</head>

<body>
<h2>客户列表</h2>
<p align="right">欢迎您：${firstName }</p>
<p align="right"><a href="${pageContext.request.contextPath }/logout.action"><input type="button" value="退出登录"/></a></p>
<a href="${pageContext.request.contextPath }/addCustmoerJsp.action"><input type="button" value="新建"/></a><br>



<table class="table table-striped" align="center" border="1px">
	<tr>
		<th>操作</th>
		<th>First name</th>
		<th>Last name</th>
		<th>Address</th>
		<th>Email</th>
		<th>CustomerId</th>
		<th>LastUpdate</th>
	</tr>
	<tbody id="info">
	<c:forEach items="${moreCustomerList }" var="customer" >
		<tr>
			<td><a href="${pageContext.request.contextPath }/updateCustomerJsp.action?customerId=${customer.customerId }
			&firstName=${customer.firstName }&lastName=${customer.lastName }&email=${customer.email }
			&addressId=${customer.addressId}"
			>编辑</a> | <a href="#">删除</a></td>	
			<td>${customer.firstName }</td>
			<td>${customer.lastName }</td>
			<td>${customer.address }</td>
			<td>${customer.email }</td>
			<td>${customer.customerId }</td>
			<td><fmt:formatDate value="${customer.lastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	<center>
		<nav>
		<ul class="pagination">
			
			<c:forEach begin="1" end="${pageCount }"  var="pageNow" >
			<li><a href="" class="pageNow">${pageNow }</a></li>
			</c:forEach>
			
		</ul>
		</nav>
	</center>
</body>
</html>