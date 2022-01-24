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
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "select count(*) from stud0124";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%><script>
					alert("no seach stud");
					location.href = "/HRD_0124/stud0124/stud0124_insert.jsp";
				</script><%	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>학사 정보 조회 화면</h2>
		<p>총 <%=no %>개의 학사정보가 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">학번</th>
				<th width="100">성명</th>
				<th width="100">학과</th>
				<th width="100">학년</th>
				<th width="300">주소</th>
				<th width="200">연락처</th>
				<th width="400">취미</th>
				<th width="100">관리</th>
			</tr>
			<%
				try{
					String sql = "select * from stud0124 order by studno asc";
					//String sql = "select a.studno,a.name,b.deptName,a.position,a.address,a.phone,a.hobby from stud0124 a, dept0124 b where a.dept=b.deptcode order by studno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String studno = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String address = rs.getString(5);
						String phone = rs.getString(6);
						String hobby = rs.getString(7);
						
						 
						if(dept.equals("1")){dept="컴퓨터공학과";}
						if(dept.equals("2")){dept="기계공학과";}
						if(dept.equals("3")){dept="전자과";}
						if(dept.equals("4")){dept="영문학과";}
						if(dept.equals("5")){dept="일어과";}
						if(dept.equals("6")){dept="경영학과";}
						if(dept.equals("7")){dept="무역학과";}
						if(dept.equals("8")){dept="교육학과";}
						
						%>
						<tr>
							<td><%=studno %></td>
							<td><%=name %></td>
							<td><%=dept %></td>
							<td><%=position %>학년</td>
							<td><%=address %></td>
							<td><%=phone %></td>
							<td><%=hobby %></td>
							<td>
								<a href="/HRD_0124/stud0124/stud0124_update.jsp?send_studno=<%=studno %>">수정</a>
								<span>|</span>
								<a href="/HRD_0124/stud0124/stud0124_delete.jsp?send_studno=<%=studno %>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){ return false; }">삭제</a>
							</td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			
			%>
		</table>
		<button class="btn" type="button" onclick="location.href='/HRD_0124/stud0124/stud0124_insert.jsp'">등록</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>