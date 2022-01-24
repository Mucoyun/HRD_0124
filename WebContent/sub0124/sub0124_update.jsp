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
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
		
		String id = "";
		String subject_name = "";
		String credit = "";
		String lecturer = "";
		String week = "";
		String start_hour = "";
		String end_hour = "";
		
		try{
			String sql = "select * from sub0124 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				subject_name = rs.getString(2);
				credit = rs.getString(3);
				lecturer = rs.getString(4);
				week = rs.getString(5);
				start_hour = rs.getString(6);
				end_hour = rs.getString(7);
			}else{
				%><script>
					alert("등록된 과목이 없습니다.");
					location.href = "/HRD_0124/sub0124/sub0124_select.jsp";
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>교과목 정보  변경 화면</h2>
		<form name="iu_form" method="post" action="sub0124_update_process.jsp">
			<table id="iu_table">
				<tr>
					<th>교과목</th>
					<td><input type="number" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="subject_name" value="<%=subject_name %>"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit" value="<%=credit %>"></td>
				</tr>
				<tr>
					<th>담당강사</th>
					<td>
						<select name="lecturer">
							<option value="" <%if(lecturer.equals("")){%> selected <%} %>>담당강사 선택</option>
							<option value="1" <%if(lecturer.equals("1")){%> selected <%} %>>김교수</option>
							<option value="2" <%if(lecturer.equals("2")){%> selected <%} %>>이교수</option>
							<option value="3" <%if(lecturer.equals("3")){%> selected <%} %>>박교수</option>
							<option value="4" <%if(lecturer.equals("4")){%> selected <%} %>>우교수</option>
							<option value="5" <%if(lecturer.equals("5")){%> selected <%} %>>최교수</option>
							<option value="6" <%if(lecturer.equals("6")){%> selected <%} %>>강교수</option>
							<option value="7" <%if(lecturer.equals("7")){%> selected <%} %>>황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>학년</th>
					<td>
						<input type="radio" name="week" value="1" <%if(week.equals("1")){%> checked <%} %>> 월
						<input type="radio" name="week" value="2" <%if(week.equals("2")){%> checked <%} %>> 화
						<input type="radio" name="week" value="3" <%if(week.equals("3")){%> checked <%} %>> 수
						<input type="radio" name="week" value="4" <%if(week.equals("4")){%> checked <%} %>> 목
						<input type="radio" name="week" value="5" <%if(week.equals("5")){%> checked <%} %>> 금
						<input type="radio" name="week" value="6" <%if(week.equals("6")){%> checked <%} %>> 토
					</td>
				</tr>
				<tr>
					<th>시작</th>
					<td><input type="text" name="start_hour" maxlength="4" value="<%=start_hour %>"></td>
				</tr>
				<tr>
					<th>종료</th>
					<td><input type="text" name="end_hour" maxlength="4" value="<%=end_hour %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="yes()">변경</button>
						<button type="button" onclick="no()">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>