--오라클:시퀀스 생성하기  (일련번호 생성하기)
-- 1. 시퀀스 생성
CREATE SEQUENCE seq_order_id
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

select seq_order_id.nextval from dual;

create table  test0428(
   id varchar2(10) primary key,
   name varchar2(10)
);




drop table acorn;

create table acorn(
    id number(3) primary key,
    name varchar(10) ,
    manager_id number(3) 
);



select * from acorn;

create table acorn(
    id number(3) primary key,
    name varchar(10) ,
    manager_id number(3) 
);



select * from acorn;
insert into acorn values(1, '우주연', null);
insert into acorn values(2, '송주창', 4);
insert into acorn values(3, '이용찬', 4);
insert into acorn values(4, '김재민', 1);
insert into acorn values(5, '장해든', 4);
insert into acorn values(6, '박세인', 4);
insert into acorn values(7, '여도현', 10);
insert into acorn values(8, '고지연', 10);
insert into acorn values(9, '김민경', 10);
insert into acorn values(10, '장윤성', 1);
insert into acorn values(11, '김민정', 10);
insert into acorn values(12, '이정하', 1);
insert into acorn values(13, '손영석', 12);
insert into acorn values(14, '조아진', 12);
insert into acorn values(15, '김태준', 12);
insert into acorn values(16, '나해수', 12);
insert into acorn values(17, '정철진', 20);
insert into acorn values(18, '엄진희', 20);
insert into acorn values(19, '김건희', 20);
insert into acorn values(20, '황스일', 1);
insert into acorn values(21, '이현겸', 20);

commit;


select * from acorn;

select name,id, manager_id, lpad(' ', 5 * (level-1)) || name , level
from acorn 
start with manager_id is null
connect by prior id = manager_id
order siblings by id;

--계층
--댓글


select * from user_indexes;

----------------------------------------------------------------------------------------------------------

DROP TABLE customertbl;

CREATE TABLE customertbl
	( customer_id number NOT NULL PRIMARY KEY,
		first_name varchar2(10) NOT NULL,
		last_name varchar2(10) NOT NULL,
		email varchar2(10),
		phone_number varchar2(20),
		regist_date date
);


INSERT INTO customertbl
VALUES (1, 'Suan', 'Lee', 'suan', '010-1234-1234', '21/01/01');

INSERT INTO customertbl
VALUES (2, 'Elon', 'Musk', 'elon', '010-1111-2222', '21/05/01');

INSERT INTO customertbl
VALUES (3, 'Steve', 'Jobs', 'steve', '010-3333-4444', '21/10/01');

INSERT INTO customertbl
VALUES (4, 'Bill', 'Gates', 'bill', '010-5555-6666', '21/11/01');

INSERT INTO customertbl
VALUES (5, 'Mark', 'Zuckerberg', 'mark', '010-7777-8888', 
'21/12/01');

commit;

--
SELECT *  FROM customertbl;

--
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERTBL';


--인덱스 생성
CREATE INDEX regist_date_idx
ON customertbl (regist_date);

SELECT index_name
FROM user_indexes
WHERE table_name = 'CUSTOMERTBL';

--
SELECT *
FROM customertbl
WHERE regist_date = '21/01/01';

-------------------------------------------------------------------------------------------------------------------
--테스트 테이블

DROP TABLE CUST_INFO;

CREATE TABLE CUST_INFO(
 ID VARCHAR2(13) NOT NULL PRIMARY KEY , 
 FIRST_NM VARCHAR2(10) , 
 LAST_NM VARCHAR2(10) ,
 ANNL_PERF NUMBER(10,2) ,
 SALARY  NUMBER(6) 
);
 
 
INSERT INTO CUST_INFO VALUES ('100' , '김' , '건희', 330.08 ,5000);
INSERT INTO CUST_INFO VALUES ('200' , '고' , '지연', 857.61,5500);
INSERT INTO CUST_INFO VALUES ('110' , '김' , '태준', 76.77,5800);
INSERT INTO CUST_INFO VALUES ('220' , '황' , '스일', 468.54,5900);
INSERT INTO CUST_INFO VALUES ('400' , '김' , '민정', 890,5700);
INSERT INTO CUST_INFO VALUES ('300' , '이' , '현겸', 47.44,5500);

COMMIT;
-------------------------------------------------------------------------------------------------------------------------------------
  CREATE SEQUENCE SEQ_ORDER_ID
    START WITH 1          -- 시작값
    INCREMENT BY 1        -- 1씩 증가
    NOCACHE               -- 캐시 안함 (선택)
    NOCYCLE;              -- 최대값 이후
    
  CREATE SEQUENCE SEQ_DETAIL_ID START WITH 1 INCREMENT BY 1 NOCACHE;




CREATE TABLE ORDERS (
    ORDER_ID        NUMBER(10)        PRIMARY KEY,       -- 주문번호 (PK)
    CUSTOMER_ID     VARCHAR2(50)      NOT NULL,          -- 고객 ID
    ORDER_DATE      DATE              DEFAULT SYSDATE,   -- 주문일자
    TOTAL_AMOUNT    NUMBER(12, 2)     NOT NULL,          -- 총 주문금액
    STATUS          VARCHAR2(20)      DEFAULT 'READY'    -- 주문상태(READY, COMPLETE, CANCEL 등)
);



CREATE TABLE ORDER_DETAIL (
    DETAIL_ID       NUMBER(10)        PRIMARY KEY,       -- 주문 상세번호 (PK)
    ORDER_ID        NUMBER(10)        NOT NULL,          -- 주문번호 (FK)
    PRODUCT_ID      VARCHAR2(50)      NOT NULL,          -- 상품 ID
    QUANTITY        NUMBER(5)         NOT NULL,          -- 수량
    PRICE           NUMBER(12, 2)     NOT NULL,          -- 단가
    SUBTOTAL        NUMBER(12, 2)     NOT NULL           -- 소계 (단가 * 수량)
);
