# ToyConn
<hr>
<ul>
  <li>주제 : 동네기반 중고 장난감 대여 서비스</li>
  <li>총 인원 : 5명</li>
  <li>기간 : 23.11.14 ~ 23.11.30</li>
  <li>팀장 : 장준휴</li>
</ul>
<br>
<h2> 메인 화면 </h2>
<img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/ae5319a0-c6d0-4089-9d24-916f704e2aeb">
<br>
<br>
<h2>내가 구현한 기능</h2>
<hr>
<ul>
  <li>사용자 동일 동네 등록 장난감 리스트 출력기능</li>
  <li>장난감 위치 kakao map 에 marker 표시 기능</li>
  <li>import api 활용 결제 기능</li>
  <li>연,월,일 차이별 가격 계산 기능(import api 활용)</li>
  <li>사용자 간 채팅 기능</li>
  <li>입금 확인 및 대여상태 update기능</li>
  <li>게시판 입력, 수정 기능</li>
  <li>장난감 등록기능</li>
  <li>유저별 장난감 거래 목록 출력 기능</li>
</ul>

<br>
<details>
<summary><b>구현서비스 자세히 보기</b></summary>
<h3> 사용자 동일 동네 등록 장난감 리스트 출력 기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/5dddbdff884eb636a595db881a67a2c1e79094ce/ToyConn_project/src/main/webapp/toy_list.jsp#L430">[코드확인]</a>
<hr>
  <ul>
      <li>로그인 사용자와 동일한 동네 사용자가 등록한 장난감 리스트 출력</li>
      <li>DB에서 이미지 이름, 장난감 명, 1일 가격, 상품 NUM 가져와 출력</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/7852fe8f-eb5b-445e-91dd-938171aeb399">

  <br>
  <h3>장난감 위치 kakao map 에 marker 표시 기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/0d3a299e9aa624f36ed89de8c31d3b83ee3aafa3/ToyConn_project/src/main/webapp/toy_info.jsp#L554C2-L554C2">[코드확인]</a>
  <hr>
  <ul>
    <li>해당 장난감 등록 유저의 주소를 좌표로 변환</li>
    <li>변환한 좌표를 kakao map api를 연동하여 marker생성</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/9dc13353-bc13-4c81-8bcd-3512c89ae65f">

  <br>
  <h3>import api 활용 결제 기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/0d3a299e9aa624f36ed89de8c31d3b83ee3aafa3/ToyConn_project/src/main/webapp/pay_check.jsp#L176">[코드확인]</a>
  <hr>
  <ul>
    <li>장난감 채팅 창에서 날짜 선택 후 '온라인 결제' 버튼 클릭 시 카카오 pay 결제 창 출력</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/ffb0d231-d01e-454f-9c97-6276db9873a3">

  <br>
  <h3>연, 월, 일 차이별 가격 계산 기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/0d3a299e9aa624f36ed89de8c31d3b83ee3aafa3/ToyConn_project/src/main/java/controller/payCheckService.java#L20C7-L20C7">[코드확인]</a>
  <hr>
  <ul>
    <li>연도가 같고 월 이 같으면 일 수 차이만 반환</li>
    <li>연도가 같고 월이 다른 경우 map을 활용하여 계산</li>
    <li>연도도 다르다면 365를 더하여 계산</li>
  </ul>

  <br>
  <h3>입금 확인 및 대여 상태 update 기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/0d3a299e9aa624f36ed89de8c31d3b83ee3aafa3/ToyConn_project/src/main/webapp/trade_list.jsp#L445">[코드확인]</a>
  <hr>
  <ul>
    <li>사용자가 결제 를 하면 소유주에게 결제 확인 및 대여 확정 리스트 생성</li>
    <li>상품 상태 '대여중'으로 바뀌고 다시 '반납확인'버튼 클릭 시 '대여가능'으로 변환</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/90a18b52-9233-4cb0-8f05-97b9c88c3f81">
</details>
