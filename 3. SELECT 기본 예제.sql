--SELECT 기본
SELECT
    certi_cd,
    certi_nm
FROM
    tb_certi;

SELECT
    certi_nm
FROM
    tb_certi;

SELECT
    *
FROM
    tb_certi;

--DISTINCT : 중복값 제거
SELECT DISTINCT
    issue_insti_nm
FROM
    tb_certi;

SELECT DISTINCT
    certi_nm,
    issue_insti_nm
FROM
    tb_certi;

--열 별칭 지정(ALIAS)
SELECT
    certi_cd        AS "자격증 코드",
    certi_nm        AS "자격증 이름",
    issue_insti_nm  "발행기관"
 -- AS는 생략가능!
FROM
    tb_certi; 

--결합연산자(||)를 사용한 컬럼데이터 결합
SELECT
    certi_nm
    || '('
    || certi_cd
    || ')-'
    || issue_insti_nm AS "자격증 정보"
FROM
    tb_certi;

-- 더미 테이블(dual): 단순 연산결과를 조회하고 싶을 때
SELECT
    ( 3 + 7 ) * 5 / 10 AS "연산 결과"
FROM
    dual;


--WHERE 조건절: 조회 결과 행을 제한하는 조건절
SELECT
    *
FROM
    tb_emp;

SELECT
    emp_no,
    emp_nm,
    addr
FROM
    tb_emp
WHERE
    sex_cd = 1;


--PK로 조건을 제한하면 무조건 단일행이 조회됩니다.
SELECT
    emp_no,
    emp_nm,
    tel_no
FROM
    tb_emp
WHERE
    emp_no = 1000000001;

--비교 연산자 (=, <>, <, <=, >=)
--SQL 비교연산자 (BETWEEN, IN, LIKE)

SELECT
    emp_no,
    emp_nm,
    tel_no
FROM
    tb_emp
WHERE
        birth_de >= '19900101'
    AND birth_de <= '19991231';

--BETWEEN 연산자
SELECT
    emp_no,
    emp_nm,
    tel_no
FROM
    tb_emp
WHERE
    birth_de BETWEEN '19900101' AND '19991231';
    
    

--IN 연산자를 사용안한 것
SELECT 
  emp_no,
    emp_nm,
     dept_cd
FROM tb_emp
WHERE dept_cd = '100004' OR dept_cd = '100006';

--IN 연산자
SELECT 
  emp_no,
    emp_nm,
     dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006', '100007');

--NOT IN 연산자
SELECT 
  emp_no,
    emp_nm,
     dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006', '100007');


--LIKE 연산자
--와일드카드 매핑 - %: 1글자 이상 포함, _: 딱 1글자 포함
SELECT
emp_nm, emp_no
FROM tb_emp
WHERE emp_nm Like '이%';


SELECT
emp_nm, emp_no
FROM tb_emp
WHERE emp_nm Like '%오';

SELECT
emp_nm, emp_no
FROM tb_emp
WHERE emp_nm Like '이__';

-- 검색할 때 사용!
SELECT 
    emp_nm, addr, tel_no
FROM tb_emp
WHERE addr LIKE '%매탄동%';


-- 성씨가 김씨이면서, 부서가 100003, 100004, 100006번 중에 하나이면서, 
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회
SELECT 
emp_no ,emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm Like '김%' 
AND dept_cd IN ('100003', '100004', '100005') 
AND birth_de BETWEEN '19900101' AND '19991231';


-- NULL값 조회
SELECT 
emp_no ,emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL; -- NULL은 IS로만 비교가능

SELECT 
emp_no ,emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL;

--부정 비교연산자
SELECT
emp_nm, emp_no, sex_cd, dept_cd
FROM tb_emp
WHERE emp_nm Like '이__'
AND sex_cd <> 1;
-- <>은 !=와 같다






