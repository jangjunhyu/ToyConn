<%@page import="model.payCheckDAO"%>
<%@page import="model.payCheckDTO"%>
<%@page import="model.MemberInfo"%>
<%@page import="model.MemberInfoDAO"%>
<%@page import="model.chattingListDTO"%>
<%@page import="model.ToyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ToyDTO"%>
<%@page import="model.chattingDAO"%>
<%@page import="model.chattingDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>메인</title>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="css/chat.css">
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
String id = (String)session.getAttribute("id");
	MemberInfo member = new MemberInfoDAO().getMemberInfo(id);
	List<chattingDTO> list = new chattingDAO().getChatToyList(id);
	int p_num = 0;
	if(request.getParameter("p_num")==null){
		if(list.size()>0){
			p_num = list.get(0).getP_num();
		}
	}else{
		p_num = Integer.parseInt(request.getParameter("p_num"));
	}
	
	ToyDTO toy = new ToyDAO().getToyInfo(p_num);
	List<ToyDTO> ToyList = new ArrayList<>();
	for(int i=0;i<list.size();i++){
		ToyList.add(new ToyDAO().getToyInfo(list.get(i).getP_num()));
	}
	
	user_id = toy.getUser_id();
	MemberInfo member2 = new MemberInfoDAO().getMemberInfo(user_id);
	chattingListDTO vo = new chattingListDTO(id, p_num);
	List<chattingDTO> chatList = new chattingDAO().getChattingList(vo);
%>
 <%
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
				if (memberInfo != null) { %>
				<%  if (nick.equals("admin")) { %>
				  <a href="Member_admin.jsp"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"> 회원관리 </a>
				  <a href="#" id="CorrectionMember"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"> 회원정보 수정 </a>
                  <a href="#" id="kakaoLogout"	
                     class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
                     로그아웃 </a>
                  <a class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"><%= nick + " 관리자" %></a>
                     <% } else { %>
                  <!-- 로그인 되면 출력 -->
                  <a href="#" id="CorrectionMember"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"> 회원정보 수정 </a>
                  <a href="#" id="kakaoLogout"	
                     class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
                     로그아웃 </a>
                  <a class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"><%= nick %></a>
                <% }} else { %>                
                  <!-- 로그아웃 상태 -->
                  <a href="#" id="kakaoLogin"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"><%=memberInfo != null ? nick : "로그인"%></a>
                     <%} %>
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
                            <li style="margin: 30px;">
                                <a href="main.jsp" style="font-size: large;font-weight: 600;">메인</a>
                            </li>

                            <li style="margin: 30px;">
                                <a href="toy_list.jsp" style="font-size: large;font-weight: 600;">동네 장난감</a>
                            </li>

                            <li class="label1" style="margin: 40px;" data-label1="hot">
                                <a href="premium.jsp" style="font-size: large;font-weight: 600;">프리미엄</a>
                            </li>

                            <li style="margin: 30px;">
                                <a href="trade_list.jsp" style="font-size: large;font-weight: 600;">거래 목록</a>
                                
                            </li>
                            <li style="margin: 30px;">
                                <a href="board_list.jsp" style="font-size: large;font-weight: 600;">게시판</a>
                            </li>

                            <li>
                                <a href="toy_join.jsp" style="font-size: large;font-weight: 600;">장난감 등록</a>
                            </li>
                        </ul>
                    </div>

                    <!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						
						
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=PcList.size()%>">
						<img src="images/icons/종종.png" alt="" style="height: 20px;">

						</div>

						<a href="message.jsp"
							class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 "
							>
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
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
					<img src="images/icons/말풍선 .png" alt="" style="height: 20px;">
				</a>
			</div>

			<!-- Button show menu -->
            <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                <span class="hamburger-box">
                    <span class="hamburger-inner"></span>
                </span>
            </div>
        </div>


        <!-- Menu Mobile -->
        <div class="menu-mobile">
            <ul class="topbar-mobile">
                <li>
                    <div class="left-top-bar">
                        More kids, More joy
                    </div>
                </li>

                <li>
                    <div class="right-top-bar flex-w h-full">
                        <%
				if (memberInfo != null) { %>
				<%  if (nick.equals("admin")) { %>
				  <a href="Member_admin.jsp"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"> 회원관리 </a>
				  <a href="#" id="CorrectionMember"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"> 회원정보 수정 </a>
                  <a href="#" id="kakaoLogout"	
                     class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
                     로그아웃 </a>
                  <a class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"><%= nick + " 관리자" %></a>
                     <% } else { %>
                  <!-- 로그인 되면 출력 -->
                  <a href="#" id="CorrectionMember"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"> 회원정보 수정 </a>
                  <a href="#" id="kakaoLogout"	
                     class="flex-c-m trans-04 p-lr-25" style="font-size: small;">
                     로그아웃 </a>
                  <a class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"><%= nick %></a>
                <% }} else { %>                
                  <!-- 로그아웃 상태 -->
                  <a href="#" id="kakaoLogin"
                     class="flex-c-m trans-04 p-lr-25"
                     style="font-size: small;"><%=memberInfo != null ? nick : "로그인"%></a>
                     <%} %>
                    </div>
                </li>
            </ul>

            <ul class="main-menu-m" style = "background-color: #fff;">
				<li style="margin: 30px;"><a href="main.jsp"
					style="font-size: large; font-weight: 600; color: black; ">메인</a></li>

				<li style="margin: 30px;"><a href="toy_list.jsp"
					style="font-size: large; font-weight: 600; color: black;">동네 장난감</a></li>

				<li class="label1" style="margin: 30px;" data-label1="hot"><a
					href="premium.jsp" style="font-size: large; font-weight: 600; color: black;">프리미엄</a>
				</li>

				<li style="margin: 30px;"><a href="trade_list.jsp"
					style="font-size: large; font-weight: 600; color: black;">거래 목록</a>
				</li>

				<li style="margin: 30px;"><a href="toy_join.jsp"
					style="font-size: large; font-weight: 600; color: black;">게시판</a></li>
				<li style="margin: 30px;"><a href="toy_join.jsp"
					style="font-size: large; font-weight: 600; color: black;">장난감 등록</a></li>
			</ul>
		</div>


        <!-- Modal Search -->
        <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
            <div class="container-search-header">
                <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                    <img src="images/icons/icon-close2.png" alt="CLOSE">
                </button>

                <!-- 검색 기능 -->
                <form action="#" class="wrap-search-header flex-w p-l-15">
                    <button class="flex-c-m trans-04">
                        <i class="zmdi zmdi-search"></i>
                    </button>
                    <input class="plh3" type="text" name="search" placeholder="Search...">
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
	
	<!-- ------------------------------------------------ -->
	<div class="row">
		<section id="container" style="background-color: rgb(255, 255, 255);">
			<div>
				<aside>
					<header>
						<h2 style="color: white;">전체 대화</h2>
					</header>
					<ul>
					<%for(int i=0; i<list.size(); i++){%>
						<li style="padding: 10px;">
							<div>
							<%if(ToyList.get(i).getP_name().length()>14){ %>
								<h2><a href="./message.jsp?p_num=<%=list.get(i).getP_num()%>" style="color: white;"><%=ToyList.get(i).getP_name().substring(0, 14)%>...</a></h2>
								<%}else{ %>
									<h2><a href="./message.jsp?p_num=<%=list.get(i).getP_num()%>" style="color: white;"><%=ToyList.get(i).getP_name().substring(0, ToyList.get(i).getP_name().length())%></a></h2>
								<%} %>
								
								<h3><%=list.get(i).getText_content()%></h3>
								
							</div>
						</li>
						<%}%>
					</ul>
				</aside>

				<main>
					<header>
						<div>
							<h2><%=toy.getUser_id()%></h2>
							<%if(toy.getP_name().length()>17){ %>
								<h3><%=toy.getP_name().substring(0, 17)%>...</h3>
							<%}else{ %>
								<h3><%=toy.getP_name()%></h3>
							<%}%>
						</div>
					</header>
					<ul id="chat">
						<%for(int i=0; i<chatList.size(); i++){ %>
						<%if(!chatList.get(i).getRecipient().equals(chatList.get(i).getSender())){ %>
						<%if(chatList.get(i).getRecipient().equals(id)){ %>
						<li class="you">
							<div class="entete">
								<span class="status green"></span>
								<h2><%=chatList.get(i).getSender()%></h2>
								<!-- 시간 -->
								<h3><%=chatList.get(i).getChat_time()%></h3>
							</div>
							<div class="triangle"></div>
							<div class="message"><%=chatList.get(i).getText_content()%></div>
						</li>
						<%}else{ %>
						<li class="me">
							<div class="entete">
								<h3><%=chatList.get(i).getChat_time()%></h3>
								<h2><%=member.getNick()%></h2>
								<span class="status blue"></span>
							</div>
							<div class="triangle"></div>
							<div class="message"><%=chatList.get(i).getText_content()%></div>
						</li>
						
						<%}}else{%>
							<%if(!chatList.get(i).getRecipient().equals(id)){ %>
						<li class="you">
							<div class="entete">
								<span class="status green"></span>
								<h2><%=chatList.get(i).getSender()%></h2>
								<!-- 시간 -->
								<h3><%=chatList.get(i).getChat_time()%></h3>
							</div>
							<div class="triangle"></div>
							<div class="message"><%=chatList.get(i).getText_content()%></div>
						</li>
						<%}else{ %>
						<li class="me">
							<div class="entete">
								<h3><%=chatList.get(i).getChat_time()%></h3>
								<h2><%=member.getNick()%></h2>
								<span class="status blue"></span>
							</div>
							<div class="triangle"></div>
							<div class="message"><%=chatList.get(i).getText_content()%></div>
						</li>
						<%}}}%>
					</ul>
					<hr>
					<form action="sendMessageService">
					<input type="hidden" name="recipient" value="<%=toy.getUser_id()%>">
					<input type="hidden" name="p_num" value="<%=toy.getP_num()%>">
					<footer>
                        <div class="flex-w flex-r-m p-b-10 m-b-20">
                            <div class="size-204 respon6-next" style="padding-left: 10px;">
                                <div class="rs1-select2 bor8 bg0">
                                    <textarea rows="1" name="textContent" class="form-control" style="border: 0;"
                                        placeholder="택스트를 입력하시오"></textarea>
                                </div>
                            </div>
                            <div class="size-203 flex-c-m respon6">
                                <input type="submit" value="전송" style="min-width: 70px; height:40px;">
                            </div>
                        </div>
                    </footer>
					</form>
				</main>
				<hr>
			</div>
		</section>
	</div>


	<!-- -------------------------------------------------- -->
	<section class="bg0 p-b-116">
        <div class="container">
            <div class="flex-w flex-tr">
                <div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="margin: auto;width:790px;">
                    <form action="payCheckService">
                        <h4 class="mtext-105 cl2 txt-center p-b-30">
                            대여 기간 정하기
                        </h4>

                        <div class="flex-w flex-r-m p-b-10 m-b-20">
                            <div class="size-203 flex-c-m respon6">
                                대여시작 일시
                            </div>

                            <div class="size-204 respon6-next">
                                <div class="rs1-select2 bor8 bg0">
                                    <input type="date" name="start_date">
                                </div>
                            </div>
                        </div>
                        <div class="flex-w flex-r-m p-b-10 m-b-20">
                            <div class="size-203 flex-c-m respon6">
                                대여끝날 일시
                            </div>

                            <div class="size-204 respon6-next">
                                <div class="rs1-select2 bor8 bg0">
                                    <input type="date" name="end_date">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="p_num" value="<%=p_num%>">
                        <input type="submit"
                            class="btn btn-primary flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
                            value="결제하기">
                    </form>
                </div>
            </div>
        </div>
    </section>

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
							<b>신고사항</b> <br>
							전화번호 : 062-000-0000<br> 
							Email : aaa@naver.com
						</p>
					</a>
				</div>
			
			</div>

			<div class="p-t-40">
				<p class="stext-107 cl6 txt-center">
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

	<!-- Modal1 : 지도 표시 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent flex-w"
				style="height: 1000px;">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div style="width: 100%;">

					<!-- Map -->
					<div class="map">
						<div class="size-303" id="google_map" data-map-x="40.691446"
							data-map-y="-73.886787" data-pin="images/icons/pin.png"
							data-scrollwhell="0" data-draggable="1" data-zoom="11"
							style="height: 800px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	function movePayCheck() {
		 document.querySelector(
         "#pcm")
         .submit();
	}
</script>

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
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
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
			$(this).css('height', '800px');
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>

</html>