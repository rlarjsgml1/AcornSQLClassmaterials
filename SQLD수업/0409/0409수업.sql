--6일차 join 다양한 조인 (페이지 220)페이지

--**정규화 (테이블 쪼개기)**
--테이블합치기(열합치기)
--⇒ join

--join
--- inner join( inner)기본값, 생략가능
--- equal join (equi) = 조인 조건이 같은 것 끼리
---non equi(조인 조건이 범위에 만족하는 것을 기준으로 조인하기)

--inner join (복습)
SELECT * FROM tbl_test_customer;
SELECT * FROM tbl_test_goods;
SELECT * FROM tbl_test_order;

--고객테이블 자기정보 넣기
--상품테이블 상품하나 넣기
desc tbl_test_customer;
insert into tbl_test_customer(id,name,address, tel) values('victoal','김호영', '프랑스','010-3163-5728');
commit;

select * from tbl_test_customer;

desc tbl_test_goods;
insert into tbl_test_goods(pcode, pname, price) values('P005', '포카칩어니언',3500);
COMMIT;


SELECT * FROM tbl_test_customer;
SELECT * FROM tbl_test_goods;
SELECT * FROM tbl_test_order;

SELECT *
FROM TBL_TEST_ORDER O
JOIN TBL_TEST_CUSTOMER C
ON O.ID = C.ID;

--주문하지 않은 고객은 조회되지 않는다
--주문하지 않은 고객도 조회하고 싶다면?? 
--OUTER조인 (일치하지 않은 값도 조인의 대상됨)
--LEFT, RIOUT, FULL

SELECT * 
FROM TBL_TEST_ORDER O --왼쪽
LEFT JOIN TBL_TEST_CUSTOMER C  --오른쪽
ON O.ID = C.ID;

--LEFT, RIGHT, FULL

SELECT * 
FROM TBL_TEST_ORDER O --왼쪽
RIGHT JOIN TBL_TEST_CUSTOMER C  --오른쪽
ON O.ID = C.ID;

SELECT * 
FROM TBL_TEST_ORDER O --왼쪽
FULL JOIN TBL_TEST_CUSTOMER C  --오른쪽
ON O.ID = C.ID;

--괌심있는 컬럼 조회
--고객별 주문 수량
SELECT C.NAME, NVL(SUM(O.SALE_CNT),0)
FROM TBL_TEST_ORDER O --왼쪽
RIGHT JOIN TBL_TEST_CUSTOMER C  --오른쪽
ON O.ID = C.ID
GROUP BY C.NAME;

--**INNER JOIN**
--- LEFT OUTTER JOIN (양쪽 일치 + 왼쪽테이블에 남아 있는 내용 조회됨)
--- RIGHT OUTER JOIN(양쪽 일치 + 오른쪽테이블에 남아 있는 내용 조회됨)
--- PULL OUTER JOIN (양쪽 일치 + 양쪽 테이블 모두 남아 있는 내용 조회됨)

--**조인조건 (ON)**
--- EQUI
--- NON EQUI

-- SELF 조인(자기자신과 조인하기)
-- CROSS조인( 조인조건이 없는거 )

--교재 236 사용예
--NOT-EQUI JOIN

SELECT * FROM CUSTOMER;
SELECT * FROM GIFT;

SELECT C.GNAME, C.POINT, G.GNAME
FROM CUSTOMER C 
JOIN GIFT G
ON C.POINT >= G.G_START AND C.POINT <= G.G_END;

--239페이지
--사용예2)student 테이블과 score테이블, hakjum 테이블을 조회하여 학생들의 이름과 점수와 학점을 출력하세요.
SELECT * FROM STUDENT;
SELECT * FROM SCORE;
SELECT * FROM HAKJUM;

SELECT S.NAME AS STU_NAME, O.TOTAL AS SCORE, H.GRADE AS CREDIT 
FROM student S
JOIN SCORE O
ON S.STUDNO = O.STUDNO
JOIN hakjum H 
ON O.TOTAL >= H.MIN_POINT AND O.TOTAL <= H.MAX_POINT
ORDER BY O.TOTAL;

--OUTER JOIN
SELECT * FROM tbl_test_customer;
SELECT * FROM tbl_test_goods;
SELECT * FROM tbl_test_order;

--상품별 판매수량, 판매금액 합계 구하기
SELECT G.PNAME AS 과자,
        TO_CHAR(NVL(SUM(O.SALE_CNT),0),'999,999') || '수량' AS 판매수량, 
        TO_CHAR(NVL(SUM(O.SALE_CNT * G.PRICE),0),'999,999') || '원' AS 판매금액
FROM TBL_TEST_ORDER O
RIGHT OUTER JOIN TBL_TEST_GOODS G
ON O.PCODE = G.PCODE
GROUP BY G.PNAME
ORDER BY 3 DESC;

--교재 241
--사용예1) student 테이블과 professor 테이블을 join하여 학생 이름과 지도교수 이름을 출력하세요 단, 지도교수가 
----------결정되지 않은 학생의 명단도 함께 출력하세요
select * from student;
select * from professor;

select s.name as 학생, nvl(p.name,'없음') as 교수
from student s
left outer join professor p
on s.profno = p.profno;

--교재 243
--사용예2) student테이블과 professor 테이블을 join하여 학생 이름과 지도 교수 이름을 출력하세요
----------단,지도학생이 결정되지 않은 교수의 명단도 함께 출력하세요.
select * from student;
select * from professor;

select nvl(s.name,'없음') as 학생, p.name as 교수
from student s
right outer join professor p
on s.profno = p.profno;

--교재244
--사용예3) student 테이블과 professor 테이블을 join하여 학생 이름과 지도교수 이름을 출력하세요
        --단, 지도학생이 결정 안 된 교수 명단 과 지도교수가 결정 안 된 학생 명단을 한꺼번에 출력하세요
select * from student;
select * from professor;

select nvl(s.name,'없음') as 학생, nvl(p.name,'없음') as 교수
from student s 
full outer join professor p
on s.profno = p.profno;

--250페이지 self join
--자기자신과 조인하기
select * from emp;

select e1.ename as ENAME, e2.ename as MGR_ENAME
from emp e1 
left outer join emp e2
on e1.mgr = e2.empno;

--join을 쉽게 하려면
--1. 각테이블 조회하기
--2. 눈으로 조인하기
--3. 조인하기 수행하기 - 조인조건
--4. 필요하면(inner 조인에 나오지 않은 데이터) outer로 바꾸기 - left, right, full

--cross join 
--조인조건이 없는 조인을 말한다

select * from tbl_test_customer;
select * from tbl_test_goods;
select * from tbl_test_order;

select * 
from tbl_test_order o
join tbl_test_customer c
on o.id = c.id;

select * from tbl_test_order o
cross join tbl_test_customer c;

---------list agg
select * from drink_order;
select * from drink_order_option;

select * 
from drink_order d
join drink_order_option o
on d.order_id = o.order_id;

select d.order_id, d.drink_name, o.option_name
from drink_order d
join drink_order_option o
on d.order_id = o.order_id;

select d.order_id,
       d.drink_name,
       listagg(o.option_name, ' ') within group(order by o.option_name) as options
from drink_order d
join drink_order_option o
on d.order_id = o.order_id
group by d.order_id, d.drink_name;