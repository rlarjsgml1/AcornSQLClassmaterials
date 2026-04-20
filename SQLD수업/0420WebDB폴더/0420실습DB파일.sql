
CREATE TABLE member2 (
    member_id NUMBER PRIMARY KEY,
    username  VARCHAR2(50),
    password  VARCHAR2(100),
    gender    CHAR(1),
    role2      VARCHAR2(20)
);

CREATE TABLE hobby2 (
    hobby_id NUMBER PRIMARY KEY,
    hobby_name VARCHAR2(50)
);

CREATE TABLE member_hobby2 (
    member_id NUMBER,
    hobby_id NUMBER,
    CONSTRAINT fk_member FOREIGN KEY(member_id) REFERENCES member2(member_id),
    CONSTRAINT fk_hobby FOREIGN KEY(hobby_id) REFERENCES hobby2(hobby_id),
    PRIMARY KEY (member_id, hobby_id)
);

-- hobby 기본 데이터 (미리 넣어둠)
INSERT INTO hobby2 VALUES (1, '운동');
INSERT INTO hobby2 VALUES (2, '독서');
INSERT INTO hobby2 VALUES (3, '게임');
INSERT INTO hobby2 VALUES (4, '여행');

commit;

-- 회원 ID용 시퀀스 생성
CREATE SEQUENCE member_seq
START WITH 1      -- 시작값
INCREMENT BY 1    -- 증가값
NOCACHE           -- 캐시 사용 안 함 (선택 사항)
NOCYCLE;          -- 순환하지 않음

commit;

select  *  from member_hobby2;

select  *  from member2;

select * from hobby2;