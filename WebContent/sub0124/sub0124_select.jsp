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
			String sql = "select count(*) from sub0124";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%><script>
					alert("no seach sub");
					location.href = "/HRD_0124/sub0124/sub0124_insert.jsp";
				</script><%	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>교과목 정보 조회 화면</h2>
		<p>총 <%=no %>개의 교과목이 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">과목코드</th>
				<th width="300">과목명</th>
				<th width="100">학점</th>
				<th width="100">담당강사</th>
				<th width="100">요일</th>
				<th width="100">시작시간</th>
				<th width="100">종료시간</th>
				<th width="100">관리</th>
			</tr>
			<%
				try{
					String sql = "select a.id,a.subject_name,a.credit,b.name,a.week,a.start_hour,a.end_hour from sub0124 a, teach0124 b where a.lecturer=b.idx order by id asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String subject_name = rs.getString(2);
						String credit = rs.getString(3);
						String lecturer = rs.getString(4);
						String week = rs.getString(5);
						String start_hour = rs.getString(6);
						String end_hour = rs.getString(7);
						
						if(week.equals("1")){ week="월"; }
						if(week.equals("2")){ week="화"; }
						if(week.equals("3")){ week="수"; }
						if(week.equals("4")){ week="목"; }
						if(week.equals("5")){ week="금"; }
						if(week.equals("6")){ week="토"; }
						
						if(start_hour.length()==3){
							String s1 = start_hour.substring(0,1);
							String s2 = start_hour.substring(1,3);
							start_hour = "0"+s1+" : "+s2;
						}else{
							String s1 = start_hour.substring(0,2);
							String s2 = start_hour.substring(2,4);
							start_hour = s1+" : "+s2;
						}
						if(end_hour.length()==3){
							String e1 = start_hour.substring(0,1);
							String e2 = start_hour.substring(1,3);
							end_hour = "0"+e1+" : "+e2;
						}else{
							String e1 = end_hour.substring(0,2);
							String e2 = end_hour.substring(2,4);
							end_hour = e1+" : "+e2;
						}
						
						%>
						<tr>
							<td><%=id %></td>
							<td><%=subject_name %></td>
							<td><%=credit %>점</td>
							<td><%=lecturer %></td>
							<td><%=week %></td>
							<td><%=start_hour %></td>
							<td><%=end_hour %></td>
							<td>
								<a href="/HRD_0124/sub0124/sub0124_update.jsp?send_id=<%=id %>">수정</a>
								<span>|</span>
								<a href="/HRD_0124/sub0124/sub0124_delete.jsp?send_id=<%=id %>"
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
		<button class="btn" type="button" onclick="location.href='/HRD_0124/sub0124/sub0124_insert.jsp'">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>