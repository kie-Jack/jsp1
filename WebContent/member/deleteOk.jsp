<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	CustomerDao dao = CustomerDao.getInstance();
	dao.delete(idx);
	out.print("<script>");
	out.print("alert('고객 idx "+idx+" 삭제되었습니다.');");
	out.print("location.href='list.jsp';");
	out.print("</script>");
	
//	response.sendRedirect("list.jsp");   //out.print 출력이 안됩니다.
%>