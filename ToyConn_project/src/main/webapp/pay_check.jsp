<%@page import="model.MemberInfo"%>
<%@page import="model.ToyDAO"%>
<%@page import="model.ToyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>장난감 정보</title>
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
   href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="css/chat.css">
</head>

<body class="animsition">
   <%
   int p_num = (Integer) request.getAttribute("p_num");
   ToyDTO toy = new ToyDAO().getToyInfo(p_num);
   int result = (Integer) request.getAttribute("result");
   int pay = (Integer) request.getAttribute("pay");
   %>

   <div style="margin: auto; padding-top: 15%;">
      <div class="row">
         <div class="col-md-6 col-lg-7 p-b-30">
                <div class="p-l-25 p-r-30 p-lr-0-lg">
                    <div class="wrap-slick3 flex-sb flex-w">
                        <div class="wrap-slick3-dots"></div>
                        <div class="gallery-lb" style="width: 80%;">
                            <div class="item-slick3" data-thumb="images/product-detail-01.jpg">
                                <div class="wrap-pic-w pos-relative" style="width: 80%;" >
                                    <img src="images/crolling/<%=toy.getImage_file()%>" alt="IMG-PRODUCT">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

         <div class="col-md-6 col-lg-5 p-b-30">
            <div class="p-r-50 p-t-5 p-lr-0-lg">
               <table class="paytable">
                  <tr>
                     <td width ="150" style ="padding-bottom: 30px;">
                        <h4 class="mtext-105 cl2">상품명</h4>
                     </td>
                     <td style ="padding-bottom: 20px;">
                        <!-- 상품명 -->
                        <h4 class="mtext-105 cl2" ><%=toy.getP_name()%></h4>
                     </td>
                  </tr>
                  <tr style ="margin-top: 30px;">
                     <td style ="padding-bottom: 20px;">
                        <h4 class="cl2" ">대여자</h4>
                     </td>
                     <td style ="padding-bottom: 20px;">
                        <!-- 대여자 이름 -->
                        <h4 class="mtext-105 cl2" ><%=toy.getUser_id()%></h4>
                     </td>
                  </tr>
                  <tr>
                     <td style ="padding-bottom: 20px;">
                        <h4 class="cl2" >위치</h4>
                     </td>
                     <td style ="padding-bottom: 20px;"><a href="#" class="js-show-modal1" > <img
                           src="images/kakaomap.jpg" alt="IMG-LOGO"
                           style="border-radius: 20%; width: 30px;"> 위치 확인
                     </a></td>
                  </tr>
                  <tr>
                     <td style ="padding-bottom: 20px;">
                        <h4 class="cl2" >대여 날짜</h4>
                     </td>
                     <td style ="padding-bottom: 20px;">
                        <h4 class="cl2" ><%=result%>일
                        </h4>
                     </td>
                  </tr>
                  <tr>
                     <td style ="padding-bottom: 20px;">
                        <h4 class="cl2">대여 가격</h4>
                     </td>
                     <td style ="padding-bottom: 20px;">
                        <!-- 가격 --> <span class="mtext-106 cl2"><%=pay%>원</span>
                     </td>
                  </tr>
               </table>
               <form action="payService" id="offlinePay">
                  <input type='hidden' name="lender_id"
                     value="<%=session.getAttribute("id")%>"> <input
                     type='hidden' name="user_id" value="<%=toy.getUser_id()%>">
                  <input type='hidden' name="p_num" value="<%=toy.getP_num()%>">
                  <input type='hidden' name="p_name" value="<%=toy.getP_name()%>">
                  <input type='hidden' name="price" value="<%=pay%>"> <input
                     type='hidden' name="result" value="<%=result%>"> <input
                     type='hidden' name="pay_choice" value="현금">
               </form>
               <form action="payService" id="onlinePay">
                  <input type='hidden' name="lender_id"
                     value="<%=session.getAttribute("id")%>"> <input
                     type='hidden' name="user_id" value="<%=toy.getUser_id()%>">
                  <input type='hidden' name="p_num" value="<%=toy.getP_num()%>">
                  <input type='hidden' name="p_name" value="<%=toy.getP_name()%>">
                  <input type='hidden' name="price" value="<%=pay%>"> <input
                     type='hidden' name="result" value="<%=result%>"> <input
                     type='hidden' name="pay_choice" value="카드">
               </form>
               <form action="./message.jsp" id="back">
                  <input type='hidden' name="p_num" value="<%=toy.getP_num()%>">
                  
               </form>
               <div class="flex-w p-b-10" style ="margin-top: 30px;">
                  <span class="stext-107 cl6" style="padding-right: 10px;">

                     <button
                        class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"
                        style="min-width: 100px; height: 40px;" onclick="offlinepay()">현금
                        결제</button>
                  </span> <span class="stext-107 cl6" style="padding-right: 10px;">
                     <button
                        class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"
                        style="min-width: 100px; height: 40px;" onclick="kakaoPay()">온라인
                        결제</button>
                  </span><span class="stext-107 cl6">
                     <button
                        class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"
                        style="min-width: 100px; height: 40px;" onclick="moveMessage()">대화로 돌아가기</button>
                  </span>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!--===============================================================================================-->
   <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
   <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
   <script type="text/javascript">
   function offlinepay() {
          document.querySelector(
            "#offlinePay")
            .submit();
   }
   function onlinepay(){
          document.querySelector(
            "#onlinePay")
            .submit();
   }
   function moveMessage(){
       document.querySelector(
        "#back")
        .submit();
}
</script>

   <script>
var IMP = window.IMP;   // 생략 가능
IMP.init("imp56447215"); 

  function kakaoPay() {
    IMP.request_pay({
      pg: "kakaopay",
      pay_method: "card",
      merchant_uid: "ORD2018013-324<%=toy.getP_num()%>323",   // 주문번호
      name: "<%=toy.getP_name()%>",
      amount: <%=pay%>,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "<%=session.getAttribute("id")%>",
      buyer_tel: "010-4242-4262",
      buyer_addr: "<%=session.getAttribute("address")%>",
            buyer_postcode : "01181",
         }, function(rsp) { // callback
            if (rsp.status == "paid") {
               alert("결제완료!");
               document.querySelector("#onlinePay").submit();
            }
         });
      }
   </script>
   <!--===============================================================================================-->
   <script src="vendor/animsition/js/animsition.min.js"></script>
   <!--===============================================================================================-->
   <script src="js/main.js"></script>

</body>

</html>