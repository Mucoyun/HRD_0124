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
			String sql = "select count(*) from teach0124";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%><script>
					alert("no seach teach");
					location.href = "/HRD_0124/teach0124/teach0124_insert.jsp";
				</script><%	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>강사 정보 조회 화면</h2>
		<p>총 <%=no %>명의 강사가 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">강사코드</th>
				<th width="100">강사명</th>
				<th width="200">전공</th>
				<th width="200">세부전공</th>
				<th width="100">관리</th>
			</tr>
			<%
				try{
					String sql = "select * from teach0124 order by idx asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String idx = rs.getString(1);
						String name = rs.getString(2);
						String major = rs.getString(3);
						String field = rs.getString(4);
						%>
						<tr>
							<td><%=idx %></td>
							<td><%=name %></td>
							<td><%=major %></td>
							<td><%=field %></td>
							<td>
								<a href="/HRD_0124/teach0124/teach0124_update.jsp?send_idx=<%=idx %>">수정</a>
								<span>|</span>
								<a href="/HRD_0124/teach0124/teach0124_delete.jsp?send_idx=<%=idx %>"
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
		<button class="btn" type="button" onclick="location.href='/HRD_0124/teach0124/teach0124_insert.jsp'">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>