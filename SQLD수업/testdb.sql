select * from student; --내부적으로 자동으로 대문자로 변환 됨
SELECT * FROM STUDENT;

create table member_tbl_11(
m_id varchar2(5) not null primary key ,
m_pw varchar2(5) ,
m_name varchar2(10) ,
m_tel varchar2(13) ,
m_birthday date ,
m_point number(6) ,
m_grade varchar2(2) 
);
commit;
insert into member_tbl_11 values ('m100' , '1234' , '성기훈', '010-1111-2222' , '2004-01-01' , 100, '01');
insert into member_tbl_11 values ('m101' , '4444' , '김상우', '010-2222-3333' , '2004-01-01' , 1500, '01');
insert into member_tbl_11 values ('m102' , '5555' , '김일남', '010-3333-4444' , '2004-12-10' , 2000, '02');
insert into member_tbl_11 values ('m103' , '6666' , '이준호', '010-4444-5555' , '2004-04-10' , 1900, '02');
insert into member_tbl_11 values ('m104' , '7777' , '김새벽', '010-5555-6666' , '2004-09-12' , 3000, '03');
insert into member_tbl_11 values ('m105' , '8888' , '최덕수', '010-6666-7777' , '2004-08-10' , 4800, '03');
insert into member_tbl_11 values ('m106' , '9999' , '이알리', '010-7777-8888' , '2004-07-10' , 2900, '01');
insert into member_tbl_11 values ('m107' , '0101' , '김미녀', '010-8888-9999' , '2004-06-09' , 1200, '01');
insert into member_tbl_11 values ('m108' , '0404' , '이정재', '010-9999-8888' , '2004-05-19' , 3000, '03');
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday) 
values ('m109' , '0448' , '박해수', '010-7878-1111' , '2004-11-27' );
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday) 
values ('m110' , '4848' , '위하준', '010-8888-9090' , '2004-11-09');
commit;

SELECT * FROM member_tbl_11;

create table  acorntbl  (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10),
    point number(6) , 
    birthday date    
);
--데이터베이스 문자열 '' 사용함 !! 중요***********
--데이터조작시 추가(INSERT), 변경(UPDATE) , 삭제(DELETE)시 COMMIT 필수!
insert into acorntbl(id, pw, name, point, birthday)  values('rjsgml350', '1224', '김건희' ,10000 , '2002-10-10'); 
insert into acorntbl(id, pw, name, point, birthday)  values('HIHI', '0401', '장해든' ,1004 , '2004-04-01');
insert into acorntbl(id, pw, name, point, birthday) values('jcj', '1234', '정철진' ,1000 , '2002-01-25');
insert into acorntbl(id, pw, name, point, birthday)  values('ydh', '1234', '여도현' ,100 , '2000-01-24');
insert into acorntbl(id, pw, name, point, birthday)  values('sone919', '1234', '황스일' ,100 , '2002-09-19');
insert into acorntbl(id, pw, name, point, birthday) values('jaemin','0320','김재민',9000,'2002-03-20');
insert into acorntbl(id, pw, name, point, birthday) values('dkwls', '0830', '조아진', 1000, '2000-08-30');
COMMIT;

--데이터 조히ㅗ하기 SELECT (PEAD)
SELECT * FROM acorntbl;

--데이터 조회하기 컬럼지정하기
SELECT ID, NAME , POINT FROM acorntbl;

--데이터 조회하기 모든 컬럼
SELECT * FROM acorntbl;

--테이블의 명세 확인하기(컬럼정보)
DESC ACORNTBL;

--연결연산자 사용하기 || (연결연산자) (컬럼을 하나로 합치기)
SELECT ID , NAME, PW FROM ACORNTBL;
SELECT ID || NAME, PW FROM ACORNTBL;

--조회하기 -정렬하기
SELECT * 
FROM ACORNTBL
ORDER BY POINT; --오름차순 정렬 기본

SELECT * 
FROM ACORNTBL
ORDER BY POINT DESC; --오름차순 정렬 기본

SELECT ID,PW,NAME
FROM ACORNTBL
ORDER BY 3 DESC; --정렬시 순번사용

--조건절 추가히기(WHERE)
SELECT * FROM ACORNTBL WHERE POINT >= 2000;
SELECT * FROM acorntbl WHERE NAME = '장해든'; --같다
SELECT * FROM acorntbl WHERE NAME != '장해든'; --같지않다
--BETWWN A AND B : A와 B 사이의 값 ( A,B값 포함함, A: 작은값, B: 큰값)
SELECT * FROM acorntbl WHERE POINT BETWEEN 5000 AND 10000;

-- A AND B
-- 고객등급이 01이고 포인트가 1500이상인 회원 조회하기
SELECT * FROM member_tbl_11 WHERE M_GRADE = '01' AND M_POINT >= 1500;

--A OR B 
-- 고객등급이 01이거나 포인트가 1500이상인 회원 조회하기
SELECT * FROM MEMBER_TBL_11 WHERE M_GRADE = '01' OR m_point >=2000;

--IN(A,B,C)
SELECT * FROM MEMBER_TBL_11 WHERE M_GRADE IN('01', '02');

--NOT IN(A,B,C) : 괄호안에 포함되지 않는것만 나오기
SELECT * FROM MEMBER_TBL_11 WHERE M_GRADE NOT IN('01', '02');

--IS NULL
--IS NOT NULL
SELECT * FROM MEMBER_TBL_11;

--NULL의 의미 : 아직 값이 결정되지 않은 상태 : 미정의 값
--문제내기 : NULL +100 => 결과예상??
--NULL 처리하기( NULL과 같으니, 같지않니는 = , !=연산자 사용 불가!!)
--IS NULL, IS NOT NULL을 사용해야한다 !!

--POINT가 NULL인 사람 조회하기
SELECT * FROM MEMBER_TBL_11 WHERE M_POINT IS NULL;
--POINT가 NULL인 아닌 사람 조회하기
SELECT * FROM MEMBER_TBL_11 WHERE M_POINT IS NOT NULL;

--NULL +100 -> NULL 확인하기
SELECT M_ID, M_NAME, M_POINT,M_POINT +100 FROM MEMBER_TBL_11;

--조회시 컬럼 별칭 사용하기
--컬럼명뒤에 AS 사용(생략가능)
--별칭 사용시 공백 도는 소문자 작성할 때는 쌍따옴표 이용
SELECT M_ID AS ID, M_PW, M_NAME "pw a" FROM member_tbl_11;

--deistinct 키워드 사용하기 
--중복된 값 제거하고 조회하기
SELECT * FROM MEMBER_TBL_11;

--고객등급 조회하기
SELECT * FROM MEMBER_TBL_11;
SELECT M_GRADE FROM MEMBER_TBL_11;
SELECT DISTINCT M_GRADE FROM MEMBER_TBL_11;

-- 생일 2004/4/10 이후만 사람 조회하기
-- 날짜데이타 '' 사용, >,<, >= 사용하면 됨
SELECT * FROM MEMBER_TBL_11;
SELECT * FROM MEMBER_TBL_11 WHERE M_BIRTHDAY > '2004-04-10';

--데이터조회하기 SELECT
-- SELECT 컬럼명
-- FROM 테이블명
-- WHERE 조건
-- ORDER BY 컬럼명 또는 순서 (오름차순) DESC


--SQL문제첫번째
--1. 모든 정보조회 (* : 모든컬럼)
SELECT * FROM MEMBER_TBL_11;

--2. 모든 고객의 이름과 생일 정보 조회하시오
SELECT M_NAME, m_birthday FROM MEMBER_TBL_11;

--3. 이름이 박해수인 고객아이디, 생일, 포인트 정보 조회하시오
SELECT M_ID,M_BIRTHDAY, M_POINT FROM MEMBER_TBL_11 WHERE M_NAME = '박해수';

--4. 포인트가 2000점 이상인 고객이름, 전화번호 정보 조회하시오
SELECT M_NAME, M_TEL FROM member_tbl_11 WHERE M_POINT>=2000;

--5. 포인트가 2000점에서 3000점 사이의 고객이름, 전화번호 정보 조회하시오
SELECT M_NAME, M_TEL FROM MEMBER_TBL_11 WHERE M_POINT >= 2000 AND M_POINT <= 3000;

--6. 고객등급이 ‘01’인 고객이름, 전화번호 , 포인트 정보 조회하시오
SELECT M_NAME, M_TEL, M_POINT FROM MEMBER_TBL_11 WHERE M_GRADE = '01';

--7. 생일이 2004-06-01 이후인 고객이름 전화번호 정보 조회하시오
SELECT M_NAME, M_TEL FROM MEMBER_TBL_11 WHERE M_BIRTHDAY >= '2004-06-01';

--8. 생일이 2004-05-01이전에 태어난 고객의 고객이름 , 생일 정보 조회하시오
SELECT M_NAME, M_TEL FROM MEMBER_TBL_11 WHERE M_BIRTHDAY < '2004-05-01';

--9. 고객등급이 ‘01’이 아닌 고객의 고객이름, 전화번호, 고객등급 정보 조회하시오
SELECT m_name, m_tel, m_grade FROM member_tbl_11 WHERE m_grade != '01';

--10. 고객 등급이 ‘02’ 인 고객의 고객아이디, 이름, 전화번호 정보 조회하시오
SELECT M_ID, M_NAME, M_TEL FROM MEMBER_TBL_11 WHERE M_GRADE ='02';

--11. 포인트가 1500점 미만인 고객의 고객이름, 전화번호 조회하시오
SELECT M_NAME, M_TEL FROM MEMBER_TBL_11 WHERE M_POINT <= '1500';

--12. 포인트가 적립되지 않은 고객정보 조회하시오( 포인트가 NULL인 고객 조회: 포인트가 입력되지 않은 고객을 말함 ) 
SELECT * FROM MEMBER_TBL_11 WHERE M_POINT IS NULL;

--13. 포인트가 부여된 (포인트 금액을 가지고 있는) 고객정보 조회하시오( 포인트가 NULL이 아닌 고객 조회하면 됨)
SELECT * FROM MEMBER_TBL_11 WHERE M_POINT IS NOT NULL;

--14. 고객등급이 중복되지 않도록 고객등급을 조회하는 쿼리를 작성하시오
SELECT DISTINCT m_grade FROM member_tbl_11;

--두번째 SQL문제풀기
--1. 고객등급이 ‘01’이고 포인트가 2000이상인 고객의 아이디, 이름 정보를 조회하시오
SELECT M_ID, M_NAME FROM MEMBER_TBL_11 WHERE M_GRADE = '01' AND M_POINT >= 2000;

--2. 고객등급이 ‘01’ 이거나 포인트가 2000이상인 고객의 아이디, 이름 정보를 조회하시오
SELECT M_ID, M_NAME FROM MEMBER_TBL_11 WHERE M_GRADE = '01' OR M_POINT >= 2000;

--3. 김씨성을 가진 고객의 아이디, 이름, 등급 정보를 조회하시오( 예) 김길동, 김홍식 , 김지성... 김으로 시작되는 이름)
SELECT M_ID, M_NAME, M_GRADE FROM member_tbl_11 WHERE M_NAME LIKE '김%';

--4. 이름이 수로 끝나는 고객의 아이디, 이름 , 등급 정보를 조회하시오
SELECT M_ID, M_NAME, M_GRADE FROM MEMBER_TBL_11 WHERE M_NAME LIKE '%수';

--5. 고객등급이 ‘01’, ‘03’ 인 고객의 아이디, 이름, 등급 정보를 조회하시오( IN 연산자 사용해 주세요) 
SELECT M_ID, M_NAME, M_GRADE FROM MEMBER_TBL_11 WHERE M_GRADE IN('01','02');

--6. 고객등급이 ‘01’, ‘02’ 이 아닌 고객의 아이디, 이름, 등급 정보를 조회하시오( NOT IN 연산자 사용 해 주세요)
SELECT M_ID, M_NAME, M_GRADE FROM MEMBER_TBL_11 WHERE M_GRADE NOT IN('01','02');

--7. 고객등급이 ‘02’ 이거나 이름이 이씨성을 가진 고객의 정보의 아이디와 이름 , 등급 정보를 조회 하시오
SELECT M_ID, M_NAME, M_GRADE FROM MEMBER_TBL_11 WHERE M_GRADE = '02' OR M_NAME LIKE '이%'; 

--8. 생일이 2004-05-01이전에 태어나거나 고객등급이 ‘03’인 고객의 아이디, 이름, 생일 정보를 조회하시오
SELECT M_ID, M_NAME, M_BIRTHDAY FROM MEMBER_TBL_11 WHERE M_BIRTHDAY < '2004-05-01' OR M_GRADE = '03';