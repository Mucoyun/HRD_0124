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
			
			if(Form.id.value==""){
				alert("교과목 코드가 입력되지 않았습니다.");
				Form.id.focus();
			}else if(Form.subject_name.value==""){
				alert("교과목명이 입력되지 않았습니다.");
				Form.subject_name.focus();
			}else if(Form.credit.value==""){
				alert("학점이 입력되지 않았습니다.");
				Form.credit.focus();
			}else if(Form.lecturer.value==""){
				alert("담당강사가 선택되지 않았습니다.");
				Form.lecturer.focus();
			}else if(Form.start_hour.value==""){
				alert("시작시간이 입력되지 않았습니다.");
				Form.start_hour.focus();
			}else if(Form.end_hour.value==""){
				alert("종료시간이 입력되지 않았습니다.");
				Form.end_hour.focus();
			}else{
				Form.submit();
			}
		}
		
		function no() {
			location.href = "/HRD_0124/sub0124/sub0124_select.jsp";
		}
		
		function idlength(id) {
			if(id.value.length > 6){
				id.value = 999999;
			}
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>교과목 정보 등록 화면</h2>
		<form name="iu_form" method="post" action="sub0124_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>교과목</th>
					<td><input type="number" name="id" oninput="idlength(this)"></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="subject_name"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit"></td>
				</tr>
				<tr>
					<th>담당강사</th>
					<td>
						<select name="lecturer">
							<option value="" selected>담당강사 선택</option>
							<option value="1">김교수</option>
							<option value="2">이교수</option>
							<option value="3">박교수</option>
							<option value="4">우교수</option>
							<option value="5">최교수</option>
							<option value="6">강교수</option>
							<option value="7">황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>학년</th>
					<td>
						<input type="radio" name="week" value="1" checked> 월
						<input type="radio" name="week" value="2"> 화
						<input type="radio" name="week" value="3"> 수
						<input type="radio" name="week" value="4"> 목
						<input type="radio" name="week" value="5"> 금
						<input type="radio" name="week" value="6"> 토
					</td>
				</tr>
				<tr>
					<th>시작</th>
					<td><input type="text" name="start_hour" maxlength="4"></td>
				</tr>
				<tr>
					<th>종료</th>
					<td><input type="text" name="end_hour" maxlength="4"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="no()">목록</button>
						<button type="button" onclick="yes()">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>