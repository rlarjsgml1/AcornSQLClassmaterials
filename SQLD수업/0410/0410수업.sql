--7일차
--테이블만들기, 테이블 수정하기, 테이블 삭제하기

--테이블 생성하기 
--회원테이블 생성하기

--자료형
--문자 :CHAR(자리수) :고정길이 , VARCHAR2(자리수)  : 가변길이
--숫자 : NUMBER(자리수) , NUMBER( 전체자리수, 소수자리수)  NUMBER(6,2)
--날짜 : DTAE, TIMESTAMP

CREATE TABLE MEMBER_ACORN(
    ID VARCHAR2(50) PRIMARY KEY, --아이디
    PWD VARCHAR2(50), --비번
    NAME VARCHAR2(50), --고객이름
    GENDER CHAR(6), --성별
    AGE NUMBER(3), --나이
    BIRTHDAY DATE, --생일
    PHONE CHAR(13) --전화번호
);

SELECT * FROM MEMBER_ACORN;
--테이블생성시 주키설정 필수
--CHAR : 고정길이형 문자이기 때문에 남은 공간은 공백으로 채워짐
--VARCHAR2
--- ‘HELLO’ ‘HELLO ‘ 두 개는 다르다, 공백도 하나의 문자이다.
--- 오라클경우 한글 3바이트 사용함, 한글자리수 설정할 때 고려해야 함
--- VARCHAR2 : 가변길이형 문자, 실제입력된 문자만큼 공간이 마련

--테이블생성
CREATE TABLE MEMBER_TEST(
     ID  VARCHAR2(7) PRIMARY KEY ,
     PW  CHAR(4)  DEFAULT '0000' ,
     NAME VARCHAR2(10) ,
     TEL  VARCHAR2(10)    
  );
  
--홍길동
--김건희
INSERT INTO member_test(ID, NAME, TEL) VALUES('KKH', '김건희', '0103163572');
INSERT INTO member_test(ID,PW, NAME, TEL) VALUES('KBK','5728', '김봉앙', '0105100575');
COMMIT;
  
SELECT * FROM MEMBER_TEST;
  
--테이블 변경(수정하기) ALTER
--컬럼 추가하기, 주소 컬럼 추가하기
ALTER TABLE MEMBER_TEST ADD ( ADDRESS VARCHAR2(50));

--컬럼 이름 변경하기 
ALTER TABLE MEMBER_TEST RENAME COLUMN NAME TO USERNAME;

--TEL 컬럼 문자자료형의 길이 변경하기
ALTER TABLE MEMBER_TEST MODIFY TEL VARCHAR2(15);

DESC MEMBER_TEST;

--컬럼 삭제하기
--ADDRESS 삭제하기
ALTER TABLE MEMBER_TEST DROP COLUMN ADDRESS;

--테이블 삭제하기
DROP TABLE MEMBER_TEST;

--* 참고사항
-- 테이블  drop시  참조하고 있는 테이블이 있는 경우 삭제가 안될 수 있다.
-- 테이블 drop시 강제 삭제 시킬 수 있다.
--drop table aaa_tbl  cascade constraints ;
--복합키를 주키로 설정하는 구문
--CREATE TABLE testTbl  (
--    column1 NUMBER,
--    column2 VARCHAR2(100),
--    column3 DATE,
--    CONSTRAINT  pk_test   PRIMARY KEY (column1, column2)
--);

--테이블 삭제하기
--DROP TABLE 테이블명; ->완전히 삭제
--TRUNCATE TABLE 테이블명; ->

--**키의종류**
--- 슈퍼키 : 유일성 만족
--- 후보키 : 주키가 될 수 있는 후보 (유일성 + 최소성)
--- 주키 : 후보키중에 선택된 키
--- 대체키 : 후보키중에 나머지 키
--- 외래키 : 다른 테이블의 주키로써 관계성 설정을 위해서 가지고 있는 키

--학생테이블 
--학번  이름    학년  반 번호
--001   이순신   1   1  10
--002   홍길동   1   1  9
--003   이순신   2   3  4
--- **슈퍼키 : 유일성**
--    - 학번, 이름, 학년 반, 번호 => 유일성 만족( 학번 + 이름 + 학년 + 반 + 번호) => 슈퍼키
--    - 학번, 이름, 학년, 반 ⇒ 유일성 만족( 학번 + 이름 + 학년 + 반) ⇒ 슈퍼키가 될 수 있음
--    - 학번, 이름, 학년 ⇒ 유일성만족
--    - 학번, 이름 ⇒ 유일성만족
--    - 이름 ⇒ 유일성만족 (X)
--    - 학년,반, 번호 ⇒ 유일성 만족
--    - 학번 ⇒ 유일성 만족

--1. **유일성** : 키의 조합으로 유일하게 하나의 레코드를 식별할 수 있는지 여부
--2. **최소성** : 키의 조합이 최소한 존재해야지만 키로 사용하는 것이 가능한가 ? 
--               키의 일부로 유일하게 식별이 가능하다면 최소성 위배가 된다.
--               최소성을 만족해야 후보키가 될 수 있다.

-- 후보키중에서 선택된 키 ⇒ 주키 (학번)
-- 후보키중에서 선택되지 않은 키 ⇒대체키
-- 학년 + 반 +번호

--제약조건 교재 324페이지
CREATE TABLE TEST_2021(
   ID VARCHAR2(7)  NOT NULL, 
   EMAIL VARCHAR2(50) NULL,
   PHONE CHAR(13) NOT NULL,
   PWD VARCHAR2(7) DEFAULT '1111'
);
SELECT * FROM TEST_2021;
--데이터 추가하기
INSERT INTO TEST_2021(ID, EMAIL, PHONE, PWD) VALUES('KKH', 'qhdudrjsgml@gmail.com', '01031635728', '5728');
commit;

--NOT NULL 테스트하기
--필수입력사항들은 NOT NULL 
--CHECK 제약 조건 
CREATE  TABLE TEST_2021_2(
   ID VARCHAR2(50)  , 
   PHONE VARCHAR2(20) CHECK ( PHONE  LIKE  '010-%-____') NOT NULL,
   EMAIL VARCHAR2(50)  NULL
);
INSERT INTO TEST_2021_2(ID, PHONE) VALUES('TEST2', '010-3163-5728');
COMMIT;

--실패
--ORA-02290: 체크 제약조건(SCOTT.SYS_C007576)이 위배되었습니다
INSERT INTO TEST_2021_2(ID, PHONE) VALUES('TEST3', '01033333338');

--ORA-02290: 체크 제약조건(SCOTT.SYS_C007576)이 위배되었습니다
INSERT INTO TEST_2021_2(ID, PHONE) VALUES('TEST3', '010-3163-572');
SELECT * FROM TEST_2021_2;

CREATE  TABLE TEST_2021_22(
   ID VARCHAR2(50)  , 
   PHONE VARCHAR2(20) CHECK ( PHONE  LIKE  '010-%-____') NOT NULL,
   EMAIL VARCHAR2(50)  NULL,
   GRADE CHAR(2) CHECK( GRADE IN ('01','02','03'))
);
INSERT INTO TEST_2021_22(ID, PHONE, GRADE) VALUES('TEST3', '010-3163-5728', '01'); --성공
COMMIT;
--ORA-02290: 체크 제약조건(SCOTT.SYS_C007579)이 위배되었습니다
--INSERT INTO TEST_2021_22(ID, PHONE, GRADE) VALUES('TEST3', '010-3163-5728', '04'); --실패

--교재 327페이지-328페이지
--create table new_emp1 (
--   no number(4) 
--   constraint emp1_no_pk primary key,
--   name varchar2(20) 
--   constraint emp1_name_nn not null,
--   jumin varchar2(13)
--   constraint emp1_jumin_nn  not null 
--   constraint emp1_jumin_uk  unique,
--   loc_code number(1) 
--   constraint emp1_area_ck check( loc_code  <5 ) ,
--   deptno varchar2(6)
--   constraint emp1_deptno_fk references dept2(dcode)
--);
--SELECT * FROM NEW_EMP1;

--create table new_emp2(
--    no number(4) primary key,
--    name varchar2(20) not null ,
--    jumin varchar2(13) not null unique,
--    loc_code number(1) check( loc_code <5),
--    deptno varchar2(6) references dept2(dcode )
--);

--**엔티티제약조건**
--- (테이블 조건) : 테이블안에서 갖는 제약 조건
--- **PRIMARY KEY** (NOT NULL, 종복을 허용하지 않음)
--- **UNIQUE** (중복을 허용하지 않음)
CREATE TABLE TEST_2021_3(
  ID  VARCHAR2(7)   NOT NULL  PRIMARY KEY,
  EMAIL VARCHAR2(50),
  PHONE CHAR(13)  UNIQUE ,
  PWD  VARCHAR2(10)
);

INSERT INTO TEST_2021_3(ID) VALUES('TEST');
COMMIT;

--TEST ID 고객 추가하기
--오류발생 --무결성 제약조건 위배 
INSERT INTO TEST_2021_3(ID) VALUES('TEST');
COMMIT;
SELECT * FROM TEST_2021_3;

--아이디를 제외하고 데이터 추가하기
--INSERT INTO TEST_2021_3(EMAIL, PHONE, PWD) VALUES('TEST@naver.com', '01012341234', '1234');
--COMMIT;

--오류발생
--primary key 반드시 입력해야 한다 
INSERT INTO  TEST_2021_3( ID,EMAIL,PHONE, PWD) VALUES('TEST2', 'test@naver.com' , '010-1111-222' ,'111');
commit;
select * from test_2021_3;

--TEL UNIQUE 제약조건이 있으므로 같은 전화번호 입력 불가
--INSERT INTO  TEST_2021_3( ID,EMAIL,PHONE, PWD) VALUES('TEST3', 'test3@naver.com' , '010-1111-222' ,'111');
--commit;

--관계제약조건 ( 테이블간 제약 조건)
--Foreign key 외래키 설정
--외래키(다른 테이블의 주키를 가지는 것을 말한다. 
--      관계성이 있는 다른 테이블의 값을 가져오기 위해서 필요함
CREATE TABLE MEM_TBL(
   ID VARCHAR2(5)  NOT NULL PRIMARY KEY,
   NAME VARCHAR2(10) NOT NULL ,
   ADDR VARCHAR2(10)
 );
insert into mem_tbl values( 'a1' , '홍길동' , '서울') ;
insert into mem_tbl values( 'a2' , '홍길순', '부산');

create table ord_tbl (
no varchar2(5) not null primary key ,
qty number(4) , 
cus_no varchar2(5) 
);
insert into ord_tbl values( 'j01' , 3, 'a1' );
insert into ord_tbl values( 'j02' , 1, 'a1' );
insert into ord_tbl values( 'j03' , 7, 'a2' );
COMMIT;
SELECT * FROM MEM_TBL;
SELECT * FROM ORD_TBL;

--주문테이블 A3 고객의 주문을 추가해보기
-- 질문? 들어갈까요? 들어간다 => 문제가 발생됨 ( 없는 고객이 주문을 한 상황이 발생됨)
-- => 이것을 막으려면 제약조건을 추가해야한다. 외래키제약조건
insert into ord_tbl values( 'j04' , 7, 'a3' );
COMMIT;

--고객테이블
create table mem_tbl_2 (
id varchar2(5) not null primary key , name varchar2(10) not null , addr varchar2(10)
);
insert into mem_tbl_2 values( 'a1' , '홍길동' , '서울') ;
insert into mem_tbl_2 values( 'a2' , '홍길순', '부산');
commit;
--주문테이블 생성하기
CREATE TABLE  ORD_TBL_2(
   NO VARCHAR2(5) PRIMARY KEY,
   QTY NUMBER(4) NOT NULL,
   CUS_NO VARCHAR2(5)   REFERENCES mem_tbl_2( ID) --관계성 제약조건 추가하기
);
COMMIT;
insert into ord_tbl_2 values( 'j01' , 3, 'a1' );
insert into ord_tbl_2 values( 'j02' , 1, 'a1' );
insert into ord_tbl_2 values( 'j03' , 7, 'a2' );
COMMIT;
SELECT * FROM mem_tbl_2;
SELECT * FROM  ord_tbl_2;

--ORA-02291: 무결성 제약조건(SCOTT.SYS_C007593)이 위배되었습니다- 부모 키가 없습니다
--insert into ord_tbl_2 values( 'j04' , 7, 'a3' );
------------------------------

--// 외래키 설정시    Delete constraint  , update constraint  
--//기본제약조건이  Restricted  //참조하고 있으면 삭제못함                 ==> 별도의 설정이 필요없음 기본값
--//            cascade    // 참조하고 있는 모든 것이 삭제됨                    ==>  on delete cascade
--//            nullify    // 참조하고 있는 것이   null로 채워짐                  ==>  on delete set null 

create table ctbl ( id varchar2(10) primary key , name varchar2(10) )  ;
create table otbl ( code varchar2(10) primary key,  iid  varchar2(10) references ctbl (id) on delete cascade );
insert into ctbl values( 't1' ,  'kim');
insert into ctbl values( 't2'  , 'choi');
insert into otbl values( 'o1', 't1');
insert into otbl values( 'o2', 't1');
commit;
SELECT * FROM ctbl;
select * from  otbl; --//  주문정보가 모두 삭제된것을 확인 할 수 있다.
delete  from ctbl where id  ='t1';   --//  t1고객 삭제시   t1을 참조하는 주문정보가 모두 삭제가 됨
COMMIT;

create table ctbl2 ( id varchar2(10) primary key , name varchar2(10) )  ;
create table otbl2 ( code varchar2(10) primary key,  iid  varchar2(10) references ctbl2 (id) on delete set null );
insert into ctbl2 values( 't1' ,  'kim');
insert into ctbl2 values( 't2'  , 'choi');
insert into otbl2 values( 'o1', 't1');
insert into otbl2 values( 'o2', 't1');
commit;
SELECT * FROM ctbl2;
select * from  otbl2; --//  주문정보가 모두 삭제된것을 확인 할 수 있다.
delete  from ctbl2 where id  ='t1';   --//  t1고객 삭제시   t1을 참조하는 주문정보가 모두 삭제가 됨

select * from tbl_test_order;
select * from tbl_test_customer;

--관계의 종류 1 : 1 , 1 : 다 , 다 : 다
