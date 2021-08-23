-- GROUP BY, HAVING
--1. 집계 함수
SELECT 
COUNT(emp_no) AS "총 사원수",
MAX(birth_de) AS "가장 영한 사람",
MIN(birth_de) AS "가장 올드 사람"
FROM tb_emp;

SELECT 
COUNT (*),
COUNT (direct_manager_emp_no)
FROM tb_emp;

--2. GROUP BY: 테이블 내에서 그룹화할 때
--ex) 부서별로 가장 어린사람의 생년월일, 가장 나이많은 사람의 생년월일, 부서별 직원 수를 알고 싶음

SELECT birth_de, dept_cd
FROM tb_emp
ORDER BY dept_cd; --정렬: ASC - 오름차(기본값) / DESC(내림차)


SELECT 
dept_cd,
COUNT (*) AS "부서별 직원 수",
MAX(birth_de) AS "가장 영한 사람",
MIN(birth_de) AS "가장 올드 사람"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd;

--HAVING절 : 그룹화된 결과에서 조건을 걸어 행 수를 제한
SELECT 
dept_cd,
COUNT (*) AS "부서별 직원 수",
MAX(birth_de) AS "가장 영한 사람",
MIN(birth_de) AS "가장 올드 사람"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) >= 2
ORDER BY dept_cd;




--사원별로 급여를 제일 많이 받은 액수, 제일 적게 받은 액수, 평균액수 수리수리 마수리
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de; -- emp_no로 정렬한 후 같은값들끼리는 pay_de로 재정렬


SELECT 
emp_no,
MAX(pay_amt) AS "최고 수령액",
MIN(pay_amt) AS "최소 수령액",
TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999,99' )AS "평균 수령액"

FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no;



--평균 급여가 470만원 이상인 사원만 조회하고 싶음
SELECT 
emp_no,
MAX(pay_amt) AS "최고 수령액",
MIN(pay_amt) AS "최소 수령액",
TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999,99' )AS "평균 수령액"

FROM tb_sal_his
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4700000
ORDER BY emp_no;



--2019년 1년간 평균 급여가 450만원 이상인 사원만 조회하고 싶음
SELECT 
emp_no,
MAX(pay_amt) AS "최고 수령액",
MIN(pay_amt) AS "최소 수령액",
TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999,99' )AS "평균 수령액"

FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no;

--2019년 1년간 사원별 연봉을 추가 조회
SELECT 
emp_no,
MAX(pay_amt) AS "최고 수령액",
MIN(pay_amt) AS "최소 수령액",
TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999,99' )AS "평균 수령액",
TO_CHAR(ROUND(SUM(pay_amt)), 'L999,999,999,99' ) AS "연봉"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no

ORDER BY emp_no;

-- 정렬 ORDER BY
-- ASC - 오름차(기본값) / DESC(내림차)
-- 항상 SELECT절의 맨 마지막줄에 위치 치킨먹고 싶다 구구구구 구구콘
SELECT 
emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;



SELECT 
emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no;


SELECT 
emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC;

SELECT 
emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no;


