<%@page import="util.MySQLConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3 [1] - DB test</title>
</head>
<body>
	<h4>MySQL Connection Test</h4>
	<hr>
	DB connection result?
	<%
		Connection connection = MySQLConnectionUtil.connect();
		out.print(connection);
		out.print("<br>");
		if(connection == null) out.print("연결 실패 하였습니다.");
		else out.print("연결 성공 하였습니다.");
	%>
</body>
</html>