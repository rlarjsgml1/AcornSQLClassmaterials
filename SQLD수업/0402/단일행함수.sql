--단일행함수
--교재 68페이지 
--단일행함수
--여러건의 데이터를 한 번에 하나씩 처리하는 함수
--각 행에 대해서 함수가 실행된다.

--자주 쓰는 단일행 함수 익히기

--모두 조회
select * from acorntbl;

--관심있는 컬럼 조회
select id, pw, name from acorntbl;

--id=> 대문자로 조회하기 upper()
select upper(id), pw, name from acorntbl;

--문자함수
--데이터베이스에서 문자는 문자 문자열을 구분하지 않음
-- ''로 감싼다
--문자열을 작성할 때 '를 문자로 사용하고 싶으면 ''한번더 작성한다
--함수에서 인덱스사용할 때 1부터 시작함 !!
--문자열추출하기 SUBSTR()
select * from acorntbl;
select id from acorntbl;
select substr(id,1,2) from acorntbl;
select substr(id,1,2) as id from acorntbl;

select * from acorntbl;
select id, 'hi~~!'' ~^^' from acorntbl;

--손문자 변경
--대문자 변경
select * from acorntbl;
select lower(id) from acorntbl; --손문자
select upper(id) from acorntbl; --대문자

--instr 함수
--문자열내에서 특정문자의 위치를 반환함
select * from student;
select tel from student;
select instr(tel,')') from student;

--replace 함수
--문자내에서 특정문자를 원하는 문자로 변경하기
select * from student;
select tel from student;
select replace ( tel , ')' , '*') from student;

--숫자함수
--- round() :반올림
--- trunc() : 버림
select * from emp;
select ename, sal from emp;

select 10/3 from dual;
select round(10/3, 1) from dual;
select trunc(10/3,0) from dual;

select 23333 from dual;
select trunc (23333,-1) from dual;

--날짜함수
---현재날짜 가져오기
select sysdate from dual;

--NVL함수
---nul처리를 함수있는 함수
select * from member_tbl_11;
select m_name, m_point from member_tbl_11;
select m_name, m_point +100 from member_tbl_11;
---nvl 함수 사용하기(null인 상황 처리하는 함수
---기존고객의 포인트 100원 인상하기
--- null인 고객은 0으로 처리하기
select m_name, nvl(m_point,0) from member_tbl_11;
select m_name, nvl(m_point,0) +100 from member_tbl_11;

---NVL2(컬럼명, null아닌 경우, null인 경우
select * from member_tbl_11;
---null인 고객은 포인트를 100로 정하기
select m_name, m_point from member_tbl_11;

--null 아닌 고객의 포인트인상 1000
select * from member_tbl_11;
--null인 고객은 포인트를 100로 정하기
select m_name,nvl2(m_point, m_point+1000, 100) from member_tbl_11;

--CASE WHEN(조건문 처리)
--에이콘테이블에서 포인트가 3000이상이면 A 2000이상 B 나머지 C로 조회하기
select * from acorntbl;
select name, point from acorntbl;
select name, point 
    ,case when point>= 3000 then 'A' 
    when point >=1000 then 'B' 
    else 'C'
    end as result
from acorntbl;

--3번째 SQL 문제풀이

--SELECT 절에 사용되는 키워드 
--문제1) MEMBER_TBL_11 테이블로부터 고객등급 조회하기
SELECT M_GRADE FROM MEMBER_TBL_11;

--문제2) MEMBER_TBL_11 테이블로부터 고객등급 조회하기, 중복된 값 제외하고 조회하기
select distinct m_grade from member_tbl_11;

--문제3) 고객테이블로부터 아이디 USERID라는 이름으로 조회하기 (AS 는 생략가능함)
select m_name userid from member_tbl_11;

--문제4) 고객테이블로부터 이름에 ‘님’자를 붙여 NAME이라는 컬럼으로이 조회되도록 하시오
select m_name || '님' as name from member_tbl_11;

CREATE TABLE CUST_INFO(
 ID VARCHAR2(13) NOT NULL PRIMARY KEY , FIRST_NM VARCHAR2(10) , LAST_NM VARCHAR2(10) , ANNL_PERF NUMBER(10,2)
);
COMMIT;
INSERT INTO CUST_INFO VALUES ('8301111567897' , 'JHUN' , 'KIM', 330.08);
INSERT INTO CUST_INFO VALUES ('9302112567897' , 'JINYOUNG' , 'LEE', 857.61);
INSERT INTO CUST_INFO VALUES ('8801111567897' , 'MIJA' , 'HAN', -76.77);
INSERT INTO CUST_INFO VALUES ('9901111567897' , 'YOUNGJUN' , 'HA', 468.54);
INSERT INTO CUST_INFO VALUES ('9801112567897' , 'DAYOUNG' , 'SUNG', -890);
INSERT INTO CUST_INFO VALUES ('9701111567897' , 'HYEJIN' , 'SEO', 47.44);
COMMIT;

--문제5) 고객정보 테이블로부터 주민번호 7번째 숫자 (성별을 나타내는)를 추출하여 GENDER 라는 이름으로 주민번호와 함께 조회하시오
select id, substr(id,7,1) as gender from cust_info;

--문제6) 고객정보 테이블로부터 주민번호, LAST_NM을 모두 소문자로 조회되도록 하시오
select lower(id), lower(last_nm) from cust_info;

--문제7) 고객정보 테이블로부터 DM발송을 위해서 NAME이라는 이름으로 KIM, JIHOON 과 같은형식으로 조회될 수 있도록 하시오
select last_nm || ',' || first_nm as name from cust_info;

--<숫자함수>
--문제8) 고객정보 테이블로부터 고객 주민번호, 수익을 소수 둘째에서 반올림하여 소수 첫째자리까지 표시될 수 있도록 조회 하시오
select id, round(annl_perf, 1) from cust_info;

--문제9)고객정보 테이블로부터 고객 주민번호, 수익을 소수 첫째에서 버림하여 정수로 나타낼수 있도록 조회하시오
select id, trunc(annl_perf, 0) from cust_info;

--문제10)현재날짜를 조회하시오
select sysdate from dual;

--<조건식>
--문제11) 고객테이블로부터 주민번호 , 수익이 300이사이면 고수익 100이상은 일반수익 0이하이면 손해 , 나머지는 변동없음 내용이 RESULT컬럼명으로 조회될 수 있도록 하시오
select id, annl_perf,
        case 
        when annl_perf >=300 then '고수익'
        when annl_perf >=100 then '일반수익'
        when annl_perf <=0 then '손해' 
        else '변동없음' end as result from cust_info;

--문제12) 고객테이블로부터 이름과 포인트를 조회하시오(단 포인트가 적립되지 않은 고객은 0으로 표시되도록 하시오) 힌트:NVL 함수 사용
 select m_name, nvl(m_point, 0) as m_point from member_tbl_11;
 
-- 문제) 힌트: NVL2함수를 사용하세요
--고객테이블로부터 기존포인트 점수에서 100포인트씩 인상하려고 합니다. 
--NEXT_POINT라는 컬럼으로 조회되도록 하시오, 고객이름, 포인트와 함께 조회하시오 
--( 기존포인트가 없는 사람은 0포인트로 간주합니다)
SELECT M_NAME,
       M_POINT,
       NVL2(M_POINT, M_POINT + 100, 0) AS NEXT_POINT
FROM MEMBER_TBL_11;