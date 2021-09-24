<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[]- db 회원 등록</title>
<style>
	ul{
		list-style: none;
		padding-inline-start:0px;  /* 목록 들여쓰기 없애기 */
	}
	ul #name{
		padding : 5px  20px;
		margin : 5px 0px;
		background-color: tomato;
		color:white;
	}
	li {
		padding : 5px  20px;
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
	<li><%= cus.getEmail() %></li>
	<li><%=cus.getAge() %>세 (<%= (cus.getGender().equals("male")? "남":"여") %>) </li>
	<li>지역 : <%=cus.getAddr() %></li>
	<li>취미 : <%= cus.getHobby() %></li>
</ul>
<a href="list.jsp">회원 리스트</a>
</body>
</html>