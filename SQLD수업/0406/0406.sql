--세부적인 집계
--group by 복습하기
--emp 테이블로 부터 직급별 급여합 구하기
--문제 4풀기
--전체 조회
select * from member_tbl_11;

--고객등급별 포인트의 합계구하기

--전체 포인트합 구하기

select m_point
from member_tbl_11;


select sum(m_point)
from member_tbl_11;

--그룹바이 전 단계 만들기
--눈으로 집계 가능하기

--select m_grade, m_point
--from member_tbl_11
--where m_point is not null
--order by 1;

--세부적인 집계
--포인트가 5000이상인 것만 조회하기
--그룹바이를 한 후 조회결에 대한 조건을 줄때는 HAVING
select m_grade, sum(m_point) AS TOTAL
from member_tbl_11
group by m_grade
HAVING SUM(M_POINT) > = 5000 ;

select m_grade, sum(m_point) AS TOTAL -- 델리아스는 작성 이후순서부터 
from member_tbl_11
group by m_grade
HAVING SUM(M_POINT) > = 5000;

select m_grade, sum(m_point) AS TOTAL -- 델리아스는 작성 이후순서부터 
from member_tbl_11
group by m_grade
HAVING SUM(M_POINT) > = 5000
ORDER BY TOTAL;

select m_grade, sum(m_point) AS TOTAL 
from member_tbl_11
where m_point is not null
group by m_grade
HAVING SUM(M_POINT) > = 5000
order by 1;

--EMP
SELECT * FROM EMP;

--전체 SAL의 합계
SELECT SUM(SAL) FROM EMP;
--직급별 SAL의 합계 
--SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
SELECT JOB, SAL FROM EMP ORDER BY 1;
--직급별 SAL의 합계 3000이상 조회
SELECT JOB, SUM(SAL) FROM EMP 
GROUP BY JOB
HAVING SUM(SAL) >=3000;
--직급별 SAL의 합계 5000이상만 조회 --숫자 =>천단위 구분
SELECT JOB, SUM(SAL) FROM EMP 
GROUP BY JOB
HAVING SUM(SAL) >=5000;

SELECT JOB, TO_CHAR(SUM(SAL), '999,999') AS TOTAL
FROM EMP 
GROUP BY JOB
HAVING SUM(SAL) >=5000
ORDER BY TOTAL DESC; --ORDER BY 2 DESC;

--고객별 판매금액 조회하기
SELECT * FROM PROD_SALES;

SELECT CUST_NM, SALES_AMT
FROM PROD_SALES 
ORDER BY 1;

SELECT CUST_NM, SUM(SALES_AMT)
FROM PROD_SALES 
GROUP BY CUST_NM
ORDER BY 1;


--고객별 판매금액 조회하기 7만원이상 고객만 조회하기
SELECT CUST_NM, SUM(SALES_AMT)
FROM PROD_SALES 
GROUP BY CUST_NM
HAVING SUM(SALES_AMT) >=70000
ORDER BY 1;

SELECT CUST_NM
FROM PROD_SALES 
GROUP BY CUST_NM
HAVING SUM(SALES_AMT) >=70000
ORDER BY 1;


--교제 59
--잡합연산자(행합치기)
--UNION, UNION ALL, INSTERSECT, MINUS
--두 테이블을 대장으로 행합치기(컬럼의 수 , 컬럼타입이 같아야 한다)
--UNION, UNION ALL( 중복데이터 제거, 정렬 => UNION) (중복데이터, 정렬 X => UNION ALL)
SELECT STUDNO, NAME 
FROM STUDENT
WHERE DEPTNO1 = 101
UNION
SELECT STUDNO, NAME 
FROM STUDENT
WHERE DEPTNO1 = 201;

SELECT STUDNO, NAME 
FROM STUDENT
WHERE DEPTNO1 = 101
UNION ALL
SELECT STUDNO, NAME 
FROM STUDENT
WHERE DEPTNO1 = 201;

--63 INTERSECT
SELECT STUDNO, NAME
FROM STUDENT
WHERE DEPTNO1 = 101
INTERSECT
SELECT STUDNO, NAME
FROM STUDENT
WHERE DEPTNO2 = 201;

--MINUS 연산자( 큰거 (내용이 많은거) - 작은거 (내용이 작은거))
SELECT EMPNO, ENAME, SAL
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP 
WHERE SAL>2500;

--조인 맛보기
create table tbl_test_customer(
    id varchar2(20) not null primary key ,
    name varchar2(20) ,
    address varchar2(20),
    tel varchar2(20)
);

create table tbl_test_goods(
  pcode varchar2(20) not null primary key,
  pname varchar(20) ,
  price number(4)
);

create table tbl_test_order(
  ocode varchar2(20) not null primary key,
  odate date,
  id varchar2(20),
 pcode varchar2(20),
 sale_cnt number(6)
);



insert into tbl_test_customer values( 'H001' ,'송주창', '라스베가스', '010-3030-2222');
insert into tbl_test_customer values( 'H002' ,'여도현', 'L.A', '010-2424-2222');
insert into tbl_test_customer values( 'H003' ,'김재민', '워싱턴D.C', '010-1010-2121');
insert into tbl_test_customer values( 'H004' ,'이정하', '뉴욕', '010-3333-2222');
insert into tbl_test_customer values( 'H005' ,'장해든', '텍사스', '010-9090-2222');
insert into tbl_test_customer values( 'H006' ,'김민경', '서울', '010-7878-1234');


 


insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);



insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);

COMMIT;


 

// sql  조인 표준 

SELECT  name, address, tel, odate, pname, sale_cnt, price, sale_cnt * price
FROM   tbl_test_order o
JOIN     tbl_test_customer c
ON       o.id = c.id
JOIN     tbl_test_goods g
ON       o.pcode = g.pcode ;




SELECT   *
FROM   tbl_test_order o
JOIN     tbl_test_customer c
ON       o.id = c.id;
 


SELECT   *
FROM   tbl_test_order o
JOIN     tbl_test_customer c
ON       o.id = c.id
JOIN     tbl_test_goods g
ON       o.pcode = g.pcode ;


---
SELECT * FROM TBL_TEST_CUSTOMER; --고객테이블
SELECT * FROM TBL_TEST_GOODS; --상품테이블
SELECT * FROM TBL_TEST_ORDER; --주문테이블

--주문정보조회하기
SELECT * FROM TBL_TEST_ORDER;

--주문정보조회하기(주문자이름, 주문일자,구매수량)
SELECT C.NAME, O.ODATE, O.SALE_CNT 
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID;

--INNER JOIN
SELECT C.NAME, O.ODATE, O.SALE_CNT 
FROM TBL_TEST_ORDER O
INNER JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID;

--고객테이블에 자기정보 INSERT
insert into tbl_test_customer values( 'KKH' ,'김건희', '경기도', '010-3163-5728');
COMMIT;

--주문일자, 상품명, 상품단가, 주문 수량, 주문금액 조회하기
SELECT O.ODATE, G.PNAME, G.PRICE, O.SALE_CNT, G.PRICE * O.SALE_CNT AS 주문금액 
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_GOODS G
ON O.PCODE = G.PCODE;

--주문일자, 고개명, 고객전화번호, 상품이름, 상품단가, 주문수량, 상품금액 - 조회
SELECT o.odate, c.name, c.tel, g.pname, 
       TO_CHAR(g.price,'999,999'), o.sale_cnt,
       TO_CHAR(g.price * o.sale_cnt,'999,999') AS 상품금액
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID
JOIN TBL_TEST_GOODS G
ON O.PCODE = G.PCODE;

-------
SELECT  O.ODATE,  C.NAME, C.TEL,  G.PNAME, G.PRICE  , O.SALE_CNT , G.PRICE *  O.SALE_CNT 
 FROM tbl_test_order O
 JOIN tbl_test_customer C
 ON  O.ID  = C.ID
 JOIN tbl_test_goods  G
 ON  O.PCODE  = G.PCODE;
 
 --고객별 주문 수량합계 조회하기
 SELECT * FROM TBL_TEST_ORDER;
 
SELECT * 
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID;
--GROUP BY 전 단계까지 만들기
--눈으로 집계가능하게 만들자
SELECT C.NAME,SUM(O.SALE_CNT )
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID
GROUP BY C.NAME;

SELECT C.NAME,SUM(O.SALE_CNT )
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID
HAVING SUM(O.SALE_CNT) > =5
GROUP BY C.NAME;
 --고객별 판매금액 조회하기
 SELECT C.NAME, O.SALE_CNT * G.PRICE
 FROM TBL_TEST_ORDER O
 JOIN TBL_TEST_CUSTOMER C
 ON O.ID = C.ID
 JOIN TBL_TEST_GOODS G
 ON O.PCODE = G.PCODE;
 
 SELECT C.NAME, SUM(O.SALE_CNT * G.PRICE)
 FROM TBL_TEST_ORDER O
 JOIN TBL_TEST_CUSTOMER C
 ON O.ID = C.ID
 JOIN TBL_TEST_GOODS G
 ON O.PCODE = G.PCODE
 GROUP BY C.NAME;
 
 SELECT C.NAME, TO_CHAR(SUM(O.SALE_CNT * G.PRICE) , '999,999') AS AMOUNT
 FROM TBL_TEST_ORDER O
 JOIN TBL_TEST_CUSTOMER C
 ON O.ID = C.ID
 JOIN TBL_TEST_GOODS G
 ON O.PCODE = G.PCODE
 GROUP BY C.NAME
 HAVING SUM(O.SALE_CNT * G.PRICE) >= 2000
 ORDER BY 1;
 
 --테이블에는 주키가 필수적
--다른테이블과의 관계성은 다른 테이블의 주키를 
--가지는 방식 사용 ( 이것을 외래키)

--조인연습테이블 3개를 가지고 풀기
--1) 고객별 주문수량의 합계 구하기
SELECT c.name, SUM(o.sale_cnt) AS 주문수량합계
FROM tbl_test_order o
JOIN tbl_test_customer c
ON o.id = c.id
GROUP BY c.name
ORDER BY c.name;

--2) 상품별 주문금액의 합계 구하기
SELECT g.pname, SUM(o.sale_cnt * g.price) AS 주문금액합계
FROM tbl_test_order o
JOIN tbl_test_goods g
ON o.pcode = g.pcode
GROUP BY g.pname
ORDER BY g.pname;

--3) 고객별상품별 주문수량의 합계 구하기
SELECT c.name, g.pname, SUM(o.sale_cnt) AS 주문수량합계
FROM tbl_test_order o
JOIN tbl_test_customer c
ON o.id = c.id
JOIN tbl_test_goods g
ON o.pcode = g.pcode
GROUP BY c.name, g.pname
ORDER BY c.name, g.pname;

--4) 고객별상품별 주문금액의 합계 구하기
SELECT c.name, g.pname, SUM(o.sale_cnt * g.price) AS 주문금액합계
FROM tbl_test_order o
JOIN tbl_test_customer c
ON o.id = c.id
JOIN tbl_test_goods g
ON o.pcode = g.pcode
GROUP BY c.name, g.pname
ORDER BY c.name, g.pname;

-- 교재) 233 페이지   사용예2
--학생(STUDENT)과 교수테이블(PROFESSOR)을 JOIN하여 학생의 이름과 지도교수 이름을 출력하세요
SELECT S.NAME AS STU_NAME, P.NAME AS PROF_NAME
FROM STUDENT S,
PROFESSOR P
WHERE S.PROFNO = P.PROFNO;

-- 교재) 234 페이지   사용예3
--학생 테이블 학과 테이블, 교수테이블을 JOIN하여 학생의 이름과 학생의 학과 이름, 학생의 지도교수 이름을 출력하세요.
SELECT S.NAME AS STU_NAME, D.DNAME AS DEPT_NAME, P.NAME AS PROF_NAME
FROM STUDENT S, DEPARTMENT D, PROFESSOR P
WHERE S.DEPTNO1 = D.DEPTNO
AND S.PROFNO = P.PROFNO;

-- 교재) 254 페이지   연습문제 1번만
--학생테이블(student)과 학과 테이블(department)을 사용하여 학생이름, 1전공 학과번호(deptno1).
--1전공 학과 이름을 출력하세요(ANSI JOIN문법과 ORACLE JOIN문법으로 각각 SQL을 작성하세요)
--ANSI JOIN 기법
SELECT s.name, s.deptno1, d.dname
FROM student s
JOIN department d
ON s.deptno1 = d.deptno;

--DECODE() : IF문  (  조건이 같은   IF문에 해당됨)
SELECT * FROM MEMBER_TBL_11;
SELECT M_GRADE FROM MEMBER_TBL_11;

SELECT M_GRADE, DECODE(M_GRADE, '01', 'VVIP', '02', 'VIP', '03', 'GOLD')
FROM MEMBER_TBL_11;

--가로집계할 때 사용함 
--CLERK MANAGER SALESHAN ANALYST PRESIDENT
--  1      2       3        4        5
SELECT * FROM EMP;

SELECT JOB FROM EMP;

SELECT COUNT(JOB) FROM EMP;

SELECT COUNT( DECODE(JOB, 'CLERK', 9))
FROM EMP;

SELECT COUNT( DECODE(JOB, 'CLERK', 9))
FROM EMP;

SELECT JOB, DECODE(JOB, 'CLERK', 2)
FROM EMP;

SELECT COUNT( DECODE(JOB, 'CLERK', 2))
FROM EMP;

SELECT COUNT( DECODE(JOB,'CLERK',9)),
        COUNT( DECODE(JOB,'SALESMAN',9)),
        COUNT( DECODE(JOB,'MANAGER',9)),
        COUNT( DECODE(JOB,'ANALYST',9)),
        COUNT( DECODE(JOB,'PRESIDENT',9))
FROM EMP;