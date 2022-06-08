<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.javaex.vo.GuestBookVo" %>
<%@ page import = "java.util.List" %>
<%
List<GuestBookVo> guestList = (List<GuestBookVo>)request.getAttribute("guestList");
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
		<table border = "1" width = "500">
		<c:forEach items ="${guestList }" var = "vo" varStatus="status">
			<tr>
				<td>${vo.no}</td>
				<td>${vo.name}</td>
				<td>${vo.regDate}</td>
				<td><a href = "./gbc?action=deleteForm&no=${vo.no }">삭제</a></td>
			</tr>
			<tr>
				<td colspan =4>"${vo.content}"</td>
			</tr>
		</c:forEach>
		</table>
	</body>
</html>