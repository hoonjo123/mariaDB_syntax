3 Day - DB

-- 부동 소수점 (이진수로 변환하는 과정에서 오차가 발생한다)
고정 소수점 DECIMAL (M,L)

-- VARCHAR을 주로 쓰긴 하지만 TEXT도 사용하기도 한다.
-- TEXT는 디스크에 저장하기 때문에 조회속도가 느리다는 단점이 있다.
-- B-tree 인덱싱 불가, Full-Time 인덱스 가능

BLOB
-- 모든 데이터를 이진법으로 변환한 것

ENUM  (정말 중요하다) 
-- 들어갈 데이터를 지정해 두는것
-- NOT NULL DEFAULT user;

날짜와 시간 
DATETIME(M)
-- m을 넣게되면 microseconds 까지 표현
-- java의 localdatetime과 sync가 맞다

DATETIME DEFAULT CURRENT_TIMESTAMP
-- 현재 시간을 DEFAULT로 삽입하는 형식

조건에 맞는 도서 리스트 출력하기

SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE FROM BOOK 
WHERE CATEGORY = '인문' AND DATE_FORMAT(PUBLISHED_DATE, '%Y') = '2021' order by PUBLISHED_DATE

SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE FROM BOOK 
WHERE CATEGORY = '인문' AND PUBLISHED_DATE like '2021%' order by PUBLISHED_DATE

SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE FROM BOOK 
WHERE CATEGORY = '인문' AND (PUBLISHED_DATE BETWEEN '2021-01-01' AND '2021-12-31') order by PUBLISHED_DATE


CAST, CONVERT 사용시 유의사항
    -- 최신버전
    CAST('123' as INT) 방식으로 int 사용가능
    -- 구버전
    CAST('123' as signed)방식으로 signed(또는 unsigned)만 사용가능

    여기서 signed는 부호있는 정수 즉, 음수/양수 모두 포함
    unsigned는 부호 없는 정수로서 0이상 양수를 의미

특정 날짜, 기간 조회
SELE
날짜 데이터 조회하는 방식 중 많이 사용하는 방식
DATE_FORMAT(date , format)을 활용한 조회
    Y,mm,dd,H,i,select
LIKE를 사용하여 문자열 형식으로 조회
    SELECT*FROM post where created_time like '2023%'
BETWEEN연산자
    WHERE created_time BETWEEN '2021-01-01'AND'2023-11-17'
날짜 비교 연산자
    WHERE created_time >= '2021-01-01' AND created_time <= '2023-11-17'

오늘날짜 관련 함수 
 NOW()
 SELECT * 
 오늘 날짜에 생성된 데이터 출력하기
 DATE_FORMAT, LIKE, BETWEEN, 비교연산자를 각각 사용하여 2023년에 생성된 데이터 출력
select* from post where created_time like '2023-11-20';
select * from post where date_format(created_time, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')
 
 제약조건

    데이터를 입력받을 때 실행되는 검사 규칙
    CREATE 문으로 테이블 생성 또는 ALTER 문으로 필드를 추가할 때 설정

    NOT NULL
    PRIMARY KEY - NOT NULL, UNIQUE (한 테이블에 1개)
    FOREIGN KEY
    UNIQUE - 한 테이블에 여러개 설정가능

    author 테이블의 이메일 컬럼에 unique를 걸어서 가입 시 중복이 되지 않게 해보자!

NOT NULL

    default 값은 nullable

    ALTER문을 써써 post의 title을 not null 조건으로 바꿔보자
        이미 null인 데이터는 삭제
        alter table post modify column title varchar(255) not null;

        AUTO_INCREMENT 키워드와 함께
            새로운 레코드가 추가될 때마다 1씩 증가된 값을 저장
            author, post 테이블의 id에 AUTO_INCREMENT로 바꿔보자

         alter table post modify column id int AUTO_INCREMENT;

post테이블 조회시 오토인크리먼트를 걸게되면 6의 데이터가 id에 들어갔다면
row를 삭제하더라도 insert 하게 되면 6이 아닌 7로 들어간다.
그런 이유로 실무에서는 중간중간 데이터가 띄워져 있는 경우가 있다.
카운트 값을 되돌리면 가능할것 같긴하지만.... ㅠㅠ 
6번의 ... ? 읭? ㅋㅋㅋ 

-- post table 에 id 없이 insert 해보고
-- insert into post (title) values (3);

-- insert 한 데이터 삭제해보고
-- 다시 insert 

AUTO_INCREMENT 는 앞으로 무조건 걸면 됨


-- describe post;
-- alter table post modify column title varchar(255) not null;
-- alter table post modify column id int AUTO_INCREMENT;
-- insert into post (title) values (3);
-- select * from post;
-- insert into post (title) values (3);
-- insert into post (id,title) values (14,'안녕');
-- select * from post where date_format(created_time, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')
-- -- 

UNIQUE


제약조건을 설정하면, 해당 필드는 값이 unique 해야함을 의미가
CREATE TABLE 테이블이름(필드이름 필드타입) [constraint 제약조건이름] unique(필드이름)

unique제약 조건을 별도로 정의하며, 선택적으로 제약 조건에 이름을 부여하는 방법

unique제약 조건을 설정하면, 해당 필드는 자동으로 index로 설정
show index from 테이블명;
-- show index from post;를 치면 2개 걸려있는것을 확인가능
index삭제 : alter table 테이블이름 drop index 인덱스명;
-- index는 중복이 적으면 적을수록 효율적이다!
제약조건 삭제 시 index 삭제 , index 삭제시 제약조건 삭제.

alter modify column id int;
인덱스는 남아있다.

실습

방법 1.alter table 테이블이름 modify column 필드이름 필드타입 unique
방법 2.alter table 테이블이름 add constraint 제약조건이름 unique

제약조건 제거
alter table 테이블명 drop constraint 제약조건이름;
alter table 테이블명 drop foreign key 제약조건이름;

INFORMATION_SCHEMA로 조회 후 드랍하기!
-- author 테이블 email에 unique 제약 조건 추가 
-- 컬럼 제약으로 추가
-- 제약조건 제거 및 index 제거
-- 테이블 제약조건 추가형식으로 추가

alter table author modify column email varchar(255) unique

제약조건을 걸면 자동 index 생성된다.
index를 삭제하면 제약조건이 삭제될까? ㅇㅇ 된다.


 alter table author modify column email varchar(255) unique;
 SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where table_name = 'author';
show index from author;
alter table author drop index email;
(index 드롭하면 제약조건도 같이 삭제가 된당.)
alter table author add constraint author_unique UNIQUE(email);


PrimaryKey

primarykey 제약 조건을 가진 컬럼을 기본키(pk)라고 함
     not null과 unique 제약 조건의 특징을 모두 가진다

primary key는 테이블당 오직 하나의 필드에만 설정
    unique는 한 테이블의 여러 필드에 설정 가능
    not null도 물론 여러 필드에 설정 가능

없던 pk를 설정하기 위한 alter문 예제

alter table 테이블 이름 modify column 필드이름 필드타입 primary key
alter table 테이블이름 add constraint 제약조건이름 primary key ( 필드이름 )


ForeignKey

외래키 - 한 테이블을 다른 테이블과 연결해주는 역할
    하나의 테이블을 다른 테이블에 의존하게 만드는 것
    다른 테이블의 필드는 반드시 unique 나 primarykey 제약조건이어야 함
    create table 테이블이름 
    ( 
        필드이름 필드타입,
        [constraint 제약조건이름]
        ForeignKey(필드이름)
        REFERENCES 테이블이름 (필드이름)[on delete/update cascade]
    )

    ex ) foreignkey(author_id) REFERENCES author(id);
    on delete restrict, on update restrict 

    foreignkey(author_id) references author(id) on update cascade;
    -- cascade 는 동시에 바꾸겠다는 의미임

참조되는 테이블에서 데이터의 수정이나 삭제가 발생시 영향
    on delete
    on update
    기본값은 delete, update 모두 restrict옵션이 걸려 있으므로, 변경하고 싶다면 각각 지정필요

    위 설정시 동작옵션

        cascade 
            참조되는 테이블에서 데이터를 삭제/수정하면 같이 삭제/수정
             foreignkey(author_id) references author(id) on update cascade;
        set null   
            참조되는 테이블에서 데이터를 삭제/수정하면 데이터는 null로 변경

        restrict
             fk로 잡은 테이블의 데이터가 남아 있으면, fk대상 데이터 수정/삭제불가
             동작옵션을 주지 않으면 기본은 restrict


--              alter table author modify column email varchar(255) unique;
--  SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where table_name = 'author';
-- show index from author;
-- alter table author drop index email;
-- alter table author add constraint author_unique UNIQUE(email);
-- show index from author;
-- select * from author;
-- select * from post;
-- describe post;


실습

on update cascade

외래키 제약조건에서 on update cascade 설정
    먼저, 기존의 foreignkey 제약조건을 조회 후 삭제
        select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'post';
        ALTER table post drop foreign key post ibfk_1;
        alter table post drop index author_id;

    새롭게 제약조건 추가
        alter table post add constraint post_author_fk FOREIGN KEY(author_id) references author(id) ON UPDATE CASCADE;
        -- author 테이블의 id를 바꾸면 post table의 author_id 가 바뀌게 된다.


테스트 
    삭제
        삭제불가
        restrict 와 동일
    수정
        author 테이블의 id 수정시 post테이블의 id도 같이 수정

        -- 이 다음부터는 중요하지 않아

on DELETE CASCADE

ON DELETE SET NULL ON UPDATE SET NULL

ON DELETE CASCADE 테스트
    author 삭제시 post 같이 삭제

-- CREATE TABLE `post` (
--    `id` int(11) NOT NULL AUTO_INCREMENT,
--    `title` varchar(255) NOT NULL,
--    `contents` varchar(3000) DEFAULT NULL,
--    `author_id` int(11) DEFAULT NULL,
--    `created_time` datetime DEFAULT current_timestamp(),
--    PRIMARY KEY (`id`),
--    KEY...

--    CREATE TABLE `author` (
--    `id` int(11) NOT NULL,
--    `name` varchar(100) NOT NULL,
--    `email` varchar(255) DEFAULT NULL,
--    `password` varchar(255) DEFAULT NULL,
--    `role` enum('user','admin') NOT NULL DEFAULT 'user',
--    `address` varchar(255) DEFAULT NULL,
--    `age` tinyint(4) DEFAULT NULL,
--    `price` tinyint(3) unsigned DEFAULT NULL,
--    `created_time` datetime DEFAULT current_timestamp(),
--    PRIMARY KEY (`id`),
--    UNIQUE KEY `author_unique` (`email`)
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


--  CREATE TABLE `post` (
--    `id` int(11) NOT NULL AUTO_INCREMENT,
--    `title` varchar(255) NOT NULL,
--    `contents` varchar(3000) DEFAULT NULL,
--    `author_id` int(11) DEFAULT NULL,
--    `created_time` datetime DEFAULT current_timestamp(),
--    PRIMARY KEY (`id`),
--    KEY `post_author_fk` (`author_id`),
--    CONSTRAINT `post_author_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
--  ) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


제약조건 default

CREATED TABLE test(
    ID INT,
    NAME VARCHAR(30) DEFAULT 'Anonymous')

시간 세팅시 가장 많이 사용
 ALTER TABLE author ADD CREATE_at DATETIME DEFAULT CURRENT_TIMESTAMP
 ALTER TABLE post ADD CREATE_at DATETIME DEFAULT CURRENT_TIMESTAMP

흐름제어

CASE 
    CASE value
    WHEN(compare_value1) THEN result1
    WHEN(compare_valu2) THEN result2...
    ELSE result3
    END

막약 어떤 벨류가 컴페얼 벨류1이면(==관계) 리져트 1을 반환하겠따.

CASE와 END로 이루어져있고, 원하는 조건내에 존재하지 않으면 ELSE문을 타고, ELSE문이 없을 경우 null을 return 
예)
SELECT ID,
CASE NAME
WHEN '홍길동'
.
.
.
END,
EMAIL FROM author,

실습
post table 에서 id, title, contents 그리고 author_id의 경우 author_type이라는 이름으로 조회
author_id가 만약 1이면 first_author, 2이면 second_author로 조회가 되도록하고 3이상 그외의 경우 etc_authors로 조회토록 하여라    
1.case when 사용
2. if문 사용하여 동일하게 출력

select *from table post CASE(id, title, contents, author_id)
select id,title,contents, author_id as author_type from post;

SELECT id, tltle , contents,
case author_id
    when 1 then 'first author'
    when 2 then 'second author'
    else 'others'
END
as author_type from post;

IF()

    IF(a,b,c)
    만약 a(조건)가 참이면 b를 반환하고 거짓이면 c를 반환합니다.
    SELECT IF(0<1, 'yes', 'no')

if null(a,b)
만약 a값이 null이 아니면a 그 자체를 반환하고, null이면 b를 반환
select id, title, contents, ifnull(author_id, 'annonymous') from post;

if 문법 사용해서 만약 id가 1이면 
select id, title, contents, if(author_id=1, 'first_author', 'others') from post;
if null의 결과값을 동일하게 if 문으로 출력하도록
select id, title, contents, author_type if null()
 select id, title, contents, if(author_id is null, 'annonymous', author_id)from post;

 문제 풀기 
 case when - 조건에 부합하는 중고고래 상태 조회하기


SELECT BOARD_ID,WRITER_ID,TITLE,PRICE,
CASE STATUS
    when 'SALE' then '판매중'
    when 'RESERVED' then '예약중'
    when 'DONE'     THEN '거래완료'
END
AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE = '2022-10-05'
order by BOARD_ID desc

트랜잭션 실습(트랜, 트란)
a쿼리
b쿼리
c쿼리
commit;
rollback;
에러가 나면 rollback
에러를 발생 rollback
정상 실행되면 commit default 


