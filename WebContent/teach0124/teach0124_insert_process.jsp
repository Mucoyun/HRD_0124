<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 과정형 평가 연습문제 20</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String idx = request.getParameter("idx");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String field = request.getParameter("field");
				
		try{
			String sql = "insert into teach0124 values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, field);
			pstmt.executeUpdate();
			%><script>
				alert("등록이 완료되었습니다.");
				location.href = "/HRD_0124/teach0124/teach0124_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>