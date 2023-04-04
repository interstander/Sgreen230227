DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

CREATE TABLE DEPARTMENT
        (DNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
         DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;
CREATE TABLE EMPLOYEE 
        (ENO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MANAGER  NUMBER(4),
	 HIREDATE DATE,
	 SALARY NUMBER(7,2),
	 COMMISSION NUMBER(7,2),
	 DNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPARTMENT);
CREATE TABLE SALGRADE
        (GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;


--  행주석 주석  
DESC employee;

SELECT sysdate FROM dual;

SELECT eno,ename,job,manager,salary FROM employee;

SELECT * FROM GREEN01.employee;

SELECT eno,ename,salary,salary*12 FROM employee;

SELECT eno,ename,salary,salary*12+commission FROM employee;

SELECT eno, ename,
salary, salary*12+NVL(commission,0) "연 봉"
FROM employee;

SELECT DISTINCT dno, ename FROM employee;

-------------------------------------------------
-- WHERE 조건절
--  예시 급여가 1500 이상인 사람 정보
SELECT * FROM employee
WHERE salary >= 1500;

-- 예시 사원 이름이 SCOTT 인 사원의 사원번호, 이름, 급여를 조회하세요.
SELECT eno,ename,salary FROM employee
WHERE ename='SCOTT';

SELECT eno,ename,salary FROM employee
WHERE ename>'SCOTT';

-- 입사일이 1981.01.01 이전에 입사한 사람의 모든 정보를 출력하세요
SELECT * FROM employee
WHERE hiredate<='1981/01/01';

-- 급여가 1000에서 1500 사이의 사원의 모든 정보를 조회하는 예
SELECT * FROM employee
WHERE salary >= 1000 AND salary <= 1500; 
-- 급여가 1000 미만 이거나 1500 초과인 사원의 모든 정보를 조회하는 예
SELECT * FROM employee
WHERE salary < 1000 OR salary > 1500; 

SELECT * FROM employee
WHERE NOT (salary >= 1000 AND salary <= 1500); 

-- 커미션이 300 이거나 500 이거나 1400인 사원의 모든 정보를 조회하는 예
SELECT * FROM employee
WHERE commission=300 OR commission=500 OR commission=1400;

-- 급여가 1000에서 1500 사이의 사원의 모든 정보를 조회하는 예
SELECT * FROM employee
WHERE salary BETWEEN 1000 AND 1500;

-- 급여가 1000 미만 이거나 1500 초과인 사원의 모든 정보를 조회하는 예
SELECT * FROM employee
WHERE salary NOT BETWEEN 1000 AND 1500;

-- 입사일이 1982년에 입사한 사원을 조회해 봅시다.
SELECT * FROM employee
WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

-- 커미션이 300이거나 500이거나 1400인 사원의 모든 정보
SELECT * FROM employee
WHERE commission IN (300,500,1400);

-- 사원 이름이 'F'로 시작하는 모든 사원정보을 조회   F%
SELECT * FROM employee
WHERE ename LIKE 'F%';

SELECT * FROM employee
WHERE ename NOT LIKE 'F%';
-- 사원 이름에 'M'이 포함된 모든 사원정보을 조회
SELECT * FROM employee
WHERE ename LIKE '%M%';
-- 사원이름이 'N'으로 끝나는 모든 사원정보를 조회
SELECT * FROM employee
WHERE ename LIKE '%N';

-- 사원이름의 두번째 글자가 A인 모든 사원정보를 조회
SELECT * FROM employee
WHERE ename LIKE '_A%';
-- 사원이름의 세번째 글자가 A인 모든 사원정보를 조회
SELECT * FROM employee
WHERE ename LIKE '__A%';

-- 커미션이 null인 모든 사원정보를 조회
SELECT * FROM employee
WHERE commission = null;

SELECT * FROM employee
WHERE commission is null;

-- 커미션이 null이 아닌 모든 사원정보를 조회
SELECT * FROM employee
WHERE commission is not null;

-- 급여를 기준으로 오름차순 정렬하기
SELECT * FROM employee
ORDER BY salary ASC;

SELECT * FROM employee
ORDER BY salary;


-- 급여를 기준으로 내림차순 정렬하기
SELECT * FROM employee
ORDER BY salary DESC;

-- 이름을 기준으로 오름차순 정렬
SELECT * FROM employee
ORDER BY ename ASC;
-- 입사한 날짜 기준으로 내림차순 정렬
SELECT * FROM employee
ORDER BY hiredate DESC;

-- 급여를 기준으로 오름차순 정렬하세요.
-- 동일한 급여를 받는 사람은 이름을 기준으로 내림차순 정렬
SELECT * FROM employee
ORDER BY salary ASC, ename DESC;

SELECT * FROM employee
WHERE salary>=0
ORDER BY ename;

-------------------------------------------------------
-- 타입
-- 문자열 변환 함수  to_char()
SELECT ename, hiredate, 
TO_CHAR(hiredate,'YY-MM'), TO_CHAR(hiredate,'YY-MM-DD DAY'),
TO_CHAR(hiredate,'YY-MM-DD DAY PM HH:MI:SS')
FROM employee;

SELECT TO_CHAR(12345,'0000000') FROM dual;
--                  0012345    
SELECT TO_CHAR(12345,'9999999') FROM dual;
--                  12345 
SELECT TO_CHAR(12345,'L9,999,999') FROM dual;

--------------------------------------------------------------
-- 문자을 날짜로
SELECT * FROM employee
WHERE hiredate = TO_DATE('02198120','MMYYYYDD');

SELECT * FROM employee
WHERE hiredate = '19810220';

-- 문자를 숫자로
SELECT '10000'-'5000' FROM dual;
SELECT TO_NUMBER('10,000','999,999')-TO_NUMBER('5,000','999,999') FROM dual;

----------------------------------------------------------------------------

