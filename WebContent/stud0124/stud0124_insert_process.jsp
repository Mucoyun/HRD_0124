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
		String studno = request.getParameter("studno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String position = request.getParameter("position");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String[] hobby = request.getParameterValues("hobby");
		String hobbys = "";
		
		for(String h : hobby){
			if(h == hobby[0]){
				hobbys = h;
			}else{
				hobbys = hobbys + "," + h;
			}
		}
		
		try{
			String sql = "insert into stud0124 values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studno);
			pstmt.setString(2, name);
			pstmt.setString(3, dept);
			pstmt.setString(4, position);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setString(7, hobbys);
			pstmt.executeUpdate();
			%><script>
				alert("등록이 완료되었습니다.");
				location.href = "/HRD_0124/stud0124/stud0124_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>