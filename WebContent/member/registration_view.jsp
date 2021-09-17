<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@page import="java.util.Arrays"%>
<%@page import="lombok.ToString"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[3] - db 회원 등록</title>

<style>
	html{
	background-color:salmon;
	}
	name{
	backgournd-color:turquoise;
	}
	h3{
	fontSize: larger;
	text-align : center;
	color : beige;
	}
	li{
	color : darkslateblue;
	padding : 5px, 20px;
	}
</style>
</head>
<body>
<%
	Customer cus = (Customer)request.getAttribute("cus");
%>
<h3>환영합니다. WELCOME!!!</h3>
<ul>
	<li id="name"><%=cus.getName() %> 님</li>
	<li><%= cus.getEmail()%></li>
	<li><%=cus.getAge() %>세 (<%= (cus.getGender().equals("male")? "남":"여") %>) </li>
	<li><%=cus.getAddr() %></li>
	<li><%= cus.getHobby() %></li>
</ul>
<a href="list.jsp">회원 리스트</a>
</body>
</html>