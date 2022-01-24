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
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_studno = request.getParameter("send_studno");
		
		String studno = "";
		String name = "";
		String dept = "";
		String position = "";
		String address = "";
		String phone = "";
		String hobbys = "";
		
		String[] hobby = {};
		
		try{
			String sql = "select * from stud0124 where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_studno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				studno = rs.getString(1);
				name = rs.getString(2);
				dept = rs.getString(3);
				position = rs.getString(4);
				address = rs.getString(5);
				phone = rs.getString(6);
				hobbys = rs.getString(7);
				
				hobby = hobbys.split(",");
				
				
			}else{
				%><script>
					alert("등록된 아이디가 없습니다.");
					location.href = "/HRD_0124/stud0124/stud0124_select.jsp";
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>학사 정보 변경 화면</h2>
		<form name="iu_form" method="post" action="stud0124_update_process.jsp">
			<table id="iu_table">
				<tr>
					<th>학번</th>
					<td><input type="text" name="studno" value="<%=studno %>" readonly></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td>
						<select name="dept">
							<option value="1" <%if(dept.equals("1")){%> selected <%} %>>컴퓨터공학과</option>
							<option value="2" <%if(dept.equals("2")){%> selected <%} %>>기계공학과</option>
							<option value="3" <%if(dept.equals("3")){%> selected <%} %>>전자과</option>
							<option value="4" <%if(dept.equals("4")){%> selected <%} %>>영문학과</option>
							<option value="5" <%if(dept.equals("5")){%> selected <%} %>>일어과</option>
							<option value="6" <%if(dept.equals("6")){%> selected <%} %>>경영학과</option>
							<option value="7" <%if(dept.equals("7")){%> selected <%} %>>무역학과</option>
							<option value="8" <%if(dept.equals("8")){%> selected <%} %>>교육학과</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>학년</th>
					<td>
						<input type="radio" name="position" value="1" <%if(position.equals("1")){%> checked <%} %>> 1학년
						<input type="radio" name="position" value="2" <%if(position.equals("2")){%> checked <%} %>> 2학년
						<input type="radio" name="position" value="3" <%if(position.equals("3")){%> checked <%} %>> 3학년
						<input type="radio" name="position" value="4" <%if(position.equals("4")){%> checked <%} %>> 4학년
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" value="프로그램" <%for(String h : hobby){if(h.equals("프로그램")){%> checked <%}} %>> 프로그램
						<input type="checkbox" name="hobby" value="독서" <%for(String h : hobby){if(h.equals("독서")){%> checked <%}} %>> 독서
						<input type="checkbox" name="hobby" value="등산" <%for(String h : hobby){if(h.equals("등산")){%> checked <%}} %>> 등산
						<input type="checkbox" name="hobby" value="여행" <%for(String h : hobby){if(h.equals("여행")){%> checked <%}} %>> 여행
						<input type="checkbox" name="hobby" value="낚시" <%for(String h : hobby){if(h.equals("낚시")){%> checked <%}} %>> 낚시
						<input type="checkbox" name="hobby" value="영화보기" <%for(String h : hobby){if(h.equals("영화보기")){%> checked <%}} %>> 영화보기
						<input type="checkbox" name="hobby" value="잠자기" <%for(String h : hobby){if(h.equals("잠자기")){%> checked <%}} %>> 잠자기
						<input type="checkbox" name="hobby" value="멍때리기" <%for(String h : hobby){if(h.equals("멍때리기")){%> checked <%}} %>> 멍때리기
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address %>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" value="<%=phone %>"></td>
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