<%@page import="day3.dto.Customer"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
String email = request.getParameter("email");
String addr = request.getParameter("addr");
if(addr.equals("기타")) addr= request.getParameter("addr_etc");

Customer cus = new Customer();
cus.setEmail(email);
cus.setAddr(addr);
cus.setIdx(idx);
CustomerDao dao = CustomerDao.getInstance();
dao.update(cus);		//메소드 실행에 필요한 모든 값이 cus 객체에 저장되어있는지 확인이 필요합니다.

//response.sendRedirect("list.jsp");			//고객정보 수정을 완료하고 돌아갈 url
response.sendRedirect("update.jsp?alert=&idx="+idx);			// 예, http://localhost:8083/jsp1/member/update.jsp?idx=8
%>
