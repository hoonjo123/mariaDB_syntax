
실습

author 테이블을 나누어 author_adress 테이블 추가
    country, state_city, details, zip code, phonenumber
    on delete cascade 옵션
    1:1 관계 설정
    author 와 post의 관계가 N:M. 즉, 여러명이서 한 post를 수정할 수 있도록 스키마 수정

    adress 테이블
    여러명이 한 글을 작성할 수 있도록
    총 4개 테이블 만들어보기 


    -- 내가 만든거
use board;
CREATE TABLE author(
    id INT not null, 
    name VARCHAR(255) not null, 
    email VARCHAR(255) not null, 
    password VARCHAR(255), 
	address VARCHAR(255), 
    PRIMARY KEY (id)
);

CREATE TABLE author_address(
	adress_id VARCHAR(255) primary key,
   country VARCHAR(255),
   state_city VARCHAR(255),
   details INT,
   zip_code VARCHAR(255),
   phonenumber VARCHAR(255),
   author_id INT,
   foreign key(author_id) references author(id)
   on delete cascade
);
  delete from author_address where author_id=5;
  select * from author_address;
  select * from author;
  delete from author where id =5;

CREATE TABLE post(
id INT PRIMARY KEY, 
title VARCHAR(255), 
content VARCHAR(255), 
author_id INT, 
FOREIGN KEY(author_id) REFERENCES author(id)
);


CREATE TABLE author_post_relation (
    author_id INT,
    post_id INT,
    PRIMARY KEY (author_id, post_id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);


    select * from author as a left join author_post_relation as ps on a.id = ps.author_id left join post as p on ps.post_id = p.id;



-- 강사님이 만든거


실습 2 

order_system 데이터베이스 생성
회원 컬럼 (자유설계, 회원의종류가 user, admin, seller/enum타입 써서 제한두기)
판매자는 상품과 재고수량을 등록 (상품명, 상품가격, 재고)
회원테이블에 fk


개념적모델링 
**논리적모델링(가장중요한단계)
물리적데이터모델링

