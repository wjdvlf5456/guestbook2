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
		<form action="./gbc?action=add" method = "post">
			<table border="1" width="500">
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
				<td>비밀번호</td><td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><button type="submit">등록</button></td>
			</tr>
		</table>
		
		</form>
	<%for(int i =0; i<guestList.size(); i++) { %>
		<table border = "1" width = "500">
			<tr>
				<td>[<%=guestList.get(i).getNo() %>]</td>
				<td><%=guestList.get(i).getName() %></td>
				<td><%=guestList.get(i).getRegDate() %></td>
				<td><a href = "./gbc?action=deleteForm&no=<%=guestList.get(i).getNo() %>">삭제</a></td>
			</tr>
			<tr>
				<td colspan =4><%=guestList.get(i).getContent() %></td>
			</tr>
		</table>
		<%} %>
	</body>
</html>