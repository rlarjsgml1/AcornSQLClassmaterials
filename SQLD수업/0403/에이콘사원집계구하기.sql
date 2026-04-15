
CREATE TABLE empSample (
    empno    NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY, -- 사원번호
    ename    VARCHAR2(10),                           -- 이름
    job      VARCHAR2(9),                            -- 직급
    mgr      NUMBER(4),                              -- 상급자 사번
    hiredate DATE,                                   -- 입사일
    sal      NUMBER(7,2),                            -- 급여
    comm     NUMBER(7,2),                            -- 커미션
    deptno   NUMBER(2)                               -- 부서번호
);



INSERT INTO empSample VALUES (7369, '김건희',  'CLERK',     7902, TO_DATE('1980-12-17','YYYY-MM-DD'),  800, NULL, 20);
INSERT INTO empSample VALUES (7499, '김태준',  'SALESMAN',  7698, TO_DATE('1981-02-20','YYYY-MM-DD'), 1600,  300, 30);
INSERT INTO empSample VALUES (7521, '고지연',   'SALESMAN',  7698, TO_DATE('1981-02-22','YYYY-MM-DD'), 1250,  500, 30);
INSERT INTO empSample VALUES (7566, '황스일',  'MANAGER',   7839, TO_DATE('1981-04-02','YYYY-MM-DD'), 2975, NULL, 20);
INSERT INTO empSample VALUES (7654, '이현겸', 'SALESMAN',  7698, TO_DATE('1981-09-28','YYYY-MM-DD'), 1250, 1400, 30);
INSERT INTO empSample VALUES (7698, '이용찬',  'MANAGER',   7839, TO_DATE('1981-05-01','YYYY-MM-DD'), 2850, NULL, 30);
INSERT INTO empSample VALUES (7782, '여도현',  'MANAGER',   7839, TO_DATE('1981-06-09','YYYY-MM-DD'), 2450, NULL, 10);
INSERT INTO empSample VALUES (7788, '김민정',  'ANALYST',   7566, TO_DATE('1987-04-19','YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO empSample VALUES (7839, '박세인',   'PRESIDENT', NULL, TO_DATE('1981-11-17','YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO empSample VALUES (7844, '조아진', 'SALESMAN',  7698, TO_DATE('1981-09-08','YYYY-MM-DD'), 1500,    0, 30);
INSERT INTO empSample VALUES (7876, '정철진',  'CLERK',     7788, TO_DATE('1987-05-23','YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO empSample VALUES (7900, '나해수',  'CLERK',     7698, TO_DATE('1981-12-03','YYYY-MM-DD'),  950, NULL, 30);
INSERT INTO empSample VALUES (7902, '손영석',   'ANALYST',   7566, TO_DATE('1981-12-03','YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO empSample VALUES (7934, '송주창', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO empSample VALUES (7930, '이정하', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO empSample VALUES (7931, '엄진희', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO empSample VALUES (7932, '장윤성', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);

commit;


--전체조회하기
SELECT * FROM EMPSAMPLE;
--전체 급여합계
SELECT SUM(SAL) FROM  EMPSAMPLE;
--전체 급여 평균 구하기
SELECT AVG(SAL) FROM EMPSAMPLE;
--전체 사원수 구하기
SELECT COUNT(ENAME) AS 전체사원수구하기 FROM EMPSAMPLE;
--부서별 직원 수 구하기
SELECT DEPTNO, COUNT(*) AS 직원수 FROM EMPSAMPLE GROUP BY DEPTNO;
--직급별 평균 급여구하기
SELECT JOB, AVG(SAL) AS 직급별평균급여 FROM EMPSAMPLE GROUP BY JOB;
--부서별 최대급여 구하기  -커미션이 있는 직원만 대상으로 ( 커미션 NULL이 아닌 직원대상)

SELECT MAX(SAL) FROM EMPSAMPLE;
SELECT DEPTNO, SAL, COMM FROM EMPSAMPLE
WHERE COMM IS NOT NULL;

SELECT DEPTNO, SUM(SAL)
FROM EMPSAMPLE
WHERE COMM IS NOT NULL
GROUP BY DEPTNO;

SELECT DEPTNO, SUM(SAL) 
FROM EMPSAMPLE 
GROUP BY DEPTNO;

SELECT DEPTNO, MAX(SAL) AS 최대급여 FROM EMPSAMPLE WHERE COMM IS NOT NULL GROUP BY DEPTNO;
--부서별 직급변 직원 수 구하기
SELECT DEPTNO, JOB, COUNT(*) AS 직원수 FROM EMPSAMPLE GROUP BY DEPTNO,JOB;