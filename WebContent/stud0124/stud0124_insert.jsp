<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 과정형 평가 연습문제 20</title>
	<script>
		function yes() {
			var Form = document.iu_form; 
			
			if(Form.studno.value==""){
				alert("학번이 입력되지 않았습니다.");
				Form.studno.focus();
			}else{
				Form.submit();
			}
		}
		
		function no() {
			location.href = "/HRD_0124/index.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>학사 정보 등록 화면</h2>
		<form name="iu_form" method="post" action="stud0124_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>학번</th>
					<td><input type="text" name="studno"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td>
						<select name="dept">
							<option value="1" selected>컴퓨터공학과</option>
							<option value="2">기계공학과</option>
							<option value="3">전자과</option>
							<option value="4">영문학과</option>
							<option value="5">일어과</option>
							<option value="6">경영학과</option>
							<option value="7">무역학과</option>
							<option value="8">교육학과</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>학년</th>
					<td>
						<input type="radio" name="position" value="1" checked> 1학년
						<input type="radio" name="position" value="2"> 2학년
						<input type="radio" name="position" value="3"> 3학년
						<input type="radio" name="position" value="4"> 4학년
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" value="프로그램"> 프로그램
						<input type="checkbox" name="hobby" value="독서"> 독서
						<input type="checkbox" name="hobby" value="등산"> 등산
						<input type="checkbox" name="hobby" value="여행"> 여행
						<input type="checkbox" name="hobby" value="낚시"> 낚시
						<input type="checkbox" name="hobby" value="영화보기"> 영화보기
						<input type="checkbox" name="hobby" value="잠자기"> 잠자기
						<input type="checkbox" name="hobby" value="멍때리기"> 멍때리기
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="yes()">등록</button>
						<button type="button" onclick="no()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>