<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day4[1] JSTL과 EL</title>
</head>
<body>
<!-- jstl 태그를 사용하기 위해서 필요한  -->
<!-- c로 시작하는(prefix="c") 태그는 core 태그라고 부릅니다. : 변수 사용, 흐름의 제어 -->
<h5> 자바 변수처럼 값을 저장합니다. </h5>
<c:set var="age" value="10"/>	<!-- 변수명 age, 값은 10 저장 -->
age 출력 : ${age} 단수 el 보다는 c:out 태그 사용합니다. <c:out value="${age}"/>
<h5> 자바 if 역할을 하는 태그입니다.</h5>
<c:if test="${age<20}">
	<span style="color:green;">청소년입니다.</span>
</c:if>
<h3> 자바 if ~ else 역할을 하는 태그입니다</h3>
<c:set var="age" value="30"/>	<!-- 변수값을 변경합니다. -->
<c:choose>
	<c:when test="${age<20}">	<!-- if -->
		<span style="color:green;">20세 미만 청소년입니다.</span>
	</c:when>
	<c:otherwise>	<!-- else -->
		<span style="color:blue;">20세 이상 성인입니다.</span>
	</c:otherwise>
	</c:choose>
<h3> 자바 반복 for 역할을 하는 태그입니다.</h3>
<%-- <c:forEach var="i" begin="0" end="10" step="1"> --%>
<c:forEach var="i" begin="1" end="${param.cnt}">	<!-- parameter를 가져옵니다. 이름은 cnt -->
	<c:out value="${i}" /><br>
</c:forEach>	<!-- 실행방법 : -->
<a href="jstl_ex.jsp?cnt=5">param.cnt 테스트</a>
<h3> forTokens태그입니다.</h3>	<!-- 구분자로 토큰생성하여 반복. -->
	<c:forTokens items="sana,nana,나연,다현" delims="," var="user">
		<c:out value="${user}"/><br>
	</c:forTokens>
</body>
</html>