<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[4] - 회원 리스트</title>
<style>
	html{
	background-color:salmon;
	}
	ul{
		display : flex;
		list-style : none;
		justify-content : space-between;
		padding-inline-stary : 0px;	/* 목록 들여쓰기 없애기 */
	}
	ul #name{
	backgournd-color : turquoise;
	padding : 5px 20px;
	margin : 5px 0px;
	color : white;
	}
	ul #email{ width : 20vw}	/*vw는 화면크기를 100으로 하여 비율값 정합니다.*/
	ul #hobby{ width : 20vw}
	h3{
	fontSize: larger;
	text-align : center;
	color : beige;
	}
	li{
	color : darkslateblue;
	margin : 5px 0px;
	padding : 5px 20px;
	border : 1px solid black;
	border-radius :  3px;
	width : 10vw;
	}
</style>
</head>
<body>
<h3> 고객 리스트 WELCOME!!!</h3>
<%
	List<Customer> list = (List<Customer>)request.getAttribute("list");  //다음주에는 이 코드를 없앱니다.
	for(Customer cus : list) {
%>
<ul>
	<li id="name"><%= cus.getName() %> 님</li>
	<li id="email"><%= cus.getEmail() %></li>
	<li><%= cus.getAge() %> 세 (<%= (cus.getGender().equals("male")? "남":"여") %>) </li>
	<li><%= cus.getAddr() %></li>
	<li id="hobby"><%= cus.getHobby() %></li>
</ul>
<%
	}
%>
</body>
</html>