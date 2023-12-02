<%@page import="model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>메인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png">
<!--===============================================================================================-->
<!-- 필수 css -->
<style type="text/css">
#FirstJoinAccount {
display: none;
}
.HiddenInfo {
display: none;
}
</style>
</head>
<body>
	<%
	MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
	String user_id = memberInfo.getUser_id();
	String nick = memberInfo.getNick();
	String address = memberInfo.getAddress();
	
	String[] listAddress = address.split("/");
	%>

	<section class="container" style="margin-top: 5%;">
		<div class="size-210 p-t-55 p-lr-15-lg" style="margin: 0 auto;">
			<h4 class="mtext-105 cl2 txt-center p-b-30">회원정보 수정</h4>
			<form action="ChangeAccount" method="post">
				<div class="form-group m-b-20 how-pos4-parent">
					<label class="label" for="subject">
					닉네임
					</label> 
					<input type="text" class="HiddenInfo" name="user_id" value="<%= user_id %>" readonly="readonly">
					<input type="text" id="basic_nickname"
						class="form-control stext-111 cl2 plh3 size-116 p-r-30"
						name="nick" placeholder="닉네임" value="<%= nick %>">
				</div>
				
				<div class="form-group m-b-30 m-b-20 how-pos4-parent">
					<label class="label" for="#">주소 입력</label>
					<div class="form-control stext-111 cl2 plh3 size-120 p-tb-25">
						<input type="text"
							class="form-control stext-111 cl2 plh3 size-116 p-r-30"
							id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" value="<%= listAddress[2] %>"> 
						<input type="button"
							class="flex-c-m stext-101 cl0 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						<br>

						<input type="text"
							class="form-control stext-111 cl2 plh3 size-116 p-r-30"
							name="sample6_address" id="sample6_address" placeholder="주소" value="<%= listAddress[0] %>"> 
						<input type="text"
							class="form-control stext-111 cl2 plh3 size-116 p-r-30"
							id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소" value="<%= listAddress[1] %>"> 
						<input type="text"
							class="form-control stext-111 cl2 plh3 size-116 p-r-30"
							id="sample6_extraAddress" placeholder="참고항목"
							style="display: none;"> 
						<input type="text" id="before_address" value="<%= address %>" style="display: none;">
					</div>
				</div>
				<button onclick="AddressNullCheck()" class="cl0 size-121 bg3 bor1">완료</button>
				<!-- <input type="submit" value="완료" class="cl0 size-121 bg3 bor1"> -->
			</form>
		</div>
	</section>

	<!-- 필수 js -->
	<!-- --------------------------- -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function AddressNullCheck() {
			console.log("AddressNullCheck");
			document.querySelector("form").submit();			
		}
	</script>
	
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
	<!--===============================================================================================-->

</body>

</html>