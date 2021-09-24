<%@page import="day3.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day4[]- 고객 수정</title>
<!-- 스타일 참고  -->
<link rel="stylesheet" href="../css/member.css?v=3">
<script>
	function validCheck() {
		
	}
	
	function deleteOk()	{
		const yn = confirm('[주의]등록된 고객에서 삭제하시겠습니까?');
		if(yn){
			alert(`고객 idx ${cus.idx} 를 삭제합니다.`);
			location.href=`deleteOk.jsp?idx=${cus.idx}`;			//요청 url 이동 --> 고객 삭제 완성해보세요.(제공시간 30분)
		}else {
			alert('고객 삭제를 취소했습니다.');
		}
	
	}
</script>
</head>
<body>
<%
if(request.getAttribute("alert")!=null){
%>
	<script type="text/javascript">
		alert('고객 정보가 수정되었습니다.!');
	</script>

<%
}
%>

<%
	Customer cus = (Customer)request.getAttribute("cus");
%>
	<div style="width: 70%; margin: auto;">
		<h3>회원 수정</h3>  <!-- 이메일 , 지역 -->
		<form action="update_save.jsp" name="frmReg" method="post"
			onsubmit="return validCheck()">
			<input type="hidden" name="idx" value="<%= cus.getIdx()%>" >  
			<!--브라우저에 출력은 안되고 파라미터로 필요한값은 type을 hidden으로 한다. -->
			<table style="width: 100%">
				<tr>
					<td><label>이름</label></td>
				
					<td><input type="text" name="name" placeholder="이름 이력(필수)" value="<%=cus.getName() %>"
						readonly></td>   	<!--  readonly : 읽기만.입력못합니다.-->
				</tr>
				<tr>
					<td><label>이메일</label></td>
					<td><input type="email" name="email" value="<%=cus.getEmail() %>"></td>
				</tr>
				<tr>
					<td><label>나이</label></td>
					<td><input type="number" name="age" min="10" max="99" value="<%=cus.getAge() %>"
						readonly></td>
					<!-- value는 기본값. type="number" 일 때는 min,max 속성 설정 가능.-->
				</tr>
				<tr>
					<td><label for="">주소</label></td>
					<td><select name="addr" id="addr_select">
							<!-- value 속성은 서버에 전달시킬 값 -->
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<!-- selected 는 기본 선택 값. -->
							<option value="대전">대전</option>
							<option value="광주">광주</option>
							<option value="기타" selected>기타</option>
					</select> 
					<span id="addr_id">
					<!-- disabled="disabled" 는 파라미터 값 전달에서 제외됩니다. -->
					<input type="text" name="addr_etc" disabled="disabled" value="<%=cus.getAddr() %>"
							placeholder="기타 지역을 입력하세요." >
					</span></td>
				</tr>
				<tr>
					<td><label>성별</label></td>
					<td><%= cus.getGender() %></td>
				</tr>
				<tr>
					<td><label>취미</label></td>
					<td><%= cus.getHobby() %></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
					<input type="submit" value="수정하기"> 
					<input type="button" value="삭제하기" onclick="deleteOk()"> 	
					<input type="button" value="고객목록" onclick="location.href='list.jsp'"> 	
					<input type="reset" value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	document.getElementById("addr_select").addEventListener("change",function(){
		if(this.value=="기타"){  //this는 getElementById("addr_select") 요소
//			document.getElementById("addr_id").style.display="inline-block";   //화면에 보임
			document.frmReg.addr_etc.disabled=false;
		}else {
//			document.getElementById("addr_id").style.display="none";		//화면에  안보임.
			document.frmReg.addr_etc.disabled=true;
		}
		
	});
	
	/* 표현식으로 자바의 변수값을 가져오기. cus객체의 addr프로퍼티 (get메소드를 통해서 가져옵니다.)*/
	document.querySelectorAll("option").forEach( item => {
		if(item.value===`${cus.addr}`) item.selected=true;   
	});
	
	</script>
</body>
</html>