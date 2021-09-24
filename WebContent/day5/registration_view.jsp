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
<title>Day5 - db 회원 등록</title>

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
<h3>환영합니다. WELCOME!!!</h3>
<ul>
	<li id="name">${cus.name} 님</li>
	<li>${cus.email}</li>
	<li>${cus.age }세 (${ cus.gender eq "male"? "남":"여"}) </li>
	<li>지역 : ${cus.addr}</li>
	<li>취미 : ${cus.hobby }</li>
</ul>
<a href="update.jsp?idx=${cus.idx}">정보 수정</a><br>
<a href="../member/list.jsp">회원 목록 보기</a>
</body>
</html>