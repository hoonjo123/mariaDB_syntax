    
            JOIN

-- INNER JOIN
select * from author a inner join post p on a.id = p.author_id;

-- author = author_id 
-- 글쓴 사람만 찾고 익명은 버린다.

- SELECT * FROM tableA INNER JOIN tableB ON tableA.ID = tableB.A_ID
- SELECT * FROM tableA AS a INNER JOIN tableB AS b on a.ID = b.a_id;

select * from author a inner join post p on a.id = p.author_id;
select * from author as a inner join post as p on a.id = p.author_id;
*에는 a.name, a.age, p.


SELECT * FROM author as a LEFT JOIN post as b ON a.id = b.author_id;

author 테이블과 post 테이블 join 

    SELECT name,title FROM author alias a left join post alias p on a.id = b.author_id where table.author = (name,title);
    SELECt  FROM author a left join post p on a.id = p.author_id;
    SELECT  FROM author 

    SELECT a.name as name, p.title as title from author as a inner join post as p on a.id=p.author_id
    -- author 테이블과 post 테이블을 join 하여, 글을 작성한 모든 저자의 이름과 해당 글의 제목을 조회하시오. author as a, post as p

    select a.name, p.title from author a left join post p on a.id = p.author_id
    -- author 테이블을 기준으로 post테이블과 join하여 모든 저자의 이름과 해당 저자가 작성한 글의 제목을 조회하시오. 글을 작성하지 않은 경우 글 제목은 null로 표시

    select a.name, p.title from author a left join post p on a.id = p.author_id where a.age >=25
    -- 위 예제와 동일하게 모든 저자의 이름과 해당 저자가 작성한 글의 제목을 조회. 단, 저자의 나이가 25세 이상인 저자만 조회.

    프로그래머스 문제 풀기
    left join - 없어진 기록 찾기
    inner join - 조건에 맞는 도서와 저자 리스트 출력하기

  INNER JOIN

  -- 코드를 입력하세요
SELECT
A.BOOK_ID,
B.AUTHOR_NAME, 
DATE_FORMAT(A.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK AS A 
INNER JOIN AUTHOR AS B 
ON A.AUTHOR_ID = B.AUTHOR_ID
WHERE CATEGORY ='경제'
ORDER BY PUBLISHED_DATE;

위 구문을 LEFT JOIN 으로 바꿔보자 


FROM BOOK AS A LEFT JOIN 
    LEFT JOIN



SELECT * FROM author INNER JOIN post = 결과 1
SELECT * FROM author left join post = 


SELECT FROM OUT WHERE ANIMAL_ID NOT IN ( OUT과 IN의 INNER조인한 다음 ID값)

SELECT ANIMAL_ID, NAME FROM ANIMAL_OUTS
WHERE ANIMAL_ID NOT IN(
SELECT AO.ANIMAL_ID FROM ANIMAL_OUTS AO INNER JOIN ANIMAL_INS AI
ON AO.ANIMAL_ID = AI.ANIMAL_ID
) ORDER BY ANIMAL_ID;

INNER JOIN 으로 한 경우

SELECT ANIMAL_ID, NAME FROM ANIMAL_OUTS A0
LEFT JOIN ANIMAL_INS AI
ON AO.ANIMAL_ID = AI.ANIMAL_ID
WHERE AI.ANIMAL_ID IS NULL
ORDER BY ANIMAL_ID

LEFT JOIN 으로 한 경우


유니온 실습

A 테이블의 조회 결과 UNION B 테이블의 조회결과
SELECT 컬럼1, 컬럼2 FROM TABLE1 UNION SELECT 컬럼1, 컬럼2 FROM TABLE2;

SELECT NAME, EMAIL FROM AUTHOR UNION SELECT TITLE, CONTENT FROM POST;


서브쿼리

그룹바이

- COUNT() : 행의 개수를 세어줌
    select count(*) from post;
- AVG() : 행 안에 있는 값의 평균을 내어줌
- MIN() : 행 안에 있는 값의 최솟값을 반환해줌
- MAX() : 행 안에 있는 값의 최댓값을 반환해줌
- SUM() : 행 안에 있는 값의 합을 내어줌

 Q. post / price에 적절한 값을 넣어놓고, 
    AVG, MIN, Max, sum

SELECT COUNT(PRICE) FROM POST;
SELECT AVG(PRICE) FROM POST;
SELECT MIN(PRICE) FROM POST;
SELECT MAX(PRICE) FROM POST;
SELECT SUM(PRICE) FROM POST;

SELECT AVG(score) AS average_score FROM post;

-- AUTHOR ID를 그룹으로 묶어서 작가마다 평균을 구해보자
SELECT 컬럼명 FROM 테이블명 GROUP BY 컬럼명 
GROUP BY AUTHOR_ID
1)작가 아이디 별로 몇개의 글을 썼는지 SELECT
2)PRICE 출력해보기 
SELECT AUTHOR_ID, SUM(PRICE) FROM POST GROUP BY AUTHOR_ID;

세일즈를 왜 쓰는거지?
AUTHOR_ID 별 COUNT 값
AUTHOR_ID 별 PRICE SUM, AVG

SELECT AUTHOR_ID, COUNT(*) FROM POST GROUP BY AUTHOR_ID;
SELECT AUTHOR_ID, SUM(PRICE) FROM POST GROUP BY AUTHOR_ID;
SELECT AUTHOR_ID, AVG(PRICE) FROM POST GROUP BY AUTOHR_ID;

1)REGION 별로 SALES 평균값을 구하시오. 단, 건별로 300달러 이상인 데이터만 평균을 내서 출력하시오/
  REGION 별로 SALES 평균값을 구하되 평균값이 300달러 이상건만 출력하시오.

2)AUTHOR_ID별로 PRICE 평균값을 구하시오. 단, 건별로 2000원 이상인 데이터만 평균을 내서 출력하시오. => WHERE 사용
    SELECT AUTHOR_ID, AVG(PRICE) FROM POST GROUP BY AUTHOR_ID WHERE PRICE >=2000;
  
    -- 강사님 - SELECT AUTHOR_ID, AVG(PRICE) FROM POST WHERE PRICE >= 2000 GROUP BY AUTHOR_ID
    
    SELECT AUTHOR_ID, AVG(PRICE)FROM your_table_name WHERE PRICE >= 2000 GROUP BY AUTHOR_ID;
  AUTHOR_ID별로 PRICE 평균값을 구하되 평균값이 2000원 이상건만 출력하시오. 
    select author_id, AVG(PRICE) as AVG from post group by author_id having AVG(PRICE) > 2000;
    -- SELECT AUTHOR_ID, AVG(PRICE) FROM POST GROUP BY AUTHOR_ID HAVING AVG(PRICE) >=2000;
1)+2) =    SELECT AUTHOR_ID, AVG(PRICE) FROM POST WHERE PRICE >= GROUP BY AUTHOR_ID HAVING AVG(PRICE) >=2000;


셀프조인왜글해오
SELF FROM JOIN WHERE GROUP BY HAVING ORDERBY

입양시간 구하기 

-- 코드를 입력하세요
SELECT
    HOUR(DATETIME) AS HOUR,
    COUNT(*) AS COUNT
FROM ANIMAL_OUTS
WHERE HOUR(DATETIME) BETWEEN 9 AND 19
GROUP BY HOUR
ORDER BY HOUR;


SELECT DATE_FORMAT(DATETIME, '%H') as HOUR, COUNT(*) AS COUNT from ANIMAL_OUTS AO
WHERE DATE_FORMAT(DATETIME, '%H:%i') between '09:00' and '19:59'
GROUP BY HOUR;

성분으로 구분한 아이스크림 총 주문량


SELECT A.INGREDIENT_TYPE, 
SUM(B.TOTAL_ORDER) AS TOTAL_ORDER FROM FIRST_HALF AS B
INNER JOIN ICECREAM_INFO AS A ON A.FLAVOR = B.FLAVOR
GROUP BY A.INGREDIENT_TYPE;

1:1 유저상세테이블

유저 - 유저상세테이블

자동차 종류 별 특정 옵션 
SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE

재구매가 일어난 상품과 회원 리스트 구하기

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) > 1
ORDER BY 1 ASC, PRODUCT_ID DESC
;

입양 시간 구하기 1

SELECT *,0 FROM AUTHOR;
 SELECT 1 AS HOUR, 0 AS COUNT
   UNION SELECT 2,0;

재귀가 뭐..뭔가요?

    SELECT 0 AS HOUR, 0 AS COUNT
   UNION SELECT 2,0
    UNION SELECT 3,0
    UNION SELECT 4,0
    UNION SELECT 5,0
     UNION SELECT 6,0
      UNION SELECT 7,3
       UNION SELECT 8,1
        UNION SELECT 9,1
         UNION SELECT 10,2
          UNION SELECT 11,13
           UNION SELECT 12,10
            UNION SELECT 13,14
             UNION SELECT 14,9
              UNION SELECT 15,7
               UNION SELECT 16,10
UNION SELECT 17,12 UNION SELECT 18,16 UNION SELECT 19,2 UNION SELECT 20,0
UNION SELECT 21,0 UNION SELECT 22,0 UNION SELECT 23,0;


WITH RECURSIVE NUMBER_sequence(HOUR) AS (
select 0 
union all 
select hour + 1 from number_sequence where hour <23 
)
select hour, 0 as count from number_sequence;


