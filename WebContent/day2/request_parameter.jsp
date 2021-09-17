<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[4]</title>
</head>
<body>
	<!-- request parameter : request 객체에 저장되어 서버에게 전달되는 데이터. 
		 1) URL 뒤에 ? 에 쿼리 문자열로 전달하는 방법
		 2) method 를 post 로 하여 전달하는 방법 -->
	<!-- http://localhost:8083/jsp1/day2/request_parameter.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&age=34
							ㄴ **Request Method : GET -->
	<h2>Request Parameter Practice</h2>
	<!-- 이파일의 역할 : 사용자가 보낸 데이터를 받아서 처리하는 JSP 파일입니다. -->
	<hr>
	<%
	//form data(method post)로 전달된 데이터의 인코딩 필요.
	request.setCharacterEncoding("UTF-8");
	
	//request의 파라미터 가져오기. 파라미터가 10개라면.... getParameter() 메소드 10번 반복
	//예고편 : DTO(VO) 타입 클래스를 이용해서 파라미터와 객체를 자동으로 매핑(FrameWork : group of Libraries)
	String name = request.getParameter("name"); //"name"은 ?뒤에 파라미터이름
	String age = request.getParameter("age"); //파라미터 안받았다고 오류가 발생하지 않습니다.
	String location = request.getParameter("location"); //파라미터 이름 "location" 의 값이 없다면 null
	%>
	<ul>
		<li>이름 : <%=name%></li>
		<li>나이 : <%=age%></li>
		<!-- 파라미터에 location 도 전달해봅시다. -->
		<li>지역 : <%=location%></li>
	</ul>
	<!-- 파라미터값으로 MyUser 객체를 생성해 봅시다. -->
	<%
//if(age==null) age = "999";
	//************************************매우 중요. 오류 생기지않도록 해야함********************************************
	if (age == null  || age.length()==0) {		//  ||age.equals("")
	// 파라미터 age 가 없을 때 age==null
	// java.lang.NumberFormatException: For input string: "" 오류처리 age="" 일때
	// 		위의 두가지 경우 모두		-> Integer.parseInt 메소드에서 오류
		
	%>
		<script type="text/javascript">
		alert('나이를 입력하세요.');
		</script>
	<%
		//브라우저 태그를 print 하라는것은 -> 응답할 html 형식 문서에 태그가 추가되는 것입니다.
		//out.print("<script>");
		//out.print("alert('나이를 만드시 입력해야합니다.')");
		//out.print("</script>");
	} else {
		MyUser my2 = new MyUser(name, Integer.parseInt(age), location);
		//Integer.parseInt(age) -> age가 null이면 오류
		out.print(my2); //out은 내장객체 -> 브라우저에 출력
	%>
	
	<ul>
		<li>이름 : <%=my2.getName()%></li>
		<li>나이 : <%=my2.getAge()%></li>
		<li>지역 : <%=my2.getLocation()%></li>
	</ul>
	<%
		} //if end
	%>
</body>
</html>