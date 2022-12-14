# 프로젝트 기획안

---

### 프로젝트 명 : 라일락

### 기획의도

- 새로 시작하는 봄을 제일 먼저 맞이 하는 향기로운 꽃나무처럼 새로운 시작을 준비하는 분들에게 
유용한 사이트가 되어보고 싶은 마음입니다.

- 자격증을 준비하는 분들의 경우 해당 자격증이 대한 도메인 지식이 없는 경우가 있습니다.
자격증을 취득하기 위해 어떤 공부를 해야 하는지, 어떤 선수지식이 필요한지 얻는 방법 중
비용을 아끼고 가장 접근하기 쉬운 방법 중에 하나는 유튜브를 통해 알아보는 방법이 유용하다고 생각합니다.
프로젝트 라일락은 자격증에 대한 일정, 필요한 교재, 유튜브영상에 기초한 일종의 사전학습에 유용한 사이트를 지향합니다.

- 프로젝트 라일락이 제공하게 될 기능
    - 공공데이터에 기초한 정확한 자격증 시험 일정 및 관리
    - 도서관데이터에 기초한 교재의 종류 검색 및 대출가능 여부 판단
    - 일반서점에 대한 검색으로 대체될 수 있습니다
    - 자격증에 관련된 유튜브 영상 검색 및 북마킹 관리
    - 자격증정보, 교재, 영상자료를 통합하여 관리할 수 있는 플랫폼 제공

### 벤치마킹

- 에듀윌 ([https://www.eduwill.net/sites/home](https://www.eduwill.net/sites/home))
    - 장점
        - 오프라인과 온라인이 적절하게 결합된 유연한 커리큘럼
        - 온라인 강의 포털서비스라고 할 정도로 방대한 강의자료를 보유
        - 지속적인 TV를 비롯한 공중파방송 및 온라인광고를 통한 높은 인지도
        - 대부분의 강의를 자체 제작
     
    - 단점
        - 자격증 및 공무원 수험에 집중된 강의 편성
        - 전문적인 이미지는 부족함, 노량진의 온라인 버전
        - 비싼 비용
        - 미리보기 불가
      
    - 참고할만한 사항
        - 다양한 기능의 동영상 플레이어
            
            재생속도 조절 가능, 플레이 정지 시점 저장됨
            
        - 세분화된 동영상 타임라인
        - 개인강의실 메뉴에 접근이 어려움  (링크를 많이 거쳐야 함)
    
- 인프런 ([https://www.inflearn.com/](https://www.inflearn.com/))
    - 장점
        - IT 분야에 대한 전문적인 온라인 강의 제공
        - 하나의 카테고리를 세분화시켜 통합과정이 아닌 단과과정으로 제공
        - 자신이 필요한 부분만 골라서 학습가능
        - 깔끔하고 세련된 UI
    - 단점
        - 세분화된 강의영상으로 인해 처음시작하는 초보자에게는 선택이 어려움을 유발
        - 대부분의 영상이 자체제작이 아니어서 좀더 심화된 강의를 원하는 경우 제작자의 사이트에 접속해야 하는 경우도 발생
        - 무료로 제공하는 영상은 3-4년은 지난 영상이라 실제 영상의 퀄리티를 가늠하기에는 어려움
        - 미리보기 불가
    - 참고할만한 사항
        - 원하는 영상을 찾기 쉬움
        - 개인강의노트같은 개인정보에 대한 접근이 쉬움
        - 기능이 전무한 동영상플레이어 (타임라인이 거의 유일한 기능)
        심플하다고 하면 좋을 수 있으나 재생속도 조절이 필요함 (개인차가 있을수있음)

### 주요기능

- 회원가입
    - 이름, 이메일, 주소를 입력받는다
        - 주소는 전부 받는 것이 아니고 XXX시 XXX구 같이 세부주소를 제외한 지역구까지만 받는다
- 회원탈퇴 가능
- 회원프로필 이미지 지원
- 회원, 비회원 기능 차이
    - 회원과 비회원 모두 검색은 가능
    - 회원만 강의노트 생성 가능
    
- 자격증 검색 기능
    - 자격증에 연관된 도서관서적 검색결과, 유튜브 영상이 한번에 같이 검색됨
    - [http://www.kmooc.kr/](http://www.kmooc.kr/) 에 제공하는 연관 강의 검색도 지원
    - 자격증에 따른 개인 강의노트 생성
    - 날짜순, 조회순 필터 기능 제공
    - 모든 자격증을 지원하지 않고 IT 관련 자격증만 지원한다
    - 검색 카테고리 메뉴를 지원한다
    - 자격증 검색시 해당 자격증의 시험일정이 자동 검색되어야 한다
    - 자격증 검색과 같이 검색되는 항목들
        - 도서관 서적
        - 유튜브 검색
        - 무크강의 검색
        - 자격증 시험일정
    
- 강의노트 기능
    - 강의노트는 자격증을 최상위 주제로 삼은 검색결과로 얻은 서적, 유튜브영상, 무크강의 모음이다
    - 자격증을 기준으로 연관된 서적, 유튜브영상, 무크 강의 링크를 관리한다
        - 검색결과에 따른 서적, 유튜브영상, 무크 링크의 추가, 삭제 기능
        - 개인정보와 별도의 메뉴로 분리된다
    - 등록한 영상의 플레이 진행정도를 표시한다

### 기타

  - API 호출이 많은 부분을 차지하므로 검색허용량에 주의해야 한다
  - 회원관리, 공지사항, 로그관리 같은 관리자 페이지는 Notion 을 활용하는 방법도 고려해본다

