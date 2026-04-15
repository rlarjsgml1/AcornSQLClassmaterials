--연습문제 풀이
--교제 254페이지
--1,2,3 (나이가 교재랑 다르게 나옴),4(결과가 5개)
--문제1)학생테이블(student)과 학과 테이블(department)을 사용하여 학생이름,1전공 학과번호(deptno1),
--      1전공 학과 이름을 출력하세요(ANSI Join 문법과 Oracle Join문법으로 각각 SQL을 작성하시오.
select * from student;
select * from department;

select s.name, s.deptno1, d.dname
from student s
join department d
on s.deptno1 = d.deptno;

--문제2)emp2 테에블과 p_grade 테이블을 조회하여 현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
--     해당직급의 연봉의 하한 금액과 상한 금액을 아래 결과 화면과 같이 출력하세요.
select * from emp2;
select * from p_grade;

select e.name, e.position, e.pay, p.s_pay as "Low PAY", p.e_pay as "High PAY"
from emp2 e
join p_grade p
on e.position = p.position;

--문제3)Emp2 테이블과 p_grade테이블을 조회하여 사원들의 이름과 나이, 현재 직급, 예쌍직급을 출력하세요
--      예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다. 나이는 오늘(sysdate)을 기준으로
--      하되 trunc로 소수점 이하는 절삭해서 계산하세요
select * from  emp2;
select * from p_grade;

SELECT E.NAME,
       TRUNC(MONTHS_BETWEEN(SYSDATE, E.BIRTHDAY) / 12) AS AGE,
       E.POSITION AS CURR_POSITION,
       P.POSITION AS BE_POSITION
FROM EMP2 E
JOIN P_GRADE P
ON TRUNC(MONTHS_BETWEEN(SYSDATE, E.BIRTHDAY) / 12)
   BETWEEN P.S_AGE AND P.E_AGE
ORDER BY AGE;


--문제4) customer 테이블과 gift테이블을 join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중 한 가지를 
--      선택할 수 있다고 할 때 Notebook을 선택할 수 있는 고객명과 포인트,상품명을 출력하세요 
select * from customer;
select * from gift;

select c.gname, c.point, g.gname 
from customer c
join gift g
on c.point >=g.g_start 
and c.point <= g.g_end
where g.gname = 'Notebook';

--문제5) professor 테이블에서 교수의 번호, 교수이름 , 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요.
--단, 자신보다 입사일이 빠른 사람 수를 오름차순으로 출력하세요 (Oracle Join 구문과 ANSI Join 구문으로 각각 SQL을 작성하세요)
select * from professor;
select p1.profno, p1.name, p1.hiredate, count(p2.hiredate) as cnt
from professor p1
left join professor p2
on p1.hiredate < p2.hiredate
group by p1.profno, p1.name, p1.hiredate
order by 4;

--문제6) emp테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요.
--단, 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요(Oracle Join 구문과 ANSI Join구문으로 각각 SQL을 작성하세요)`
select * from emp;
select e1.empno, e1.ename, e1.hiredate, count(e2.hiredate) 
left from emp e1
join emp e2
on e2.hiredate < e1.hiredate
group by e1.empno,e1.ename, e1.hiredate
order by 3;
