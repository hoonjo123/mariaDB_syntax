            "정규화"


리눅스 환경에서 mariadb 설치하는 법
-- 목록 업데이트
파일을 다운받기 위해서는 
apt-get에 파일목록이 있어야함.
sudo apt-get update
sudo apt-get upgrade
sodo ap-get install -y mariadb-server
-y를 쓰면 y없이 설치가 진행된다.

sudo systemctl start mariadb
sudo systemctl enable mariadb

ps -ef | greb mariadb
sudo mariadb -u root-p 

--------------------------------------------------------

1. 데이터모델링

관계형 스키마를 더 좋은 구조로 정제해 나가는 과정

-모델링

개념적
논리적
물리적


board의 author, post의 개념적 모델링
관계선도 정확하게 
속성도 각각 ㅇ 로 표시하기 

이름, 이메일 - pk

프로젝트 개요와 요구사항(구체적인 내용을 글로 쓴것)
개념적 모델링 (erd_ordering service.drawio)
논리적 모델링 relational schema_orderingservice.drawio
물리적 모델링

테스트결과서 (insert, update -> 캡쳐png)

1:n 관계


실습

author 테이블을 나누어 author_adress 테이블 추가
    country, state_city, details, zip code, phonenumber
    on delete cascade 옵션
    1:1 관계 설정
    author 와 post의 관계가 N:M. 즉, 여러명이서 한 post를 수정할 수 있도록 스키마 수정

    adress 테이블
    여러명이 한 글을 작성할 수 있도록
    총 4개 테이블 만들어보기 



-- 강사님이 만든거

