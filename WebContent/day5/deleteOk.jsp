<%@page import="day5.dao.MybatisDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	MybatisDao dao = MybatisDao.getInstance();
	dao.delete(idx);
	
	
	out.print("<script>");
	out.print("alert('고객 idx " +idx+" 삭제되었습니다.');");
	out.print("location.href='../member/list.jsp';");
	out.print("</script>");
%>