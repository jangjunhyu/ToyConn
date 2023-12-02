<%@page import="model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form {
display: none;
}
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script><!-- 카카오 스크립트 호출 -->
<script>
	Kakao.init('884fc5c900adbd0a43cf5178eee68d38'); // 카카오 키
	console.log(Kakao.isInitialized()); // SDK 초기화 (boolean)
</script>
</head>
<body>
	<table> 
		<tr>
			<td><button id="kakaoLoginBtn" onclick="kakaoLogin()">카카오 로그인</button></td>
		</tr>
		<tr>
			<td><button id="kakaoLogoutBtn" onclick="kakaoLogout()">카카오 로그아웃</button></td>
		</tr>
		<tr>
			<td><a href="ChangeAccount.jsp" id="ChangeAccountBtn"><button>회원정보 수정</button></a></td>
		</tr>
		<tr>
			<td><a href="RemoveAccount.jsp" id="RemoveAccountBtn"><button>회원탈퇴</button></a></td>
		</tr>
	</table>
	<form action="FirstLoginCheck" method="post" id="FirstLoginCheck">
		<input type="text" id="userID" name="user_id" readonly="readonly">
		<input type="text" id="userNick" name="nick" readonly="readonly">
	</form>
	<form action="LogoutAccount" id="LogoutAccount"></form>
	
	<%
		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		
	%>
	<% if (memberInfo != null) { %>
	<h3><%= memberInfo.getNick() %>님 환영합니다.</h3>
	<% } %>
	<script type="text/javascript">
		let KakaoToken = null;
		let btn1 = document.querySelector("#kakaoLoginBtn");
		let btn2 = document.querySelector("#kakaoLogoutBtn");
		let btn3 = document.querySelector("#ChangeAccountBtn");
		let btn4 = document.querySelector("#RemoveAccountBtn");
		<% if (memberInfo == null) { %>
			btn1.style.display = "block";
			btn2.style.display = "none";
			btn3.style.display = "none";
			btn4.style.display = "none";
		<% } else if (memberInfo != null) { %>
			btn1.style.display = "none";
			btn2.style.display = "block";
			btn3.style.display = "block";
			btn4.style.display = "block";
		<% } %>
		
		function kakaoLogin() { // 로그인 서비스
	        Kakao.Auth.login({
	            success : function(response) {
	                Kakao.API.request({
	                    url : '/v2/user/me',
	                    success : function(response) {
	                        console.log(response);
	                        KakaoToken = response;
	                        document.querySelector("#userID").value = KakaoToken.id;
	                        document.querySelector("#userNick").value = KakaoToken.properties.nickname;
	                        document.querySelector("#FirstLoginCheck").submit();
	                        },
	                    fail : function(error) {
	                        console.log(error);
	                    }
	                })
	            },
	            fail : function(error) {
	                console.log(error);
	            }
	        })
	    }
	    
	    function kakaoLogout() {
	        if (Kakao.Auth.getAccessToken()) {
	          Kakao.API.request({
	            url: '/v1/user/unlink',
	            success: function (response) {
	            	console.log(response)
	            	document.querySelector("#LogoutAccount").submit();
	            },
	            fail: function (error) {
	              console.log(error)
	            },
	          })
	          Kakao.Auth.setAccessToken(undefined)
	        }
	      }
		
	</script>
</body>
</html>