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
			
			if(Form.name.value==""){
				alert("강사명이 입력되지 않았습니다.");
				Form.name.focus();
			}else if(Form.major.value==""){
				alert("전공이 입력되지 않았습니다.");
				Form.major.focus();
			}else if(Form.field.value==""){
				alert("세부전공이 입력되지 않았습니다.");
				Form.field.focus();
			}else{
				Form.submit();
			}
		}
		
		function no() {
			location.href = "/HRD_0124/teach0124/teach0124_select.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_idx = request.getParameter("send_idx");
		
		String idx = "";
		String name = "";
		String major = "";
		String field = "";
				
		try{
			String sql = "select * from teach0124 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				idx = rs.getString(1);
				name = rs.getString(2);
				major = rs.getString(3);
				field = rs.getString(4);
			}else{
				%><script>
					alert("등록된 강사가 없습니다.");
					location.href = "/HRD_0124/teach0124/teach0124_select.jsp";
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>강사 정보  변경 화면</h2>
		<form name="iu_form" method="post" action="teach0124_update_process.jsp">
			<table id="iu_table">
				<tr>
					<th>강사 ID</th>
					<td><input type="text" name="idx" value="<%=idx %>" readonly>자동증가(Sequence 발생)</td>
				</tr>
				<tr>
					<th>강사명</th>
					<td><input type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>전공</th>
					<td><input type="text" name="major" value="<%=major %>"></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><input type="text" name="field" value="<%=field %>"></td>
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