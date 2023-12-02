<%@page import="model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#beforeNick {
display: none;
}
#beforeAddress {
display: none;
}
</style>
</head>
<body>
	<%
	MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
	%>
	<form action="ChangeAccount" method="post">
		<table>
			<tr class="hideInfo">
				<td>아이디</td>
				<td><input type="text" name="user_id" value="<%= memberInfo.getUser_id() %>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" id="nick" name="nick" value="<%= memberInfo.getNick() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="address" name="address"></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td><button onclick="duplicateCheck()">회원정보 변경</button></td>
		</tr>
		<tr>
			<td id="beforeNick"><%= memberInfo.getNick() %></td>
		</tr>
		<tr>
			<td id="beforeAddress"><%= memberInfo.getAddress() %></td>
		</tr>
	</table>
	<script type="text/javascript">
		let beforeNick = document.querySelector("#beforeNick").textContent;
		let beforeAddress = document.querySelector("#beforeAddress").textContent;
		let nickNullCheck = false;
		let addressNullCheck = false;
		
		function duplicateCheck() {
			
			/* let nick = document.querySelector("#nick").value;
			let address = document.querySelector("#address").value; */
			
			if (nick.length > 0) {
				nickNullCheck = true;
			}
			if (address.length > 0) {
				addressNullCheck = true;
			}
			
			if (nickNullCheck && addressNullCheck) {
				document.querySelector("form").submit();
			} else {
				window.alert("비어있는 칸을 입력해 주세요!")
			}
		}
	</script>
</body>
</html>