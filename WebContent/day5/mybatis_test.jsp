<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day5.dao.MybatisDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day5 - Mybatis Test</title>
</head>
<body>
<%
	MybatisDao dao = MybatisDao.getInstance();
	List<Customer> list = dao.selectAll();
	out.print("<h4>select * from customer</h4>");
	//out.print(list);
	request.setAttribute("list", list);
	pageContext.forward("registration_view.jsp");
	
	Customer cus = dao.select(5);
	out.print("<h4>select * from customer where idx=5</h4>");
	out.print(cus);	//조회결과가 없으면 null
	
	//out.print("<h4>insert into customer</h4>");
	//int result = dao.insert(new Customer(0,"박세리","1111",
	//							"seri@m.net",null,"female",0,"피아노"));
	//out.print(result);
	
	out.print("<h4>delete from customer</h4>");
	int result = dao.delete(8);
	out.print(result);
	
	out.print("<h4>update customer</h4>");
	cus = new Customer();
	cus.setEmail("park@naver.com");
	cus.setAddr("청주");
	cus.setIdx(25);
	result = dao.update(cus);
	out.print(result);
%>
</body>
</html>