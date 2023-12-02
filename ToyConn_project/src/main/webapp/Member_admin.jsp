<%@page import="model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@page import="model.payCheckDAO"%>
<%@page import="model.payCheckDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="css/css.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('884fc5c900adbd0a43cf5178eee68d38'); // 카카오 키
	console.log(Kakao.isInitialized()); // SDK 초기화 (boolean)
</script>
</head>

<body class="animsition">
	<%
	String nick = null;
	String user_id = null;
	MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");

	if (memberInfo != null) {
		nick = memberInfo.getNick();
		user_id = memberInfo.getUser_id();
		session.setAttribute("id", user_id);
	}
	List<payCheckDTO> PcList = new payCheckDAO().getPayCheck(user_id);
	%>
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">More kids, More joy</div>

					<div class="right-top-bar flex-w h-full">
						<%
						if (memberInfo != null) {
						%>
						<%
						if (nick.equals("admin")) {
						%>
						<a href="Member_admin.jsp" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"> 회원관리 </a> <a href="#"
							id="CorrectionMember" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"> 회원정보 수정 </a> <a href="#"
							id="kakaoLogout" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"> 로그아웃 </a> <a
							class="flex-c-m trans-04 p-lr-25" style="font-size: small;"><%=nick + " 관리자"%></a>
						<%
						} else {
						%>
						<!-- 로그인 되면 출력 -->
						<a href="#" id="CorrectionMember"
							class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
							회원정보 수정 </a> <a href="#" id="kakaoLogout"
							class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
							로그아웃 </a> <a class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"><%=nick%></a>
						<%
						}
						} else {
						%>
						<!-- 로그아웃 상태 -->
						<a href="#" id="kakaoLogin" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"><%=memberInfo != null ? nick : "로그인"%></a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					<!-- Logo desktop -->
					<a href="#" class="logo"> <img src="images/icons/logo-01.png"
						alt="IMG-LOGO">
					</a>
					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li style="margin: 30px;"><a href="main.jsp"
								style="font-size: large; font-weight: 600;">메인</a></li>

							<li style="margin: 30px;"><a href="toy_list.jsp"
								style="font-size: large; font-weight: 600;">동네 장난감</a></li>

							<li class="label1" style="margin: 40px;" data-label1="hot">
								<a href="premium.jsp"
								style="font-size: large; font-weight: 600;">프리미엄</a>
							</li>

							<li style="margin: 30px;"><a href="trade_list.jsp"
								style="font-size: large; font-weight: 600;">거래 목록</a>
							</li>
							<li style="margin: 30px;"><a href="board_list.jsp"
								style="font-size: large; font-weight: 600;">게시판</a></li>

							<li><a href="toy_join.jsp"
								style="font-size: large; font-weight: 600;">장난감 등록</a></li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m m-r-15">
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=PcList.size()%>">
							<img src="images/icons/종종.png" alt="" style="height: 20px;">
						</div>
						<a href="message.jsp"
							class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 ">
							<img src="images/icons/말풍선 .png" alt="" style="height: 20px;">
						</a>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="main.jsp"><img src="images/icons/logo-01.png"
					alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				

				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
					data-notify="<%=PcList.size()%>">
					<img src="images/icons/종종.png" alt="" style="height: 20px;">

				</div>

				<a href="message.jsp"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 ">
					<img src="images/icons/말풍선 .png" alt="" style="height: 20px;">
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">More kids, More joy</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<%
						if (memberInfo != null) {
						%>
						<%
						if (nick.equals("admin")) {
						%>
						<a href="Member_admin.jsp" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"> 회원관리 </a> <a href="#"
							id="CorrectionMember" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"> 회원정보 수정 </a> <a href="#"
							id="kakaoLogout" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"> 로그아웃 </a> <a
							class="flex-c-m trans-04 p-lr-25" style="font-size: small;"><%=nick + " 관리자"%></a>
						<%
						} else {
						%>
						<!-- 로그인 되면 출력 -->
						<a href="#" id="CorrectionMember"
							class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
							회원정보 수정 </a> <a href="#" id="kakaoLogout"
							class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
							로그아웃 </a> <a class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"><%=nick%></a>
						<%
						}
						} else {
						%>
						<!-- 로그아웃 상태 -->
						<a href="#" id="kakaoLogin" class="flex-c-m trans-04 p-lr-25"
							style="font-size: small;"><%=memberInfo != null ? nick : "로그인"%></a>
						<%
						}
						%>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m" style="background-color: #fff;">
				<li style="margin: 30px;"><a href="main.jsp"
					style="font-size: large; font-weight: 600; color: black;">메인</a></li>

				<li style="margin: 30px;"><a href="toy_list.jsp"
					style="font-size: large; font-weight: 600; color: black;">동네
						장난감</a></li>

				<li class="label1" style="margin: 30px;" data-label1="hot"><a
					href="premium.jsp"
					style="font-size: large; font-weight: 600; color: black;">프리미엄</a>
				</li>

				<li style="margin: 30px;"><a href="trade_list.jsp"
					style="font-size: large; font-weight: 600; color: black;">거래 목록</a>
				</li>

				<li style="margin: 30px;"><a href="board_list.jsp"
					style="font-size: large; font-weight: 600; color: black;">게시판</a></li>
				<li style="margin: 30px;"><a href="toy_join.jsp"
					style="font-size: large; font-weight: 600; color: black;">장난감
						등록</a></li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div
			class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button
					class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<!-- 검색 기능 -->
				<form action="#" class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search"
						placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	 <!-- 오른쪽 상단 Cart 공간 -->
		<div class="wrap-header-cart js-panel-cart">
			<div class="s-full js-hide-cart"></div>
	
			<div class="header-cart flex-col-l p-l-65 p-r-25">
				<div class="header-cart-title flex-w flex-sb-m p-b-8">
					<span class="mtext-103 cl2"> 결제확인 요청 </span>
					<!-- 닫기 버튼 -->
					<div
						class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
						<i class="zmdi zmdi-close"></i>
					</div>
				</div>
	
				
			<div class="header-cart-content flex-w js-pscroll">
			<form action="givService">
				<ul class="header-cart-wrapitem w-full">
					<%for(int i=0; i<PcList.size(); i++){ %>
					<!-- 상품 리스트 -->
					
						
						
					
					<li class="header-cart-item flex-w flex-t m-b-12">
					<!-- 	<div class="header-cart-item-img"> -->
							<!-- 상품 이미지 -->
						<!--</div>-->
						<div class="header-cart-item-txt p-t-8">
							<!-- 상품 이름 -->
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								<%=PcList.get(i).getP_name()%>
							</a>
							<!-- 상품 개수 & 가격 -->
							<span class="header-cart-item-info">
								<%=PcList.get(i).getPrice()%>
							</span>
						</div>
						<div class="w-full">
							<!-- 이동 버튼 -->
							<div class="header-cart-buttons flex-w w-full" style="margin-top: 10px;">
							<input type='hidden' name='p_num' value="<%=PcList.get(i).getP_num()%>">
							<input type='hidden' name='lender_id' value="<%=PcList.get(i).getLender_id()%>">
							<input type='hidden' name='pc_num' value="<%=PcList.get(i).getPc_num()%>">
								<input type="submit" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10 ifClick" style="min-width:100px; height: 30px;" value="입금확인 및 대여확정">
							
							</div>
						</div>
					</li>
					
					<%}%>
				</ul>
				</form>
			</div>
		</div>
	</div>

	<div class="board_wrap">
		<div class="board_title">
			<strong>회원관리</strong>
			<p>회원관리해 주세요</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num" style="width: 15%;">아이디</div>
					<div class="title" style="width: 15%;">닉네임</div>
					<div class="writer" style="width: 45%;">주소</div>
					<div class="date" style="width: 15%">가입일자</div>
					<div class="count" style="width: 10%;">삭제</div>
				</div>
				<div>
					<div class="num" style="width: 15%;">죽음도</div>
					<div class="title" style="width: 15%; text-align: center;">이기게</div>
					<div class="writer " style="width: 45%;">광주 동구 하늘정원</div>
					<div class="date" style="width: 15%">2023.11.24</div>
					<div class="count" style="width: 10%;">
						<a href="#" class="on">삭제</a>
					</div>
				</div>

			</div>
			<div class="board_page">
				<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>

		</div>
	</div>
	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50" style="margin-left: 150px;">
					<a href="agreement.jsp">
						<h4 class="stext-301 cl0 p-b-30">이용약관</h4>
					</a>
				</div>
				<div class="col-sm-6 col-lg-3 p-b-50" style="margin-left: 150px;">
					<a href="#">
						<h4 class="stext-301 cl0 p-b-30">R2L3</h4>
					</a>
				</div>
				<div class="col-sm-6 col-lg-3 p-b-50" style="margin-left: 150px;">
					<a href="#">
						<h4 class="stext-301 cl0 p-b-30">신고</h4>
						<p class="stext-107 cl7 size-201">
							<b>신고사항</b> <br> 전화번호 : 062-000-0000<br> Email :
							aaa@naver.com
						</p>
					</a>
				</div>

			</div>

			<div class="p-t-40">
				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | Made with <i class="fa fa-heart-o"
						aria-hidden="true"></i> by <a href="https://colorlib.com"
						target="_blank">Colorlib</a> &amp; distributed by <a
						href="https://themewagon.com" target="_blank">ThemeWagon</a>
				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>

</html>