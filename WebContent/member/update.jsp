<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//day4 고객정보 수정
	//update 후 alert 파라미터를 설정해주고 그 파라미터를 이용하여 alert 스크립트 실행
	String alert = request.getParameter("alert");
	int idx = Integer.parseInt(request.getParameter("idx"));
	CustomerDao dao = CustomerDao.getInstance();
	Customer cus = dao.selectOne(idx);
	
	//out.print(cus);   //테스트 후 지우세요.
	request.setAttribute("cus", cus);
	if (alert!=null) request.setAttribute("alert", "y");     
	pageContext.forward("update_view.jsp");
%>

