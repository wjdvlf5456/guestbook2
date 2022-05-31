<%@page import="java.util.List"%>
<%@page import="com.javaex.dao.GuestBookDao"%>
<%@page import="com.javaex.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
	GuestBookDao guestBookDao = new GuestBookDao();
	List<GuestBookVo> guestList = guestBookDao.guestSelect();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form action="./add.jsp" method = "get">
			
		
		
		</form>
	<%for(int i =0; i<guestList.size(); i++) { %>
		<table border = "1">
			<tr>
				<td><%=guestList.get(i).getNo() %></td>
				<td><%=guestList.get(i).getName() %></td>
				<td><%=guestList.get(i).getRegDate() %></td>
				<td><a href = "./delete.jsp?no=<%=guestList.get(i).getNo()%>">삭제</a></td>
			</tr>
		</table>
		<%} %>
	</body>
</html>