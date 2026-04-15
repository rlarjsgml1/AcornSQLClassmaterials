--교재 285페이지 연습문제 1~9
--문제1) 아래와 같은 구조의 일반 테이블 생성하세요
CREATE TABLE NEW_EMP(
    NO NUMBER(5) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    HIREDATE DATE,
    BONUS NUMBER(6,2)
);
SELECT * FROM NEW_EMP;

--문제2) 위 1번문제에서 생성한 NEW_EMP테이블에서 NO,NAME,HIRDATE컬럼만 가져와서 
--아래 그림과 같이 NEW_EMP2 테이블을 생성하는 쿼리르 쓰세요.
CREATE TABLE NEW_EMP2 
AS SELECT NO, NAME, HIREDATE FROM NEW_EMP;
SELECT * FROM NEW_EMP2;

--문제3) 위2번 문제에서 생성한 NEW_EMP2테이블과 동일한 구조의 테이블을 NEW_EMP3 이름으로 생성하되
--테이블 구조만 가져오고 데이터는 가져오지 않도록 하는 쿼리를 쓰세요
CREATE TABLE NEW_EMP3
AS
SELECT * FROM NEW_EMP2 WHERE 1 = 0;
SELECT * FROM NEW_EMP3;

--문제4)위 2번 문제에서 생성한 NEW_EMP2테이블에 DATE타입을 가진 BIRTHDAY 컬럼을 추가하는 쿼리르 쓰세요.
--단, 해당 컬럼이 추가될 때 기본값으로 현재 날짜(SYSDATE)가 자동으로 입력되도록하세요
ALTER TABLE NEW_EMP2 ADD BIRTHDAY DATE DEFAULT SYSDATE;
SELECT * FROM NEW_EMP2;

--문제5)위 4번문제에서 생성한 NEW_EMP2테이블의 BIRTHDAY컬럼 이름을 BIRTH로 변경하는 쿼리를 쓰세요
ALTER TABLE NEW_EMP2 RENAME COLUMN BIRTHDAY TO BIRTH;
SELECT * FROM NEW_EMP2;

--문제6)위 4번 문제에서 생성한 NEW_EMP2 테이블의 NO 컬럼의 길이를 NUMBER(7)로 변경하는 쿼리를 쓰세요.
ALTER TABLE NEW_EMP2 MODIFY NO NUMBER(7);
DESC NEW_EMP2;

--문제7)NEW_EMP2 테이블의 컬럼 중에서 BIRTH컬럼을 삭제한느 쿼리를 쓰세요.
ALTER TABLE NEW_EMP2 DROP COLUMN BIRTH;
DESC NEW_EMP2;

--문제8)NEW_EMP2테이블의 컬럼을 남겨 놓고 데이터만 지우는 쿼리를 쓰세요.
TRUNCATE TABLE NEW_EMP2;
DESC NEW_EMP2;

--문제9)NEW_EMP2 테이블을 완전히 삭제하는 쿼리를 쓰세요.
DROP TABLE NEW_EMP2;
DESC NEW_EMP2;

DROP TABLE NEW_EMP;
DESC NEW_EMP;

DROP TABLE NEW_EMP3;
DESC NEW_EMP3;

--문제10)데이터 딕셔너리 종류와 특징을 간단하게 쓰세요.
--USER_ : 현재 사용자가 소유한 객체 정보
--ALL_  : 현재 사용자가 접근 가능한 객체 정보
--DBA_  : 데이터베이스 전체 객체 정보(관리자 권한 필요)
-----------------------------------------------------------------------------------------
