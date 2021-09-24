<%@page import="day3.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Day4 - 회원정보 수정 </title>
    <link rel=stylesheet href="../css/member.css?v=3">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" 
    integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
     crossorigin="anonymous">
     <script>
        function validCheck(){

        }
        
        function deleteOk(){
        	const yn = confirm('[주의]등록된 고객에서 삭제하시겠습니까?');
        	if(yn){
        		alert(`고객 idx ${cus.idx}를 삭제합니다.`);
        		location.href=`deleteOk.jsp?idx=${cus.idx}`;		//요청url 이동 --> 고객 삭제 완성해보세요
        	}else{
        		alert('고객 삭제를 취소했습니다.')
        	}
        }
     </script>
</head>

<body>
<c:if test="${alert!=null}">
   <script type="text/javascript">
      alert('고객 정보가 수정되었습니다.!');
   </script>
</c:if>

    <div style="width:70%; margin: auto;">
        <h2 style="background-color: brown;font-size: 40px;color:white;">
            <i class="fas fa-address-book"></i>  <!-- font icon -->
        </h2>
        <h3>고객정보 수정</h3>                               
        <form action="update_save.jsp" name="frmReg" method="post"
        	onsubmit="return validCheck()">
        	<input type="hidden" name="idx" value="${cus.idx}">		
        	<!-- 브라우저에 출력은 안되고 파라미터로 필요한값은 type 을 hidden 으로 사용. -->       
            <table style="width:100%; margin: auto;">
                <tr>
                    <td><label>이름</label></td>    <!-- required 필수 입력, readonly 읽기전용 -->
                    <td><input type="text" name="name" placeholder="이름 입력(필수)" value="${cus.name}"readonly></td>			<!-- readonly : 읽기만. 입력못합니다. -->
                </tr>
                <tr>
                    <td><label>이메일</label></td>
                    <td><input type="email" name="email" value="${cus.email}"></td>
                </tr>
                <tr>
                    <td><label>나이</label></td>
                    <td><input type="number" name="age" min="10" max="99" value="${cus.age}" readonly></td>   
                     <!-- value는 기본값. type="number" 일 때는 min, max 속성 설정가능 -->
                </tr>
                <tr>
                    <td><label for="">주소</label></td>
                    <td>
                        <!-- 선택 리스트 만들기 위해 select 태그 사용 -->
                        <select name="addr" id="addr_select">
                            <!-- option 태그안에 문자열은 화면에 보이는것, 
                            value안에 문자열은 서버로 전송되는 값 -->
                            <option value="서울">서울</option> <!-- selected는 기본 선택 값. -->
                            <option value="인천">인천</option>
                            <option value="대전">대전</option>
                            <option value="광주">광주</option>
                            <option value="부산">부산</option>
                            <option value="기타"selected>기타</option>
                        </select>
                        <span id="addr_id">
                        <!-- disabled="disabled"는 파라미터 값 전달에서 제외됩니다. -->
                        <input type="text" name="addr_etc" disabled="disabled" value="${cus.addr}" 
							placeholder="기타 지역을 입력하세요." >
					</span>
                    </td>
                </tr>
                <tr>
                    <td><label>성별</label></td>
                    <td>${cus.gender}</td>
                </tr>
                <tr>
                    <td><label>취미</label></td>
                    <td>${cus.hobby}</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="수정하기"> 
                        <input type="button" value="삭제하기" onclick="deleteOk()">
                        <input type="button" value="고객목록" onclick="location.href='../member/list.jsp'">
                        <input type="reset" value="다시쓰기">
                    </td>
                </tr>                
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
	
	/* 표현식으로 자바의 변수값을 가져오기. cus객체의 addr 프로퍼티 (get메소드를 통해서 가져옵니다.)*/
	document.querySelectorAll("option").forEach( item => {
			if(item.value===`${cus.addr}`) item.selected=true;	
	});
	
	</script>
</body>
</html>