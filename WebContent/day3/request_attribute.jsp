<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[5] - Request 객체의 Attribute</title>
</head>
<body>
<!-- Request 객체의 Attribute를 이용하여
	  현재 B.jsp 파일에서 다른 A.jsp 파일로 데이터를 전달합니다. 
	 그리고 이때, A.jsp 파일로 이동하는 명령은 pageContext.forward("A.jsp")로 합니다.	
	 http://localhost:8083/jsp1/day3/B.jsp  
	 http://localhost:8083/jsp1/day3/A.jsp
	 위의 2가지 url은 요청이 다릅니다.
-->
<%
	MyUser vo = new MyUser("사나",23,"서울");
	int value1 = 23;
	String value2 = "Hello";
	
	//위의 3가지 값은 request_result.jsp 파일로 전달합니다.
	request.setAttribute("attr1", vo);				//setAttribute에서 attr1은 Attribute Key, vo 는 Atrribute Value
	request.setAttribute("attr2", value1);			//Attribute 중복된 키 사용하면 값은 덮어쓰기 (변경)
	request.setAttribute("attr3", value2);
	
	pageContext.forward("request_result.jsp");		
	//요청을 변경하는게 아니고 요청을 전달(forward)합니다. -> 요청이 발생할때의 request 객체 정보를 똑같이 사용할 수 있게 합니다.
	//요청을 전달했기 때문에 url 변경이 없습니다.
%>
	<!-- 사용자입력(또는 조회) -> 처리 -> 결과 출력 순서로 봤을 때
		처리에서 결과로 넘어가는 과정에서 필요합니다.
	 -->
</body>
</html>