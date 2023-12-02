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

  <br>
  <h3>게시판 입력, 수정 기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/e334d299381a4f8a75881a842e767e7cdb487d6d/ToyConn_project/src/main/webapp/board_list.jsp#L369">[코드확인]</a>
  <hr>
  <ul>
    <li>게시판 등록 시 제목, 익명, 내용 입력 가능</li>
    <li>수정 시 제목, 내용 수정</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/c5f4d658-027e-4bba-9a7e-3f05215fa9c6">

  <br>
  <h3>장난감 등록기능</h3><a href="https://github.com/jangjunhyu/ToyConn/blob/e334d299381a4f8a75881a842e767e7cdb487d6d/ToyConn_project/src/main/webapp/toy_join.jsp#L389">[코드확인]</a>
  <hr>
  <ul>
    <li>장난감 등록 시 상품 이미지, 상품명, 가격, 카테고리, 세부 사항 등록 가능</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/edf0283f-3d16-43a5-b861-4fb8649fb4a0">

  <br>
  <h3>채팅기능</h3>
  <a href="https://github.com/jangjunhyu/ToyConn/blob/e334d299381a4f8a75881a842e767e7cdb487d6d/ToyConn_project/src/main/webapp/message.jsp#L381C1-L381C1">[코드확인]</a>
  <hr>
  <ul>
    <li>사용자가 해당 장난감 상세정보에서 채팅하기를 클릭하면 상대방과의 채팅 시작</li>
    <li>'전송'버튼 클릭 시 채팅 보내기</li>
    <li>내 닉네임과 보낸 날짜, 장난감 이름 표현</li>
  </ul>
  <img src="https://github.com/jangjunhyu/ToyConn/assets/120622212/69c65259-ceb2-4167-9ff3-2c5c0c736709">
</details>

<h2>회고</h2>
<hr>
<p>프로젝트 처음 할 때 기획 단계가 너무 힘들었다. '전자 상거래 서비스'를 만들어야하는데 아이디어를 내면 이미 있는 서비스 이고, 차별성을 두어 색다른 아이디어를 내면 왜 다른 기업들이 서비스를 안하는지 알게 되는 아이디어였다.
<br>
<br>
기획 단계에서 수 많은 아이템을 갈아엎은 결과 '동네 장난감 대여서비스'를 선택하였다.
<br>
  <br>
팀장 역할을 맡은지 두 번째였지만 여전히 역할 분배가 너무 어려웠고, 계획 짜는 것이 어려웠다. 하지만 첫 번째 프로젝트를 할 때 보다 팀원들의 수준이 보다 높아져있었고, 맡은 바를 내가 생각한 수준만큼 잘 이행해줬다.
<br>
  <br>
나는 Back_end 역할을 수행하며 어떻게 기능을 만들면 좋을지 고민을 많이 했다. 특히, 여러 api를 사용하면 서비스 퀄리티와 기능이 확실히 좋아질 것이라 생각하여 다양한 api들을 찾아보고, 써보고, 공부했다. 여러개의 api들 중 채택한 것이 카카오 로그인, 카카오 map, import, kakao 주소 api 였다. 여러 api를 만져본 결과, 핵심 프로젝트 하기전에 비해 확실히 다루는 능력이나, 코드를 읽고 파악하는 능력이 늘어난 것을 스스로도 느낄 수 있었다.
<br>
  <br>
Front_end 부분과 내가 만든 것을 연결하기 이전에는 상당히 깔끔하고 기능이 잘 돌아갔지만, 막상 jsp 형식으로 Front와 연결하니 생각보다 오류가 많이 발생하였다. 회의를 많이 하고, 의견을 잘 모았다고 생각 했지만 역시나 모든 사람의 생각이 동일할 수 는 없었다. 하지만 어떻게든 구현을 하고, 원하는 결과물이 나올때까지 계속 오류를 수정했다.(오류 잡는 부분만 2~3일이 걸렸다.)
<br>
  <br>
이번 프로젝트에서 우리는 C2C를 겨냥했기 때문에 실시간 채팅은 필수적인 요소였다. 그러기위해선 웹소켓을 활용하여 채팅 기능을 구현할 수 밖에 없었는데, 구글에 찾아본 결과 대표적으로 2가지 방법이 있었다. 첫 번째는, socket.io 라이브러리를 활용한 방법, 두 번째는 Spring 프레임워크에서 socket을 활용하는 방법이 있었다. 하지만 socket.io는 node.js 서버를 기반으로 동작하기 때문에 jsp/Servlet을 사용하는 우리 서비스는 이미 tomcat을 사용하고 있을 뿐더러 node.js와는 호환이 되지 않았다. 그리고 Spring 프레임워크는 현재 우리가 작성했던 코드의 틀을 바꿔야하기 때문에 사용하기 힘들었다. 이러한 부분에서 나는 고민을 많이 하였고, Front_end 담당 인원과 협력하여 메시지를 보내는형태를 채팅창 형식으로 만들어보기로 했다.
<br>
  <br>
그래서 나는 내가 채팅을 입력하고 전송 버튼을 누를 시 해당 채팅 내용이 DB에 저장되고 저장된 리스트를 다시 SendRedirect 방식을 통해 채팅창 리스트에 표현되게 하였다. 이러한 방식으로 웹 소켓처럼 실시간은 아니지만, 사용자는 비슷한 기능처럼 느낄 수 있도록 하였다.
<br><br>
대여중인 상품, 대여 가능한 상품 버튼을 클릭하면 해당 상품만 보일 수 있게 했음 좋았겠다 라는 심사위원의 평이 있었다. 나도 이 부분에서 조금 아쉬운 부분이 있었다. 하지만 발표일이 다가오고, 계속 오류를 수정하는 기간이 길어져 심사위원이 말한 것처럼의 추가적인 기능을 추가하기엔 내가 많이 부담이 되어있었다. 시간이 2~3일만 더 있었다면 이러한 부분을 보완하고, 사용자의 입장에서 조금 더 편리한 서비스를 만들 수 있었었을 것 같다.
<br>
  <br>
이제 핵심 프로젝트가 끝났으니 실전 프로젝트 들어가기전에 다른 토이 프로젝트나 마음에 맞는 인원들이랑 하는 소규모 팀 프로젝트를 진행해보려고 한다.
</p>
