전날 배운 내용 복습

    index 를 걸면 조회성능은 높아지지만 삽입, 수정 성능은 떨어진다
    카디넬리티가 높은 곳에 index 를 걸어야한다

    카디널리티(Cardinality)는 특정 데이터 집합의 유니크(Unique)한 값의 개수이다. 즉, 중복도가 '낮으면' 카디널리티가 '높다'고 표현한다. 반대로 중복도가 '높으면' 카디널리티가 '낮다'고 표현한다.


    https://velog.io/@d3fau1t/%EC%9D%B8%EB%8D%B1%EC%8A%A4%EC%99%80-%EC%B9%B4%EB%94%94%EB%84%90%EB%A6%AC%ED%8B%B0


    단일 컬럼 index : CREATE INDEX index_name ON 테이블명(컬럼명);
   create index author_name on author(name);

        select * from author where name = 'johoon'
    복합 컬럼 index : CREATE INDEX index_name ON 테이블명(컬럼1, 컬럼2);
   create index jo_hoon on author(name, email);
        select * from author where name = 'johoon' and email = 'johoon030@gmail.com'
        
                사용자관리

    가상의 테이블 author_viewing
    name                email  --컬럼이 있다고 가정해보자

    marketing_user 계정을 만들고
    author_viewing 테이블에 대한 권한을 주면된다.

    - 신규 사용자 생성
    - CREATE USER 'testuser'@'localhost' IDENTIFIED BY ‘testpw’;
    -- IDENTIFIED 는 password지정하는것
    -- 실무에서는 원격으로 하는 경우가 있을 수도 있기에 localhost 대신 %를 사용하는게 좋다


    -- 사용자 목록조회
    select * from mysql.user;

    SELECT User, Host FROM mysql.user;
    
    -- 사용자 권한 조회
    
        -- 실습 
    show grants for 'hooni'@'localhost';
    CREATE USER 'hooni'@'localhost' IDENTIFIED BY '12345' ;
    GRANT select ON board.author TO 'hooni'@'localhost';
    flush privileges;
    -- flush 는 권한 부여한 것에 대해 확정하는것
    -- revoke insert on board.author from 'hooni'@'localhost';
    -- 권한을 빼는거

                 "view"

    -- 가상의 테이블로서 실제 데이터를 저장하지 않는 데이터베이스, 실제 데이터베이스를 참조만


--     CREATE VIEW 뷰이름 AS
-- SELECT 필드이름1, 필드이름2, ...
-- FROM 테이블이름
-- WHERE 조건

--     -- 특징
    
    -- 복잡한 쿼리 결과를 뷰로 생성해두면, 이후에는 뷰를 간단한 쿼리로 호출
    -- 뷰를 사용하여 특정 사용자에게 테이블의 일부 데이터만을 보여주는 것이 가능
    --     grant를 통해 뷰에 대한 권한만을 부여
    --     GRANT SELECT ON [데이터베이스 이름] [뷰이름] to 'testuser'@'localhost'
    --     flush privileges
    -- 뷰를 사용하면 필요한 컬럼만 선택해서 보여줄 수 있음.

    create view jjang_gu as select * from author;
create view author_for_view as select name, email from author;
-- 나머지 정보들은 개인정보라고 가정햇을때에 name과 email만 조회를 해보자  

            "프로시저"


저장 프로시저 
쉽게 말해 자주사용하는 절차를 저장해두는것?

grant execute on procedure 데이터베이스명. 프로시저명 to 'testuser'@'localhost'


프로시저 기본 문법
    delimiter //
    create procedure procedure_name(parameters)
    begin
    --sql문법
    end //
    delimiter;


    CREATE PROCEDURE getUser(in userid INT)
    BEGIN
    SELECT
        where id = userid
    END




호출시

    call 프로시저명();

    파라미터는 생략가능하고, 함수와 같이 파라미터를 전달하여 실행하는것도 가능
    기본형식은 in 변수명 변수타입

    mysql> DELIMITER $$ 
mysql> CREATE PROCEDURE insert_test() 
    -> BEGIN 
    -> DECLARE i INT; 
    -> SET i = 0; 
    -> WHILE i < 100000 DO 
    -> INSERT INTO account(createDatetime) VALUES(now()); 
    -> SET i = i + 1; 
    -> END WHILE; 
    -> END $$
mysql> DELIMITER ;

DELIMITER //
CREATE PROCEDURE getUser(in My_mariaDB INT)
BEGIN
SELECT * FROM author;
END //
DELIMITER ;

grant execute on procedure 데이터베이스명 프로시저명 to 'testuser'@'localhost'


실습 2
post 테이블에 쉽게 insert 할 수 있는 post 관련 프로시저 생성
사용자에게 title, contents, author_id 만 입력받아 insert하는 insert문 생성

-- DELIMITER //
-- CREATE PROCEDURE easyinsert(in My_mariaDB INT)
-- BEGIN
-- INSERT INTO post(title, contents, author_id) values();
-- END // 
-- DELIMITER ;


DELIMITER //
CREATE PROCEDURE easyinsert(in title INT,
in contents VARCHAR(255),
in author_id tinyint
)
BEGIN
INSERT INTO post(title, contents, author_id) values(IN_title, IN_contents, IN_author_id);
END // 
DELIMITER ;

-- 파라미터를 불러오는거니까 ()안에 in 변수명 변수타입 을 써주도록 하자 

변수 선언
    DECLARE 변수명 변수타입 [DEFAULT default_value];
    반드시 프로시저나 함수의 본문 시작 부분, 즉 begin 바로 밑에 위치
변수 수정
    SET 변수명 = 수정할값;
    -- set a = a+1
제어문
    if문
    
        declare abc int default 0
        select 컬럼명 into 변수
        if 조건식 then
            -조건이 참일 때 실행할 명령
        else   
            -조건이 거짓일 때 실행할 명령
        end if;
        select 컬럼명 into 변수 문과 함께 많이 사용
    while문
        while 조건식 do
            조건이 참일 동안 반복 실행할 명령
        end while.

                                    declare a int default 0;
                                    while a<10 do
                                        select "hello world";

                                    end while;


                                declare abc int default 0
                                select 컬럼명 into 변수
                                if abc>1000 then


                author 테이블에 while 문을 활용하여 데이터 대량 insert 100번

                
-- delimiter //
-- create procedure controlcv(in author_id int)
-- begin
-- declare a int default 0;
-- while a<10 do
-- select "hello world";
-- end while;

DELIMITER //
CREATE PROCEDURE CONTROLCV(IN HOON INT)
BEGIN
DECLARE J INT DEFAULT 0;
WHILE J < 100 DO
INSERT INTO POST(AUTHOR_ID,TITLE) VALUES (HOON, CONCAT("HELLOWOLRD", J));
SET J = J+1 ;
END WHILE;
END //
DELIMITER ;

CALL CONTROLCV(1);




실습 3

call my_procedure(1)

post테이블에 if문 활용하여 고액 원고료 작가 조회
1000원

"고객 원고료 작가입니당"
"고객 원고료 작가가 아닙니다."


DELIMITER //
create procedure post_price_check(in a_id int)
begin 
    declare avg_price int default 0;
    select avg(price) into avg_price from post where author_id = a_id;
    if avg_price > 1000
    then
        select "고객 원고료 작가입니다." as message;
    else
        select "고객 원고료 작가가 아닙니다" as message;
    end if;
end //
delimiter ;

call post_price_check(2);


while 문에서 set이 어떻게 사용이 될깡?

author 테이블에 while 문을 활용하여 데이터 대량 insert 
100번 



AUTHOR id - pk, auto x
post id - pk, auto o, author_id fk 


dump

mysqldump -u [username] -p [password] [database_name] > dumpfile.sql
mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql


mysql -u root -p board < dumpfile.sql


실습 

schema 데이터를 sql형식으로 추출하는것

리눅스에 DB구축
github에서 소스코드 clone 
해당 폴더로 이동하여 덤프 복원 명령어 실행
mysql-u root -p databasename <dumpfile.sql

위 절차 script화 하여 github에 정리

