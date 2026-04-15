--HY수강디비
create table tbl_course_300 (
        s_id varchar2(5) not null primary key,
        s_name varchar2(20)  ,
        s_grade number(6),
        teacher_id varchar2(10) ,
        weekday char(2) ,
        start_h number(4),
        end_h  number(4)
);

insert into tbl_course_300 values('1001',  '한식만들기' , 2, 1, 'M' , 0900, 1100 );
insert into tbl_course_300 values('1002',  '양식만들기' , 2, 2, 'TU' , 0900, 1200 );
insert into tbl_course_300 values('1003',  '제과제빵' , 3, 4, 'W' , 0900, 1200 );
insert into tbl_course_300 values('1004',  '중식만들기' , 3, 4, 'TH' , 0900, 1200 );
insert into tbl_course_300 values('1005',  '음료만들기' , 2, 5, 'M' , 1300, 1600 );
insert into tbl_course_300 values('1006',  '분식만들기' , 3, 5, 'TH' , 1500, 1800 );
insert into tbl_course_300 values('1007',  '전통주만들기' , 3, 5, 'W' , 1330, 1630 );
insert into tbl_course_300 values('1008',  '반찬만들기' , 2, 3, 'TH' , 1330, 1530 );
insert into tbl_course_300 values('1009',  '김치만들기' , 3, 3, 'F' , 0900, 1200 );
insert into tbl_course_300 values('1010',  '떡만들기' , 3, 2, 'F' , 1300, 1600 );



create table tbl_lecturer_300(
    t_id number(6) not null primary key,
    t_name varchar2(20)  ,
    major varchar2(20),
    field varchar2(20)
);

 

insert into tbl_lecturer_300 values( 1, '정국교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 2, '뷔교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 3, '지민교수','한식,양식' ,'양식');
insert into tbl_lecturer_300 values( 4, '제이홉교수','한식,양식' ,'한식');
insert into tbl_lecturer_300 values( 5, '슈가교수','제과제빵' ,'제과');
insert into tbl_lecturer_300 values( 6, '진교수','분식및음료' ,'분식');
insert into tbl_lecturer_300 values( 7, 'RM교수','분식및음료' ,'분식');
 

---------------------------------------------------------------------
--배드민턴
create table tbl_court_202301(
court_no varchar2(4) not null primary key,
use char(1)
);
insert into tbl_court_202301 values('C001','N');
insert into tbl_court_202301 values('C002','N');
insert into tbl_court_202301 values('C003','N');
insert into tbl_court_202301 values('C004','N');
insert into tbl_court_202301 values('C005','N');
insert into tbl_court_202301 values('C006','N');
insert into tbl_court_202301 values('C007','N');
insert into tbl_court_202301 values('C008','N');
insert into tbl_court_202301 values('C009','N');

create table tbl_resv_202301(
resv_no char(8) not null primary key,
resv_date char(8),
cust_no varchar2(4),
court_no varchar2(4)
);
insert into tbl_resv_202301 values('20230001','20230221','1001','C005');
insert into tbl_resv_202301 values('20230002','20230221','1002','C004');
insert into tbl_resv_202301 values('20230003','20230221','1003','C003');
insert into tbl_resv_202301 values('20230004','20230221','1004','C002');
insert into tbl_resv_202301 values('20230005','20230221','1005','C001');
insert into tbl_resv_202301 values('20230006','20230221','1005','C001');
insert into tbl_resv_202301 values('20230007','20230221','1005','C001');

create table tbl_cust_202301(
cust_no varchar2(4) not null primary key,
cust_name varchar2(10),
tel varchar2(11)
);

insert into tbl_cust_202301 values('1001','김선수','01011112222');
insert into tbl_cust_202301 values('1002','이선수','01011113333');
insert into tbl_cust_202301 values('1003','박선수','01011114444');
insert into tbl_cust_202301 values('1004','한선수','01011115555');
insert into tbl_cust_202301 values('1005','채선수','01011116666');

----------------------------------------------------------------
--오디션디비
--HY 라운드(LOUD) 오디션프로그램 


create table tbl_join_200(
  join_id varchar2(4)  not null primary key ,
  join_nm varchar2(20)  ,
  birth  char(8),
  gender char(1),
  specialty varchar2(1),
  charm varchar2(30)
);

insert into tbl_join_200 values( 'A001' , '케이쥬',  '20050102' , 'M', 'D', '깜찍댄스');
insert into tbl_join_200 values( 'A002' , '고키',  '20090102' , 'M', 'D', '동전마술');
insert into tbl_join_200 values( 'A003' , '나윤서',  '20070102' , 'M', 'D', '창작댄스');
insert into tbl_join_200 values( 'A004' , '장현수',  '20030103' , 'M', 'R', '보컬');
insert into tbl_join_200 values( 'A005' , '윤민',  '20020205' , 'M', 'V', '자작곡');



--멘토테이블 

create table tbl_mentor_200(
    mentor_id varchar2(4) not null primary key ,
    mentor_nm varchar2(20)
);

insert into tbl_mentor_200 values( 'J001', '박진영');
insert into tbl_mentor_200 values( 'J002', '박재상');
insert into tbl_mentor_200 values( 'J003', '보아');



create table tbl_score_200(
  score_no  number(6) not null ,
  artistid varchar2(4) not null,
  mentorid varchar2(4) not null,
  score number(3),
  primary key( score_no, artistid, mentorid)
);

insert into tbl_score_200 values( 110001, 'A001', 'J001' , 80);
insert into tbl_score_200 values( 110002, 'A001', 'J002' , 90);
insert into tbl_score_200 values( 110003, 'A001', 'J003' , 70);
insert into tbl_score_200 values( 110004, 'A002', 'J001' , 60);
insert into tbl_score_200 values( 110005, 'A002', 'J002' , 50);
insert into tbl_score_200 values( 110006, 'A002', 'J003' , 70);
insert into tbl_score_200 values( 110007, 'A003', 'J001' , 80);
insert into tbl_score_200 values( 110008, 'A003', 'J002' , 60);
insert into tbl_score_200 values( 110009, 'A003', 'J003' , 70);
insert into tbl_score_200 values( 110010, 'A004', 'J001' , 80);
insert into tbl_score_200 values( 110011, 'A004', 'J002' , 78);
insert into tbl_score_200 values( 110012, 'A004', 'J003' , 89);
insert into tbl_score_200 values( 110013, 'A005', 'J001' , 62);
insert into tbl_score_200 values( 110014, 'A005', 'J002' , 91);
insert into tbl_score_200 values( 110015, 'A005', 'J003' , 67);

 
 -------------------------------------------------------------
 --외부평가연습용
  
CREATE TABLE TBL_PRODUCT (
    PCODE   VARCHAR2(10) PRIMARY KEY,
    PNAME   VARCHAR2(50),
    PRICE   NUMBER
);
 
INSERT INTO TBL_PRODUCT VALUES ('AA01', '아메리카노', 3000);
INSERT INTO TBL_PRODUCT VALUES ('AA02', '에스프레소', 3500);
INSERT INTO TBL_PRODUCT VALUES ('AA03', '카페라떼', 4000);
INSERT INTO TBL_PRODUCT VALUES ('AA04', '카라멜마끼', 4500);
INSERT INTO TBL_PRODUCT VALUES ('AA05', '카푸치노', 5000);
INSERT INTO TBL_PRODUCT VALUES ('AA06', '초코퐁키', 6000);
INSERT INTO TBL_PRODUCT VALUES ('AA07', '녹차퐁키', 6500);
INSERT INTO TBL_PRODUCT VALUES ('AA08', '망고쥬스', 7000);
INSERT INTO TBL_PRODUCT VALUES ('AA09', '핫초코', 2500);
 
 
CREATE TABLE TBL_STORE (
    SCODE   VARCHAR2(10) PRIMARY KEY,
    SNAME   VARCHAR2(50)
);
 
INSERT INTO TBL_STORE VALUES ('S001', '강남점');
INSERT INTO TBL_STORE VALUES ('S002', '강서점');
INSERT INTO TBL_STORE VALUES ('S003', '강동점');
INSERT INTO TBL_STORE VALUES ('S004', '강북점');
INSERT INTO TBL_STORE VALUES ('S005', '동대문점');
INSERT INTO TBL_STORE VALUES ('S006', '인천점');
 
CREATE TABLE TBL_SALELIST_01 (
    SALENO    NUMBER PRIMARY KEY,
    PCODE     VARCHAR2(10) NOT NULL,
    SALEDATE  DATE,
    SCODE     VARCHAR2(10) NOT NULL,
    AMOUNT    NUMBER
);
 
INSERT INTO TBL_SALELIST_01 VALUES (100001, 'AA01', TO_DATE('20180902','YYYYMMDD'), 'S001', 50);
INSERT INTO TBL_SALELIST_01 VALUES (100002, 'AA03', TO_DATE('20180902','YYYYMMDD'), 'S002', 40);
INSERT INTO TBL_SALELIST_01 VALUES (100003, 'AA04', TO_DATE('20180902','YYYYMMDD'), 'S002', 20);
INSERT INTO TBL_SALELIST_01 VALUES (100004, 'AA04', TO_DATE('20180902','YYYYMMDD'), 'S001', 30);
INSERT INTO TBL_SALELIST_01 VALUES (100005, 'AA05', TO_DATE('20180902','YYYYMMDD'), 'S004', 40);
INSERT INTO TBL_SALELIST_01 VALUES (100006, 'AA03', TO_DATE('20180902','YYYYMMDD'), 'S004', 30);
INSERT INTO TBL_SALELIST_01 VALUES (100007, 'AA01', TO_DATE('20180902','YYYYMMDD'), 'S003', 40);
INSERT INTO TBL_SALELIST_01 VALUES (100008, 'AA04', TO_DATE('20180902','YYYYMMDD'), 'S004', 10);
INSERT INTO TBL_SALELIST_01 VALUES (100009, 'AA01', TO_DATE('20180902','YYYYMMDD'), 'S003', 20);
INSERT INTO TBL_SALELIST_01 VALUES (100010, 'AA05', TO_DATE('20180902','YYYYMMDD'), 'S003', 30);
INSERT INTO TBL_SALELIST_01 VALUES (100011, 'AA01', TO_DATE('20180902','YYYYMMDD'), 'S001', 40);
 
COMMIT;

----------------------------------------
--한양대CU
create table goods_tbl_500(
goods_cd varchar2(6) not null primary key, 
goods_nm varchar2(30), 
goods_price number(8), 
cost number(8), in_date date
); 


insert into goods_tbl_500 values('110001','육계장사발면',1050,750,'20190302');
insert into goods_tbl_500 values('110002','단팥빵',1300,800,'20190302'); 
insert into goods_tbl_500 values('110003','사브로',2000,1700,'20190302');
insert into goods_tbl_500 values('110004','칠성사이다',900,750,'20190302'); 
insert into goods_tbl_500 values('110005','콜라',750,300,'20190302'); 
insert into goods_tbl_500 values('110006','아몬드초콜릿',1500,1300,'20190302'); 
insert into goods_tbl_500 values('110007','초코몽',850,600,'20190302');


 create table store_tbl_500(
 store_cd varchar2(5) not null primary key,
 store_nm varchar2(20), 
 store_fg varchar2(1)
);

 insert into store_tbl_500 values('A001','노원점','0');
 insert into store_tbl_500 values('A002','마포점','0'); 
insert into store_tbl_500 values('A003','석계점','0'); 
insert into store_tbl_500 values('B001','하계점','1');
 insert into store_tbl_500 values('C001','상계점','1'); 
insert into store_tbl_500 values('D001','중계점','0');
 insert into store_tbl_500 values('D002','태릉입구점','1'); 
insert into store_tbl_500 values('E001','화랑대점','0');


 create table sale_tbl_500(
 sale_no varchar2(4) not null primary key, 
 sale_ymd date not null,
 sale_fg varchar2(1) not null, 
 store_cd varchar2(5)  ,         
 goods_cd varchar2(6) ,
 sale_cnt number(3),
 pay_type varchar2(2),
 constraint  fk1 foreign key (store_cd)  references store_tbl_500(store_cd),
 constraint  fk2  foreign key (goods_cd) references goods_tbl_500(goods_cd)
); 

insert into sale_tbl_500 values('0001','20190325','1','A001','110001',2,'02'); 
insert into sale_tbl_500 values('0002','20190325','1','B001','110003',2,'02');
 insert into sale_tbl_500 values('0003','20190325','1','D001','110003',1,'01'); 
insert into sale_tbl_500 values('0004','20190325','1','A001','110006',5,'02'); 
insert into sale_tbl_500 values('0005','20190325','1','C001','110003',2,'02'); 
insert into sale_tbl_500 values('0006','20190325','2','C001','110003',2,'02');
 insert into sale_tbl_500 values('0007','20190325','1','A002','110005',4,'02');
 insert into sale_tbl_500 values('0008','20190325','1','A003','110004',4,'02');
 insert into sale_tbl_500 values('0009','20190325','1','B001','110001',2,'01');
 insert into sale_tbl_500 values('0010','20190325','1','A002','110006',1,'02');

COMMIT;

SELECT * FROM tbl_lecturer_300; --HY오디션관리
SELECT * FROM tbl_mentor_200;
SELECT * FROM tbl_score_200;
SELECT * FROM TBL_JOIN_200;


DROP  TABLE   tbl_vote_0104;

CREATE TABLE tbl_vote_0104 (
    v_jumin   VARCHAR2(13) PRIMARY KEY,
    v_name    VARCHAR2(20),
    v_area    VARCHAR2(10),
    v_time    VARCHAR2(6),
    v_confirm VARCHAR2(1),
    v_num     NUMBER(4)
);
 
INSERT INTO tbl_vote_0104 VALUES ('800120266419', '김유진', '신당', '0902', 'Y', 1001);
INSERT INTO tbl_vote_0104 VALUES ('810510106542', '이유표', '신당', '0910', 'Y', 1001);
INSERT INTO tbl_vote_0104 VALUES ('820201190123', '김투표', '신당', '1101', 'Y', 1001);
INSERT INTO tbl_vote_0104 VALUES ('830120289011', '정투표', '신당', '1210', 'Y', 1002);
INSERT INTO tbl_vote_0104 VALUES ('841201107621', '최투표', '신당', '1109', 'Y', 1002);
INSERT INTO tbl_vote_0104 VALUES ('850109120876', '강투표', '신당', '1201', 'Y', 1003);
INSERT INTO tbl_vote_0104 VALUES ('860120209321', '안투표', '신당', '1301', 'Y', 1003);
INSERT INTO tbl_vote_0104 VALUES ('821201208761', '오투표', '신당', '0810', 'Y', 1004);
INSERT INTO tbl_vote_0104 VALUES ('830102297652', '문투표', '신당', '0729', 'Y', 1005);
INSERT INTO tbl_vote_0104 VALUES ('880912102839', '송투표', '신당', '0702', 'Y', 1005);
INSERT INTO tbl_vote_0104 VALUES ('870102129081', '유투표', '신당', '0809', 'Y', 1004);
 
CREATE TABLE tbl_member_010 (
    m_no    VARCHAR2(10) PRIMARY KEY,
    m_name  VARCHAR2(20),
    m_jumin VARCHAR2(13),
    m_city  VARCHAR2(6),
    m_degree VARCHAR2(2),
    p_no    NUMBER(2)
);
 
INSERT INTO tbl_member_010 VALUES ('1001', '김후보', '651201208711', '노원', '04', 10);
INSERT INTO tbl_member_010 VALUES ('1002', '이후보', '6001201908323', '중랑', '03', 11);
INSERT INTO tbl_member_010 VALUES ('1003', '최후보', '7006021903232', '마포', '01', 12);
INSERT INTO tbl_member_010 VALUES ('1004', '박후보', '7109123239329', '서초', '02', 10);
INSERT INTO tbl_member_010 VALUES ('1005', '유후보', '6809121293039', '강서', '02', 11);
INSERT INTO tbl_member_010 VALUES ('1006', '정후보', '6201201903933', '강남', '03', 12);
 


CREATE TABLE tbl_party_010 (
    p_no    VARCHAR2(2) PRIMARY KEY,
    p_name    VARCHAR2(20),
    p_tel     VARCHAR2(4),
    v_time    VARCHAR2(4),
    v_confirm VARCHAR2(4)    
);

INSERT INTO tbl_party_010  VALUES ('10', '모정당', '010', '1111' , '2222');
INSERT INTO tbl_party_010   VALUES ('11', '신정당',  '010', '2222' , '3333');
INSERT INTO tbl_party_010  VALUES ('12', '구정당',  '010', '3333' , '4444');
 
commit;


--참가자조회
SELECT JOIN_ID AS 참가자ID
       , JOIN_NM AS 참가자이름
       ,TO_CHAR(TO_DATE(BIRTH,'YYYYMMDD'),'YYYY"년"MM"월"DD"일"') AS 생년월일,
       DECODE(GENDER,'M', '남성', 'W', '여성') AS 성별,
       DECODE(SPECIALTY,'D','댄스', 'R', '랩', 'V', '보컬') AS 실력무대,
       CHARM AS 매력무대
FROM TBL_JOIN_200;

select to_char(birth,'YYYY"년"MM"월"DD"일"')
from tbl_join_200;

select to_char(to_date(birth,'yyyymmdd'),'YYYY"년"MM"월"DD"일"')
from tbl_join_200;

select decode(gender, 'M' ,'남성', 'W', '여성')
from tbl_join_200;


--참가자 점수조회
SELECT S.SCORE_NO AS 계좌번호,
       J.JOIN_ID AS 참가자ID,
       J.JOIN_NM AS 참가자이름,
       TO_CHAR(TO_DATE(J.BIRTH,'YYYYMMDD'),'YYYY"년"MM"월"DD"일"') AS 생년월일,
       S.SCORE AS 점수,
       S.SCORE, 
       CASE WHEN S.SCORE  >= 90 THEN 'A'
            WHEN S.SCORE  >= 80 THEN 'B'
            WHEN S.SCORE  >= 70 THEN 'C'
       ELSE 'D'
       END AS 등급,
       M.mentor_NM AS 멘토
FROM TBL_JOIN_200 J
JOIN TBL_SCORE_200 S
ON J.JOIN_ID = S.ARTISTID
JOIN TBL_MENTOR_200 M
ON S.MENTORID = M.mentor_id;

--참가자 등수 조회
SELECT J.JOIN_ID AS 참가자ID,
       J.JOIN_NM AS 참가자이름,
       SUM(S.SCORE) AS 총합점수,
       ROUND(AVG(S.SCORE),2) AS 평균,
       RANK() OVER(ORDER BY AVG(S.SCORE)DESC) AS 랭크
FROM TBL_JOIN_200 J
JOIN TBL_SCORE_200 S
ON J.JOIN_ID = S.ARTISTID
GROUP BY J.JOIN_ID, J.JOIN_NM;

--참가자 조회(HY대학교 수강신청)
SELECT * FROM TBL_COURSE_300;
SELECT C.S_ID AS 과목코드,C.S_NAME AS 과목명, C.S_GRADE AS 학점 ,L.T_NAME AS  담당강사, 
DECODE(trim(C.WEEKDAY),'M', '월','TU','화','W', '수', 'TH','목','F','금') AS 요일
,SUBSTR(LPAD(C.START_H, 4, '0'), 1, 2) || ':' || SUBSTR(LPAD(C.START_H, 4, '0'), 3, 2) AS 시작시간, 
SUBSTR(LPAD(C.END_H, 4, '0'), 1, 2) || ':' || SUBSTR(LPAD(C.END_H, 4, '0'), 3, 2) AS 끝시간,
'수정/삭제' AS 관리
FROM TBL_COURSE_300 C
JOIN TBL_LECTURER_300 L
ON C.TEACHER_ID = L.T_ID;

-------------------------------국회의원 투표관리
--투표자 조회


--배드민턴
SELECT * FROM tbl_court_202301;
SELECT * FROM tbl_resv_202301;
SELECT * FROM tbl_cust_202301;

--한양CU
SELECT GOODS_CD 상품코드, GOODS_NM 상품명, GOODS_PRICE 판매단가,
        COST "(상품)원가", TO_CHAR(IN_DATE, 'YYYY-MM-DD') 입고일자
FROM goods_tbl_500;

select s.store_nm as 점포명,
       decode(o.pay_type,'01',(o.sale_cnt * g.goods_price),0) as 현금,
       decode(o.pay_type,'02',(o.sale_cnt * g.goods_price),0) as 카드,
       o.sale_cnt,
       g.goods_price,
       o.pay_type
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd = g.goods_cd
join store_tbl_500 s
on s.store_cd = o.store_cd;

--점포별 매출현황
select s.store_nm as 점포명,
       sum(decode(o.pay_type, '01', (o.sale_cnt * g.goods_price), 0)) as 현금,
       sum(decode(o.pay_type, '02', (o.sale_cnt * g.goods_price), 0)) as 카드
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd = g.goods_cd
join store_tbl_500 s
on s.store_cd = o.store_cd
group by s.store_nm;

SELECT  CASE WHEN S.SALE_FG = '1' THEN '판매'
          ELSE '취소'
          END,
         S.SALE_NO, S.SALE_YMD, G.GOODS_NM, S.SALE_CNT, S.SALE_CNT * g.goods_price, 
        CASE WHEN S.PAY_TYPE = '01' THEN '현금'
        ELSE   '카드'
        END
  FROM sale_tbl_500    S
  JOIN goods_tbl_500   G
  ON S.GOODS_CD = G.GOODS_CD
  WHERE S.STORE_CD = 'A001';
  
  
----------정보처리산업기사 외부평가
select * from tbl_product;
select * from TBL_STORE;
select * from TBL_SALELIST_01;

select s.saleno as 비번호, p.pcode as 상품코드,
to_char(s.saledate,'yyyy-mm-dd') as 판매날짜,
s.scode as 매장코드,
p.pname as 상품명,
s.amount as 판매수량,
s.amount * p.price as 총판매액
from tbl_salelist_01 s
join tbl_product p
on s.pcode = p.pcode
order by 1;

select
    s.scode,
    s.sname,
    sum(a.amount * p.price) as 매장총판매액
from tbl_store s
join tbl_salelist_01 a
    on s.scode = a.scode
join tbl_product p
    on a.pcode = p.pcode
where s.sname like '강%'
group by s.scode, s.sname
order by 1;

--상품별 판매액
select p.pcode 상품코드,
p.pname 상품명,
to_char(sum(p.price * a.amount),'999,999') 상품별판매액
from tbl_salelist_01 a
join tbl_store s
on a.scode = s.scode
join tbl_product p
on a.pcode = p.pcode
group by p.pcode,p.pname
order by 1;

----투표자 조회
select * from tbl_vote_0104;
select * from tbl_member_010;
select * from tbl_party_010;

select v_name as 투표자이름,
to_char('19'||substr(v_jumin, 1, 2)|| '년' || substr(v_jumin, 3, 2)|| '월' || substr(v_jumin,5,2) || '일')  as 투표자생년월일,
 v_name,
    TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
    - TO_NUMBER('19' || SUBSTR(v_jumin, 1, 2))
    - CASE
        WHEN TO_NUMBER(SUBSTR(v_jumin, 3, 2)) > TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))
        THEN 1
        ELSE 0
      END AS 나이,
decode(substr(v_jumin,7,1),'1','남성','2','여성') as 투표자성별,
v_area as 투표장 
from tbl_vote_0104;

--후보자 조회
select m.m_no as 후보자번호,
m.m_name as 후보이름, 
substr(m.m_jumin,1,6) || '-' || substr(m.m_jumin,7,7) as 후보자주민번호, 
decode(m.m_degree, '01', '고졸', '02','학사', '03','석사', '04', '박사') as 후보자학위,
m.p_no as 당번호,
to_char(p.p_tel || '-' || p.v_time || '-' || v_confirm) as 당전화번호
from tbl_member_010 m
join tbl_party_010 p
on m.p_no = p.p_no;

