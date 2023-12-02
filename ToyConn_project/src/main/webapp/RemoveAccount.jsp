<%@page import="model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
	String nick = memberInfo.getNick();
	%>
	<h3>회원탈퇴를 하는 아이디는 <%= nick %>입니다. </h3>
	<h3>정말로 회원탈퇴를 하시겠습니까?</h3>
	<table>
		<tr>
			<td><a href="RemoveAccount"><button>예 회원탈퇴 합니다.</button></a></td>
			<td><a href="Main.jsp"><button>아니요 탈퇴하지 않습니다.</button></a></td>
		</tr>
	</table>
</body>
</html>