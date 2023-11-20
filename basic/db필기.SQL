                            <3일차 DB>


# xargs는 입력받는 파일을 한줄씩 읽는것을 의미
# ls -al 을 입력 후 권한관계
# chmod, chown 
# rwx(421) read, write, execute
# vi에디터 실습
# vi에서는 항상 esc를 눌러서 명령모드로 가는 습관을 기르자

!!dbms란
    databaseManagement System 
    Mysql, mariaDB, Oracle, Postgres,MongoDB,Redls
        mongodb,redls - noSql
    이중 우리는 '관계형 데이터 베이스'에 대해 학습할예정

    mysql,mariadb,oracle

    관계형데이터베이스(RDB)
        서로 관계를 갖는 데이터들의 집합
        테이블, 행,열 등의 구조로 데이터가 구조화
        (엑셀을 프로그램화 시켰다) 


!!mariaDB

    MySQL의 포크(복사본)로 2009년에 시작되었고, MySQL의 기본적인 특성 및 구조를 그대로
    유지하면서 일부 차이점과 추가 기능을 포함

    mariaDB의 특징
        완전한 오픈소스
        지속적인 발전가능성
        무료
        뛰어난 성능 및 최적화
        mysql의 오라클 인수 이후 비 오픈소스화 됨에 따라 mysql의 자리를 대체할것으로 예상

    Oracle - 기본은 유료
    mysql - 무료, 상업용 유료
    mariadb - 오픈소스


# spring boot, aws , restapi -o
# legacy jsp - x

!!SQL문

    SQL문이란? DBMS에서 사용하는 프로그래밍 language -> SQL
    CRUD - Create, Read, Update, Delete의 의미/ 생성,조회,수정,삭제
        "CRUD"를 개발해보세요
        1. DB구축(CRUD)
        2. spring, java개발 -> 4가지
    SQL 구문도 크게 세가지로 구분
        DDL - data definition language _ 데이터베이스나 테이블 등을 생성,삭제하거나 그 '구조'를 변경
        create, alter, drop

        DML - data manipulation languae _ 데이터베이스에 저장된 '데이터'를 처리하거나 조회
        insert, update, delete, select

        DCL - data control language _사용자 권한 부여
        grant,revoke 등

!!테이블

    열
        열은 필드 또는 속성
        구체적인 속성은 컬럼의 성격 그 자체를 의미
        필드는 컬럼의 구체적인 데이터 하나하나의 개별 데이터 항목
    
    행
        튜플 또는 레코드
    
    값
        데이터라고도 칭함
    
    키
        행의 식별자로 이용되는 열
        테이블에 저장된 레코드를 고유하게 식별하는 키를 기본키(PrimaryKey)
        # pk로 지정하는순간 not null과 유니크가 적용이 된다
    
    외래 키(ForeignKey)
        외래키는 두 테이블을 서로 연결하는 데 사용되는 키
        외래키가 설정되면 post author 테이블 데이터의 생성 삭제 수정에 대해 제약이 발생한다.

!!실습
google 마리아디비 다운로드(기본 default 값으로 설치)

    윈도우는 패스를 따로 잡아줘야한다.
    내 pc - 속성 - 환경변수 - path - 편집 - C:\Program Files\MariaDB 11.3\bin -붙여넣기
    -윈도우 파워쉘에서 mariadb --version 타이핑 후 잘 되는지 확인

        윈도우 파워쉘에서
        mariadb -u root -p 입력해서 접속
        show databases;

GUI툴 설치하기

    workbench
        mysql계열에서 많이 사용
        https://dev.mysql.com/downloads/workbench/
    connention - 비밀번호 저장후 생성

    show databasses; 번개모양 ctrl +enter

게시판 데이터베이스(스키마)생성
스키마 안에 글쓴이 테이블, 글목록테이블 생성

author 테이블
autohr테이블에는 email,password,회원이름 등의정보가 있을것

스키마생성
    
    mariadb -u root -p
    create database board;
    show databases; 로 잘 만들어졌는지 확인해보기

    use board;
    
데이터베이스 삭제
    drop database board;

테이블생성*****
    작가 테이블
        id(int, pk, auto),name(varchar255),email(varchar255),password(varchar255),role(varchar50)
    글목록 테이블
        id(int.pk.auot),title(varchar255),contents(varchar255).author_id,created_at
        author_id: author테이블의 id fk

    Create Table Author

-- 데이터베이스 생성
CREATE DATABASE board;
-- 데이터베이스 선택
USE board;
-- author 테이블 신규 생성
CREATE TABLE author(
    id INT, 
    name VARCHAR(255), 
    email VARCHAR(255), 
    password VARCHAR(255), 
    test1 VARCHAR(255), 
    PRIMARY KEY (id)
);

primary key, foreign key 테이블차원에서 제한을 많이 건다.

SHOW TABLES;
-- 테이블 컬럼조회
DESCRIBE author;
-- POST 테이블 신규 생성
CREATE TABLE posts(
id INT PRIMARY KEY, 
title VARCHAR(255), 
content VARCHAR(255), 
author_id INT, 
FOREIGN KEY(author_id) REFERENCES author(id)
);



PrimaryKey를 걸게되는 칼럼에 대해서는 unique, not null 계약조건 부여

만약 not null 조건이 있다면 author_id에 없는 데이터는 post에 생성불가
author가 삭제될 때 post에 데이터가 남으면 author 삭제 불가
author의 id가 수정될때 post에 데이터가 남아있으면 author 수정 불가
삭제, 수정에 대해서는 기본적으로 제약(restric)을 갖고 있으나, 옵션을 줘서 변경가능

!!테이블, 컬럼 정보조회

    -- 테이블 컬럼상세 조회
    SHOW FULL COLUMNS FROM author;
    
    -- 테이블 생성문 조회
    SHOW CREATE TABLE posts;

    -- 참조관계 및 제약조건 정보조회
    SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_NAME = 'posts';

    인덱스 조회
        SHOW INDEX FROM 테이블명;
        제약조건 정보조회와 인덱스조회는 상당수 일치(PK,FK 제약조건은 인덱스를 생성)
        인덱스란 조회의 성능을 높이기 위한 별도 페이지라 이해하면 될 것

    -- 근데 인덱스가 뭔지 트리가 뭔지;; ㅜㅜ 
    -- ..

!!DDL-create

    테이블 생성
            
            create table 테이블이름
            (
                필드이름1필드타입1[제약조건],
                필드이름2필드타입2[제약조건]
                ...
                [테이블제약조건]
            )

!!DDL alter

    -- 테이블 정보 변경
    -- 테이블 이름 변경

            alter TABLE 테이블명 RENAME 새로운테이블명;
            alter table posts rename post;

    -- 컬럼 추가

            alter table 테이블명 add COLUMN 컬럼명 자료형 [null 또는 not null]
            alter table author add COLUMN role varchar(50)

    -- 필드 타입 변경 (modify)

            alter table author modify COLUMN name VARCHAR(100) NOT NULL

            원래 not null이 걸려있었다면?
            덮어씌워짐으로 제약조건을 사전에 확인하자


    -- 컬럼 이름변경 - content - contents

            alter table 테이블명 change column 기본컬럼명 새로운컬럼명 타입 [제약조건]
            
    -- 컬럼 삭제 

            alter table 테이블명 drop column 컬럼명.
    
    인덱스를 쓰면 왜 빨라지는 이유
인덱스의 실체를 본적이 있는건가?

-- 실습 2

-- 데이터베이스 삭제
drop database 데이터베이스명;

-- 테이블 삭제
drop table 테이블이름

테이블의 데이터만 지우고 싶을 때
delete from 테이블이름
truncate table 테이블이름 

if exists
특정 개체(베이스나 테이블)가 존재하는 경우에만 명령어를 실행
drop database 또는 TABLE IF EXISTS abc;



post 테이블의 contents 컬럼 글자수 3000으로 변경
author 테이블에 address 컬럼 varchar 255로 추가
post테이블 생성문 미리확인 - post테이블삭제 - post테이블 다시 생성


            alter table post modify COLUMN contents VARCHAR(3000)

            alter table author add COLUMN address varchar(255)  

           show create table post;
           drop table post;

            create alter 



CREATE TABLE `post` (
   `id` int(11) NOT NULL,
   `title` varchar(255) DEFAULT NULL,
   `contents` varchar(3000) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `author_id` (`author_id`),
   CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


--  insert, select****, update, delete

!!! insert

테이블에 새로운 레코드를 추가
insert into 테이블이름(필드이름1,필드이름2,필드이름3,...)values(데이터값1,데이터값2,데이터값3)
    insert into author(id, name, email) values(1,'kim','abc@naver.com');    
    -- 기본적으로 문자열은 ''로 쓰도록 하자
    select * from author 
    -- 조회하는 방법

듐났다 (duplicate) - 필수값이 하나라도 없으면 오류가 생기는것 

 author 데이터 5개 추가
 address는 데이터 넣지 말것

 post 데이터 5개 추가
 2개는 저자가 있는 데이터
 2개는 저자가 비어있는 데이터 > author_id에 not null 조건없다는 사실 확인
 1개는 저자가 author테이블에 없는 데이터 추가 > 에러 발생 확인하기

DML
insert 


update 

    테이블 레코드의 내용을 수정
    update 테이블이름 set필드이름1=데이트값1, 필드이름2=데이터값2.... where 필드이름=데이터값

    만약 where 절을 생략하면, 해당 테이블의 모든 레코드값이 위 설정대로 수정되므로 유의
        예) update author set email='abc@test.com' where id=1;
        where 을 안쓰면 전체 적용

    여기서 =의 쓰임새는 2가지
    where문 뒤에 나오는 비교문은 jave기준으로 ==로
    어떤값을 set할때도 =을 사용하여 대입(jave=과동일)


delete

    DELETE FROM author WHERE
    딜리트에 *이 필요없는 이유
        의미자체가 한 줄을 다 지우는거 *이 필요없음
    
    author 데이터중 id가 4인 데이터를 email을 abc@naver.com. name을 abc로 변경
    update author set email='abc@naver.com', name='abc' where id=4;
    post 에 글쓴적이 없는 author 데이터 1개 삭제
    
    방법1.
    delete from post where author_id=2;
    delete from author where id=2;

    방법 2.
    update post set author_id = null where author_id = 2;
    delete from author where id = 2;

    post 에 글쓴적이 있는 author 데이터 1개 삭제 > 에러 > 조치후 삭제


TRUCATE 
 delete 는 storage까지 삭제하지는 않아 복구가 가능 
 delete 는 log 를 남김
 delete의 삭제속도는 truncate보다 느림


select 
    select 필드이름 from 테이블이름 [where 조건]
    select *from author.

    select * from author where id=1 전부 다 조회
    select name,email from author where id=1 아이디1일사람 조회
    select * from author where id>1 아이디가 1보다 큰 사람 조회
    select * from author where id>1 and name = 'kim' 아이디가 1보다 크면서 이름이 kim인 사람

프로그래머스 sql 문제 풀이(SELECT,WHERE-어린동물찾기)

-4일차- db

테이블간의 관계성
author 와 post (고객테이블, 
회원을 탈퇴한다고 하면 post를 어떻게 놔둘것인가?
회원가입 - 글을 열심히 썻다 - 회원탈퇴
현재는 불가능 ( on update, on delete 와 같이 restrict옵션이 걸려있기 때문에 )
현재는 ForeignKey REFERENCES on author 외에 별다른 옵션이 적혀있지 않다.
cascade 옵션 : 따라가는것 (author을 지우면 post도 지워짐)
set null : 부모테이블이 업데이트 또는 디리트가 되면 자식테이블은 null 로 세팅을 하겠다.
null 세팅 시 (익명)

    강사님은 set null을 추천 (현실에서는 아무것도 지우지 않기때문)
    실무에서는 컬럼 하나 추가 (탈퇴여부 Y,N)
    if(탈퇴컬럼 == yes), 탈퇴한고객
    if(탈퇴컬럼 == no), 일반고객

관계성에 대한 이해도가 가장 중요하다 

주요 제약조건(PK,FK)를 걸게되면 INDEX가 자동생성
INDEX는 조회성능을 위한 목차페이지
SHOW INDEX FROM author;
MODIFY COLUMN 

SELECT * FROM author WHERE id>1 and (그리고) / or (또는) name = 'kim';
SELECT ANIMAL_ID, NAME FROM ANIMAL_INS WHERE INTAKE_CONDITION != 'Aged'


SELECT

    -- SELECT문으로 선택한 결과를 ORDER BY 컬럼명
    SELECT * FROM author ORDER BY name desc
    -- 기본 default 값은 오름차순이나 DESC를 쓸 경우 내림차순으로 조회를 한다.
    -- 여러 필드의 데이터를 쉼표를 사용하여 여러기준으로 정렬할 수도 있다.
    -- ORDER BY 생량시 PK를 기준으로 오름차순 정렬하여 결과값 반환
    SELECT * FROM AUTHOR LIMIT number : 반환할 행의 최대 수를 지정 (옛날 데이터는 의미가 없어서 리밋을 걸어 최신데이터의 부분만 보는것 )
        SELECT * FROM AUTHOR ORDER BY ID DESC LIMIT 2 (역으로 한번 뒤집고 숫자로 갯수 제한)
    -- 별칭을 이용한 처리 (alias)
    --     테이블과 필드에 임의로 별칭을 부여하고 해당 별칭을 SELECT문에서 사용
    --     SELECT 필드이름 AS 별칭 FROM 테이블이름;
    --     SELECT 필드이름 FROM 테이블이름 AS 별칭;
                프로그래머스 sql 문제 풀이SELECT, ORDER BY - 역순 정렬하기

    SELECT * FROM author ORDER BY name ASC, email DESC;(desc, abc 생략 시 asc 적용)

--  alias 를 이용한 select 문

    select name as 이름 from author; 
    -- as는 생략이 가능하다 
    select name , email from author as a;

-- 게시판 회원은 총 5명이 되도록 만들고, 게시판에 실명으로 글이 쓰여진 게시글은 총 3건, 익명으로 글이 쓰여진 글은 총 2건이 있도록 데이터 insert

-- 게시판의 회원을 모두 delete하되, 기존에 posting 된 글은 삭제되지 않고 남아있도록 하여라
-- where author_id != null

-- post의 글을 3개만 조회하되, title을 기준으로 오름차순하고 만약 제목이 같은경우 contents로 오름차순이 되도록 조회

insert into author( id, name ) values( 1,'jo');
insert into author( id, name ) values( 2,'jo');
insert into author( id, name ) values( 3,'jo');
insert into author( id, name ) values( 4,'jo');
insert into author( id, name ) values( 5,'jo');

insert into post(id, title, contents, author_id) values(1, '오늘은데이터', 'johoon2 is...', 2)
insert into post(id, title, contents, author_id) values(2, '오늘은데이터2', 'johoon2 is...', 2)
insert into post(id, title, contents, author_id) values(3, '오늘은데이터3', 'johoon2 is...', 1)
insert into post(id, title, contents) values(4, '오늘은데이터4', 'johoon2 is...', 4)
insert into post(id, title, contents) values(5, '오늘은데이터5', 'johoon2 is...', 5)

update post set author_id = null where author_id =! null;
delete from author;
select*from post order by title asc, contents desc limit 3;



타입 - 숫자

    테이블의 타입 확인
        DESCRIBE 테이블명,

        숫자 타입
            정수
                TINYINT
                    -128~127 범위, 1바이트(8bit) 2^8 = 256
                    JAVA의 BYTE와 매핑
                    ex) age
                INT
                    4바이트
                    JAVA의 INT타입과 매핑
                BIGINT - 
                -- int는 너무 작기때문에 대부분 bigint로 잡기도 한다
                -- 하지만 함부로 정할 수는 없다. 왜냐면 1row당 4바이트의 낭비가 있다고 한다면 어마어마한 낭비이다.
                -- 몇십억의 데이터가 있다면 ... 몇십억 * 4bite ... !!!??
                    8바이트
                    JAVA의 LONG타입과 매핑
                UNSIGNED 타입을 사용하여 양수만 표현가능
                    표현값 2배로 증가
                    TINYINT UNSIGNED 이렇게 사용한다면 255까지 사용가능 EX)나이
                    ex) age TINYINT UNSIGNED 
실수
    부동 소수점 타입  
        FLOAT, DOUBLE
        오차가 발생할 여지가 있음

    고정 소수점 타입    
        DECIMAL(M,D)
            JAVA의 Bigdecimal
            M은 총자릿수 (정수부+소수부)를 의미하고 65자리까지 표현가능
            D는 소수부 의미
            정확한 숫자 표현을 위해 사용 
            -- 그런 이유로 DECIMAL 을 많이 쓴다. 
        create table post (price DECIMAL(10,3)

[{z}]


실습

    author 테이블에 age 데이터 tinyint unsigned로 추가
        255이하로 insert, 255초과로 insert 테스트

-- alter table author add COLUMN age varchar(50)
-- insert into author(age) values(200); 

    post에 price라는 원고료컬럼을 추가. 원고료 컬럼은 총자릿수 10자리 및 소수점단위는 3자리까지 가능.

-- alter table post add column price DECIMAL(10,3);

        컬럼 추가 후 비어있는 컬럼에 숫자 update test. (소수점 3이하 test, 소숫점 3초과 테스트)

update post set price=1000.5 where id=1;
update post set price=1000.555 where id=2;
update post set price=1000.55555 where id=3;


문자타입

    char(m) <- varchar을 주로 씀
        m은 문자열의 최대 길이를 의미
        고정 길이의 문자열(0~255까지 설정가능)
        정해진 자릿수 문자에 제한을 두기 위해서는 사용

        예를 들어 char(255)라고 하면 10바이트만 넣더라도 255바이트 차지

    varchar(255)
        java의 string 사용시 varchar
        0부터 65,535까지 설정가능
        가변 길이의 문자열(M을 통해 길이지정)
        길이를 지정하더라도 실제 입력된 문자열의 길이만큼만 저장하고 사용
        일반적으로 가장 많이 사용
        예를 들어 varchar(255)라고 하면 10바이트를 넣으면 10바이트 차지

    text
        가변 길이 문자열
        text 65,535바이트까지 저장 가능한 일반적인 문자열을 위한 타입 name TEXT
        varchar보다 더 큰 범위의 표현이 가능 예)LONGTEXT 는 4GB
        disk에 저장해서 조회속도가 varchar에 비해 느림
        INDEX사용의 어려움(B-tree인덱싱 불가, full-text인덱스 가능)
    
create table table_blob(id int, myimg longblob);
insert into table_blob(id,myimg) values(1,load_file("C:\Users\Playdata\Desktop\test_picture.jpg"));
select hex(mying) from table_blob where id=1;

-- 어떤 값이던지 이진법의 조합으로 변환해서 블럭데이터로 넣을 수도 있다.
이미지로 변환하려면 각 프레임워크에 바이너리데이터 변환하는 기능이 있음.

role 타입 enum타입으로 변경하고
'user','admin'으로 enum타입 지정. not null default
입력이 없을시 'user'로 세팅되도록 디포트 설정
-- 지역코드, 도서코드, 제품코드 

dml test
admin으로 데이터 세팅후 인서트
insert into author(id, name, role) values (3, 'admin', 'admin');
-- 들어가는것을 확인 가능하다.
super-user 데이터로 인서트
-- 듐이 나는것을 확인 할 수 있다.
롤 데이터 없이 인서트
-- not null default
-- 입력이 없을시 'user'로 세팅되도록 디포트 설정


admin으로 데이터 설정 후

enum타입 ******
    미리 들어갈 수 있는 특정 데이터의 값을 지정
    컬럼명 enum('데이터값1',,,....)
    not null default 'user' 등의 옵션도 추가 가능
    -- not null로 하는데 만약에 비어있으면 user로 넣어주게땅

    예)
    role enum('admin','user'...)
    gendel enum('male','female'...)

alter문은 not null 로 하는데 null이 있으면 말이 x
user로 업데이트 하면 됨.
update author set role='user'
alter table author modify column role enum('user','admin') not null dafult 'user';

타입 

time
date
    날짜를 저장할 수 있는 타입yyyy-mm-DD
datetime(m)
    날짜와 함께 시간까지 저장, m지정시 소수점 microseconds
    yyyy-mm-dd hh:mm:ss 
    가장많이 사용
    jave의 localdatetime과 sync

datetime default current_timestamp
    현재시간을 default로 삽입하는 형식d

    utc = kst -9
    kst

-- db는 UTC로 놔두어도 상관없다.

실습 

post 에 datetime으로 created_time 컬럼 추가 및 디포트로
현재시간 들어가도록 설정
datetime(6) default current_timestamp
컬럼 추가 후 insert 테스트


alter table post add COLUMN created_time datetime default current_timestamp;

insert 

비교 연산자

= select * from post where id !=1;

!= (not equal) , <>
select * from abc where name !='johoon' 
-- != 또는 <>

<, <=,>,>=
-- =은 항상 오른쪽에!!!!!!

is null, is not null

between min and max
    피연산자의 값이 min 크거나 max 보다 작으면 참을 반환함(이상, 이하)

in(), not in() ********외우기
-- id in(1,2,3)에 1,2,3 이 있으면 다 나와

프로그래머스 sql 문제풀이 (비교연산자(is null))-나이 정보가 없는 회원 수 구하기

논리연산자

A AND B 
    &&도 가능
    SELECT * FROM author where name ="조훈" AND "30";

OR
    ||
    SELECT * FROM author WHERE name = "조훈" OR "30";

NOT
    !
    SELECT * FROM author WHERE name =! "조훈"

실습

author 테이블의 id가 1,2,4가 아닌 데이터 조회 (not in사용)
select * from author where id not in (1,2,4);
post테이블의 id가 2~4까지 데이터 조회
    between활용
    select * from post where id between 2 and 4;
    and조건 활용
    select * from post where id = 2 and id =4;(2이기도하면서 4이여야 함)
    or 조건 활용
    select * from post where id = 2 or id =4;


검색 패턴

    like 
        특정 패턴의 문자열을 찾기위한 키워드로 사용이 됨
        일반적으로 퍼센트오아 함께 사용
        select *from author where name like '조%' 조로 시작하는
        select * from author where name like '%훈' 훈으로 끝나는
        select * from author where name like '%훈%' 문자사이에 훈이라는것
    not like


    REGEXP
        정규표현식을 토대로 패턴 연산 수행
        특정한 문자 패턴을 약속한것 개발자와 시스템간에 
        알파벳으로 이루어진 이름만을 조회하고 싶을때는
        SELECT * FROM author WHERE name REGEXP '[a-z]'
        a-z까지 들어있으면 참이 된다.
        [회원가입시]
    
    not REGEXP  ** 자바에서 본격적으로 

    select * from author where name like 'j%'
    select * from author where name like '%o%'
    select * from author where name like '%n'

    타입변환

        CAST 
            CAST(a AS type) tyle에는 여러 타입이 들어간다 VARCHAR, INT, TINYINT등 
            a값을 type으로 변환
            보통 정수 값을 date타입으로 변환하는데 사용
            select cast(20200101 AS DATE); 
            -- =>2020-01-01

        CONVERT
            문자열을 날짜/시간으로 변환하는데 사용
            CONVERT('20200101',DATE); => 2020-01-01
        
        DATE_FORMAT
            DATE_FORMAT 함수는 날짜/시간 타입의 데이터를 지정된 형식의 문자열로 변환
            가장 많이 사용
            DATE_FORMAT(date, format)
                SELECT DATE_FORMAT('20200-01-01 17:12:00','%Y-%m-%d'); = 2020-01-01

                조건에 맞는 도서 리스트 출력

select * from post;