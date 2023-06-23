# 쇼핑몰 사이트
* 스프링 프레임워크를 기반으로 만든 쇼핑몰 사이트입니다.
 
### 🕗제작 기간 & 인원  
* 2023.05.31 ~ 2022.06.22 (조금씩 업데이트 중)  
* 1명  
### 🗒️개요  
* 비전공자로 6개월동안 프로그래밍 공부를 하며, 스프링의 구조와 메커니즘을 잘 이해하고 있는게 맞는지, 맞다면 스스로 얼마나 구현할 수 있을까? 라는 생각이 들어 프로젝트를 통해 직접 만들어보게 되었습니다. 실제 웹프로그램이 어떻게 동작하고 어떤 정보들을 주고 받는지를 스프링 프레임워크를 통해 실제 쇼핑몰을 구현하여 기본적인 흐름을 이해하고자 하였습니다.

###  ⚒️ 개발 환경
* Front : jQuery ,JavaScript, html, css
* Back : Spring
* DB : Mysql

## ❗주요 기능

#### 홈 화면
* 2023/6/22 기준 구현된 기능(빨간박스처리)
* DB테이블
<p>
<img width="33%" alt="home" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/4ea6725e-01fb-4e1f-8067-546b8b040b94"/>
 <img width="30%" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/eb380ec5-3b1f-42d2-a819-94b49d2c2a6d">
</p>

#### 회원가입
* 회원 등록 화면
* ID 중복 체크
* JS에서 정규식으로 유효성 검사
<p align="left">
  <img width="30%" alt="user_register" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/804e24f9-c598-483a-ac2c-c99ac17910cb">
  <img width="30%" alt="user_register_js" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/d6cce337-a765-4f19-90da-c8f24e0f66ae">
</p>

#### 로그인
* ID 검증
* 로그인 시 네비게이션바 login->logout, register->modify로 변경
* 로그인 시 아이디, 이름 세션에 저장
* admin 계정으로 로그인 시 상품등록을 위한 item 활성화
* (구현계획) mailSender 를 이용하여 ID 찾기 , PW 찾기 
<p align="left">
  <img width="30%" alt="login" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/4b18d1be-d56e-4514-a362-8763a8561d92">
  <img width="30%" alt="user_modify" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/85eb3c1b-2f99-4fed-bacb-bdb2b9b62d74">

</p>

#### 로그아웃
* 세션 삭제

#### 상품 화면
* 이미지 미리보기 및 업로드
* 수정,목록 화면에서도 이미지를 불러올수 있게 구현
* 신상품순, 조회수순, 카테고리별 목록 조회 기능 구현
* 상품 이름으로 검색 기능 구현
* 페이지네이션 구현
<p>
  <img width="30%" alt="item_register" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/01d06c32-e83d-4c9b-97e8-585e8646a3fd">
  <img width="30%" alt="item_modify" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/e0012417-70e8-4bab-9b44-a0d7ee5bfc89">
  <img width="30%" alt="itemList" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/0fe781e9-4c3a-4f07-96f2-8200d5c18eb6">
  <img width="30%" alt="item_search" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/6e3f519f-8688-441a-8157-e17c026a3241">
  <img width="30%" alt="item_read2" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/764de501-feaa-4b4f-b29a-d2b80e39c8fa">
</p>

#### Q&A 
* 상품Q&A 글 작성, 읽기, 수정, 삭제(CRUD) 구현
* Q&A는 상품상세페이지와 Q&A게시판 양쪽에서 확인할수 있도록 구현
* Q&A 게시판에서는 Q&A에 해당 상품도 보여주기 위해 상품테이블과 조인
* 페이지네이션
* 작성 날짜와 검색 조건(제목,상품명 등)으로 검색 기능 구현
<p>
  <img width="30%" alt="qna_write" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/f5543984-8b60-4ec4-948e-068a5fbd4742">
  <img width="30%" alt="qna_read" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/1ea65041-7eea-4ad0-bb5b-3f382622f9d4">
  <img width="30%" alt="qna_modify" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/1e694d4f-5336-4865-ac98-07c4b5ff6e08">
  <img width="30%" alt="qnaList_in_item_read" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/275472dd-09c5-4a30-ab2b-d639103dc818">
  <img width="30%" alt="qnaList" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/9477a912-e1b9-4280-b64c-8f7146faa12c">
  <img width="30%" alt="qnaList_search" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/88244351-92bb-4a90-b000-14e8974d4989">
</p>

#### 공지사항
* 글 작성, 읽기, 수정, 삭제(CRUD) 구현
* 댓글 작성, 읽기, 수정, 삭제(CURD) 구현(REST API)
* 공지사항 제목,내용,제목+내용 옵션으로 검색 기능 구현
* 공지사항, 댓글 페이지네이션
* 목록으로 돌아가기 또는 수정완료, 삭제 후에도 정상적으로 이전 페이징을 유지하기 위해 UriComponentsBuilder 사용
<p>
 <img width="30%" alt="noticeList" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/2e8f5d3c-5fa3-4deb-9c69-603f52981d9d">
 <img width="30%" alt="noticeList_search" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/5dff86ad-eab1-4d23-967f-73e6d45112f5">
 <img width="30%" alt="notice comment" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/dd760d50-431d-4639-914b-9169f110aafd">
 <img width="30%" alt="notice_comment_paging" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/aa470029-f586-4d8c-846e-45c4faeff42d">
 <img width="30%" alt="notice_modify" src="https://github.com/imazato-lee/MyPortfolio/assets/129563625/26ae0790-d089-43a2-bf79-eb6787f78504">

</p>



---
### ✍️회고
* 공부를 시작하고나서부터 저의 진정한 개발 공부는 혼자서 프로젝트를 진행하기 전과 후로 나뉜다고 생각합니다. 실제로 프로젝트를 준비하며 평소에 웹서핑을 할때도 이 기능은 어떻게 만들었을까?
하며 조금은 초급 프로그래머의 시각으로 접근할 수 있게 되었습니다. 실제 프로그램을 구현하면서 코드를 만드는 시간보다 어떤 방식으로 구현할 것인가의 틀을 짜는데 시간을 훨씬 많이 투자하였습니다. 
기능을 하나하나 추가할 때마다 이전보다 시간이 덜 걸리게 되었고, 조금 더 복잡해져도 며칠 고민하면서 퍼즐을 맞 출 수 있었습니다. 비록 한 번 막히면 서너시간동안 코드 하나 붙잡고
하루를 다 보낸 날도 있고, 첫 프로젝트의 코드 퀄리티가 좋지 않지만 저에게는 정말 즐겁게 고민하며 만든 첫 프로젝트입니다. 앞으로 구매 기능과 장바구니 기능 등을 추가하고 실제로 배포도 해보고 싶습니다.

아쉬운 점은 코드의 질 보다는 기능의 구현에 중점을 두어, 다음 프로젝트에는 재사용성이 좋은 코드를 만들고 싶습니다. 


