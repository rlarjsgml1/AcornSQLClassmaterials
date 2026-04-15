--교재 70페이지
-- 단일행 함수

--문자함수
--INITCAF() 함수
--첫글자만 대문자로 변환 나머지는 소문자 변환
SELECT * FROM EMP;
SELECT ENAME, INITCAP(ENAME) FROM EMP;

--LOWER()함수 : 소문자로 변경
--UPPER()함수 : 대문자로 변경

SELECT * FROM EMP;
SELECT ENAME FROM EMP;
SELECT ENAME, LOWER(ENAME), UPPER(ENAME) FROM EMP;

--LENGTH : 문자열의 길이를 구하는 함수
SELECT * FROM EMP;
SELECT ENAME, LENGTH(ENAME) AS CNT FROM EMP;

--|| 연결연산자와 동일한 기능(오라클이 있음)
--CONCAT()함수 
SELECT * FROM EMP;
SELECT ENAME || JOB FROM EMP;
SELECT CONCAT(ENAME, JOB) FROM EMP;

--SUBSTR
--문자열에서 필요한 부분한 추출하여 사용
SELECT 'ABCD' FROM DUAL;
SELECT SUBSTR('ABCD', 2, 1) FROM DUAL;
SELECT SUBSTR(ENAME,1,1) FROM EMP;
SELECT SUBSTR(ENAME,-1,1) FROM EMP;

--INSTR()함수
--문자열내에서 특정문자의 위치 반환
SELECT 'A-B-C-D' FROM DUAL;
SELECT INSTR('A-B-C-D', '-') FROM DUAL; --첫번째위치에서 첫번째 만나는 지정된 문자의 위치를 반환
SELECT INSTR('A-B-C-D', '-', 1, 3) FROM DUAL;

--78페이지 사용예1 사용예2
--사용예1)STUDENT 테이블의 TEL 컬럼을 사용하여 1 전공번호(deptno1)가 201번인 학생의 이름과 전화번호가 나오는 위치를 출력하세요
select name,tel, instr(tel, ')') from student where deptno1 = '201';
--사용예2)Student테이블에서 1 전공이 101번인 학생들의 tel 컬럼을 조죟하여 3이 첫 번째로 나오는 위치를 이름과 전화번호와 함께 출력하세요
select name,tel, instr(tel, '3') from student where deptno1 = '101';
-- 79페이지 퀴즈 푸기
--퀴즈)Student 테이블을 참조해서 아래 화면과 같이 1전공이(deptno1 컬럼) 201번인 학생의 이름과 전화번호와 지역번호를 출력하세요 단, 지역번호는 숫자만 나와야 합니다.`
select * from student;
SELECT NAME, TEL,SUBSTR(TEL, 2, INSTR(TEL, ')') - 2) AS "AREA CODE"
FROM STUDENT WHERE DEPTNO1 = 201;

--LPAD() 함수
--LPAD(컬럼명, 자리수, 채울문자)
--왼쪽부터 채워짐
select name, id from student;
select name, id, lpad(id, 20, '0') from student;

--RPAD()함수
--RPAD( 컬러명, 자리수, 채울문자)
--오른쪽부터
select name, id, rpad(id, 20, '0') from student;

--공백제거 또는 특정문자 제거
--LTRIM :왼쪽
--RTRIM :오른쪽
--TRIM  : 양쪽

--공백 조심
--A공백
--A

--"A"   "A" --> 가져온데이터가 같은 모습이지만 다르다고 나오면다면 공백을 의심하고 공백제거하고 사용하기
--공백의심하시고 공백제거하고 가져오기
select 'A' from dual;
select 'A ', rtrim('A ') from dual;
select '           A ', rtrim(' A') from dual;
select ename from emp;
select ename , rtrim(ename, 'R') from emp;

--REPLACE() 함수
--REPLACE(문자열, ‘문자1’, ‘문자2’)
SELECT ENAME , REPLACE(ENAME, 'S', '-') FROM EMP;
--이름의 첫글자만 별로 바꾸기
SELECT ENAME, REPLACE(ENAME, 'A','*') FROM EMP;
SELECT ENAME, REPLACE(ENAME, 'J', '*') FROM EMP;

--찾는문자가 고정될 수 없다
--찾는 문자 구하기
--이름에서 첫글자 가져오기
SELECT ENAME, REPLACE (ENAME, SUBSTR(ENAME, 1, 1), '*') FROM EMP;

--문제풀어보기
--80페이지 풀이
--퀴즈1)EMP테이블에서 아래와 같이 20번 부서에 소속된 직원들의 이름과 2~3번째 글자만 '-'으로 변경해서 출력하세요
SELECT ENAME, REPLACE(ENAME,SUBSTR(ENAME,2,2), '--') FROM EMP WHERE deptno = 20;

--퀴즈2)STUDENT 테이블에서 아래와 같이 1전공(DEPTNO1)이 101번인 학생들의 이름과 주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 '-'과'/'로 표시되게 출력하세요.
SELECT NAME,JUMIN,REPLACE(JUMIN,SUBSTR(JUMIN,8,7),'-/-/-/-') AS REPLACE FROM STUDENT WHERE deptno1 = 101;

--퀴즈3)STUDNET 테이블에서 아래 그림과 같이 1전공이 102번인 학생들의 이름과 전화번호, 전화번호에서 국번 부분만 '*'처리하여 출력하세요 단, 모든 국번은 3자리로 간주합니다.
SELECT NAME, TEL, REPLACE(TEL, SUBSTR(TEL,INSTR(TEL,')')+1, 3),'***') AS REPLACE FROM STUDENT WHERE deptno1 = '102';

--퀴즈4)STUDENT 테이블에서 아래와 같이 DEPTNO1이 101번인 학과 학생들의 이름과 전화번호와 전화번호에서 지역번호와 국번을 제외한 나머지 번호를 *로 표시해서 출력하세요
SELECT NAME, TEL, REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,'-')+1,4),'****') AS REPLACE FROM STUDENT WHERE deptno1 = '101';

--숫자관련함수
--ROUND(컬럼, 출력을 원하느 자리수)
--TRUC
--출력을 원하는 자리수 : -2 -1 0 1 2
SELECT ROUND(1234.5678, 0) FROM DUAL;
SELECT ROUND(1234.5678, -1) FROM DUAL;

--TRUNC : 버림
SELECT TRUNC(1234.5678, 0) FROM DUAL;
SELECT TRUNC(1234.5678, -1) FROM DUAL;

--MOD : 나머지
SELECT MOD(1,3) FROM DUAL;

--CEIL : 주어진 숫자에서 가까운 큰 정수 3.56 -> 4
--FLOOR : 주어진 숫자에서 가까운 작은 정수 3.56->3

SELECT FLOOR(3.56) FROM DUAL; --> 3
SELECT CEIL(3.56) FROM DUAL; --> 4

SELECT FLOOR(-3.56) FROM DUAL; -->  -4
SELECT CEIL(-3.56) FROM DUAL; --> -3

--날짜관련함수(89페이지)
--현재날짜구하기
SELECT SYSDATE FROM DUAL;

--날짜 - 날짜  = 수 (일 수)
--날짜 +3 -> 이후 날짜
--날짜 -3 -> 이전 날짜
--MONTHS_BETWEEN(큰날짜, 작은날짜)
SELECT MONTHS_BETWEEN(SYSDATE, '2026-01-22') FROM DUAL;

--LAST_DAY()함수
--정해진 날짜가 포함된 달의 마지막 날 구하기
SELECT SYSDATE FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--NEXT_DAY() 함수
SELECT SYSDATE, NEXT_DAY(SYSDATE,'월') FROM DUAL;

--날짜, 년, 월, 일 가져오기
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE,EXTRACT(YEAR FROM SYSDATE),EXTRACT(MONTH FROM SYSDATE),EXTRACT(DAY FROM SYSDATE) FROM DUAL;
--형변환
--문자 : VARCHAR2, CHAR
--숫자 : NUMBER
--날짜 : DATE
--1) 형변환 - 표시형식
--숫자 → 문자(천단위, 통화단위)
--날짜 → 문자(원하는 표시형식으로 지정하고 싶을 때)

---2) 숫자연산을 위해서
--문자 -> 숫자

--3)날짜데이터로 다루기 위해서
--문자 -> 날짜

--형변환함수
--명시적형변환, 묵시적형변환(자동형변환)
SELECT 2+ '2' FROM DUAL; -- 2+ '2' --> 문자 2가 자동으로 숫자로 변환되었음 (자동형변환)
--
SELECT 2+ TO_NUMBER('2') FROM DUAL;

--TO_CHAR() : 숫자, 날짜를 문자로 형변환하는 것
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DAY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DY') FROM DUAL;


--시분초
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD : HH24:MI:SS') AS 날짜및시간 FROM DUAL;

--숫자를 문자로
SELECT *FROM ACORNTBL;
SELECT NAME, TO_CHAR(POINT, '999,999') FROM ACORNTBL; -- 의미 없는 0은 표시하지 않음
SELECT NAME, TO_CHAR(POINT, 'L999,999') FROM ACORNTBL;
SELECT NAME, TO_CHAR(POINT, '$999,999') FROM ACORNTBL;
SELECT NAME, TO_CHAR(POINT, '099,999') FROM ACORNTBL;

--형변환 주의사항
-- 문자 -> 문자변환 불가
-- 숫자 -> 숫자변환 불가


--교재 106 형변환 퀴즈2
--퀴즈2)emp 테이블 hiredate 컬럼을 사용하여 입사일 1, 2, 3월인 사람들의 사번과 이름, 입사일을 출력하세요
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(HIREDATE,'MM') AS MM FROM EMP;

--교재 107
--사용예1, 2
--사용예1)EMP 테이블을 조회하여 이름이 'ALLEN'인 사원의 사번과 이름과 연봉을 출력하세요. 단, 연봉은(sal*12)+comm로 계산하고 천 단위 구분 기호로 표시하세요
SELECT EMPNO, ENAME, SAL, COMM, TO_CHAR((SAL*12)+COMM, '999,999') AS SALARY FROM EMP WHERE ENAME = 'ALLEN';

--사용예2)professor 테이블을 조회하여 201번 학과에 근무하는 교수들의 이름과 급여, 보너스,연봉을 아래와 같이 출려가세요 단, 연봉은(pay*12) + bonus로 계산합니다
SELECT NAME, PAY, BONUS, TO_CHAR((PAY*12)+BONUS,'999,999') AS TOTAL FROM PROFESSOR WHERE DEPTNO = '201';

--교재108
--형변환 퀴즈
--퀴즈)emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 empno, ename, hiredate, 
--총 연봉, 15%인상 후 연봉을 아래 화면처럼 출력하세요.
--단, 총 연봉은 (sal*12)comm으로 계산하고 아래 화면에서 SAL로 출력되었으며 15%인상한 값은 총 연봉의 15% 인상 값입니다.
--(HIREDATE 컬럼의 날짜 형식과 SAL컬럼, 15% UP 컬럼의 $표시와 기호가 나오게하세요)
SELECT EMPNO,ENAME,
       TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS HIREDATE,
       TO_CHAR((SAL * 12) + COMM, '$999,999') AS SAL,
       TO_CHAR(((SAL * 12) + COMM) * 1.15, '$999,999') AS "15% UP"
FROM EMP WHERE COMM IS NOT NULL;

--NVL(), NVL2()
--교재 111(중간에 있는그림에 있는 SQL 작성)
SELECT ENAME, COMM, NVL(COMM,0), NVL(COMM,100) FROM EMP WHERE DEPTNO = 30;

--교재 112 NVL 퀴즈 (김건희)
---퀴즈) Professor 테이블에서 201번 학과 교수들의 이름과 급여, BONUS, 
--총 연봉을 아래와 같이 출력하세요(단, 총 연봉은(pay*12+bonus)로 계산하고 
--bonus가 없는 교수는 0으로 계산하세요
SELECT  PROFNO, NAME, PAY, 
        NVL(BONUS,0) AS BONUS, 
        PAY*12 + NVL(BONUS, 0) AS TOTAL 
FROM PROFESSOR
WHERE DEPTNO = '201';

--교재 113 NVL2 퀴즈
SELECT EMPNO,
       ENAME,
       COMM,
       CASE 
           WHEN comm IS NOT NULL THEN 'Exist'
           ELSE 'NULL'
       END NVL2
FROM emp
WHERE deptno = 30;
-----------------------------------------------------------
SELECT EMPNO,
       ENAME,
       COMM,
       NVL2(comm, 'Exist', 'NULL') NVL2
FROM EMP
WHERE DEPTNO = 30;

--CASE WHEN
--교재 121 (중간에 그림에 있는 SQL 작성)
SELECT NAME, TEL, CASE(SUBSTR(TEL, 1, INSTR(TEL, ')')-1)) WHEN '02' THEN 'SEOUL'
                                                          WHEN '031' THEN 'GYEONGGI'
                                                          WHEN '051' THEN 'BUSAN'
                                                          WHEN '052' THEN 'ULSAN'
                                                          WHEN '055' THEN 'GYEONGNAM'
                                                        ELSE 'ETC'
END "LOC"
FROM STUDENT
WHERE DEPTNO1=201;
--교재 123 CASE 퀴즈
select * from emp;
select empno, ename, sal,
case when sal >= 4001 then 'LEVEL 5'
     when sal >= 3001 then 'LEVEL 4'
     when sal >= 2001 then 'LEVEL 3'
     when sal >= 1001 then 'LEVEL 2'
     else 'LEVEL 1'
end "LEVEL"
from emp
order by sal desc;
--------------교재123 CASE 퀴즈 문제 교수님풀이
SELECT empno, ename, sal 
  , CASE WHEN sal  BETWEEN 1    AND 1000 THEN   'LEVEL 1'
         WHEN sal  BETWEEN 1001 AND  2000 THEN  'LEVEL 2'
         WHEN sal  BETWEEN 2001 AND  3000 THEN  'LEVEL 3'
         WHEN sal  BETWEEN 3001 AND  4000 THEN  'LEVEL 4'
         WHEN sal  >4001 THEN  'LEVEL5'
    END AS "LEVEL"
  FROM emp;
--  1.전체확인
--  2.관심있는 컬럼 조회
SELECT EMPNO, ENAME, SAL FROM EMP;
SELECT EMPNO, ENAME, SAL, CASE WHEN SAL >=4001 THEN 'LEVEL5'
                               WHEN SAL >=3001 THEN 'LEVEL4'
                               WHEN SAL >=2001 THEN 'LEVEL3'
                               WHEN SAL >=1001 THEN 'LEVEL2'
                               ELSE 'LEVEL1'
                               END AS RESULT FROM EMP;


--DECODE()
--IF문( 조건이 같은것만 사용할 수 있다)
--MEMBER_TBL_11
SELECT * FROM MEMBER_TBL_11;
--01 : VVIP 02 : VIP 03 : GOLD
SELECT M_NAME, NVL(M_GRADE,0), DECODE(M_GRADE, '01', 'VVIP', '02','VIP', '03','GOLD', '해당사항없음') FROM MEMBER_TBL_11;

--
SELECT * FROM PROFESSOR;
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, DECODE(NAME,'Audie Murphy', 'BEST!!!', 'GOOD')) FROM PROFESSOR;

---오후수업
--DECODE() : IF문 처럼 사용됨, 간단하게 조건을 처리해줌, 같은 조건일때만 처리함 복잡해지면 CASE WHEN 사용
--복수행함수
--전체합계,전체평규느 전체개수 : 집계함수는 NULL을 제외하고 집계함
--SUM(), AVG(), MAX(), MIN()
--부서별, 직급별, 사원별, 집계하기 (데이터베이스 SQL FDF 참조)

--156페이지 복수행 함수
--전체합계, 전체평균, 전체개수

--156페이지 복수행 함수 
--전체합계, 전체평균, 전체개수 
--SUM() , AVG(), COUNT()

SELECT *
FROM EMP;

SELECT  SUM(SAL)  , AVG(SAL) , COUNT(SAL) , COUNT(COMM),  COUNT(*) ,  MAX(SAL), MIN(SAL)
FROM EMP;


--집계함수는  NULL제외시킨다
--COUNT(컬럼명)  : NULL 제외 하고 카운트

SELECT  COUNT(SAL) FROM EMP;   --12
SELECT  COUNT(COMM) FROM EMP;  --4

--COUNT(*)  :  전체레코드수 구하기  (행의 개수)
--그룹별 집계구하기!!!
--1. 그룹별 집계내기 진단계만들기
--2. 데이터를 보면서 눈으로 집계 내보기
--3. 그룹별 집계 ()
SELECT * FROM MEMBER_TBL_11;
--고객 등급별 포인트의 합계 구하기
SELECT SUM(M_POINT) FROM MEMBER_TBL_11;
SELECT M_GRADE, M_POINT FROM MEMBER_TBL_11 ORDER BY 1;

SELECT M_GRADE, SUM(M_POINT) --3(실행순서)
FROM MEMBER_TBL_11 --1(실행순서)
GROUP BY M_GRADE;  --2(실행순서)

--등급별 포인트 합 구하기
--등급별 포인트 합이 5000이상인 것만 조회되도록 하시오

--그룹바이 된 결과내에서 필터를 할때는 HAVING을 사용한다 !! 
SELECT M_GRADE, SUM(M_POINT) AS TOTAL
FROM MEMBER_TBL_11
GROUP BY M_GRADE
HAVING SUM(M_POINT) >5000; --반드시 GROUP BY 상황에서만 사용가능함 !!!

--SELECT M_GRADE, SUM(M_POINT) AS TOTAL
--FROM MEMBER_TBL_11
--HAVING SUM(M_POINT) >5000 --반드시 GROUP BY 상황에서만 사용가능함 !!!
--GROUP BY M_GRADE;

SELECT M_GRADE, SUM(M_POINT) AS TOTAL
FROM MEMBER_TBL_11
GROUP BY M_GRADE
HAVING SUM(M_POINT) >5000 --반드시 GROUP BY 상황에서만 사용가능함 !!!
ORDER BY TOTAL DESC;

--MEMBER_TBL_11 사용
--등급별 합계 구하기
SELECT M_GRADE, M_POINT FROM MEMBER_TBL_11 WHERE M_GRADE IS NOT NULL;
SELECT M_GRADE, SUM(M_POINT) FROM MEMBER_TBL_11 WHERE M_GRADE IS NOT NULL GROUP BY M_GRADE;
--등급별 합계에서 5000이상인것만 조회하기 
SELECT M_GRADE, SUM(M_POINT) FROM MEMBER_TBL_11 WHERE M_GRADE IS NOT NULL GROUP BY M_GRADE HAVING SUM(M_POINT) >= 5000;

--표시형식
SELECT M_GRADE, TO_CHAR(SUM(M_POINT),'999,999') FROM MEMBER_TBL_11 WHERE M_GRADE IS NOT NULL GROUP BY M_GRADE HAVING SUM(M_POINT) >= 5000;