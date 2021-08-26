-- INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.

SELECT 
E.emp_no, E.emp_nm, E.dept_cd, D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
AND addr LIKE '%용인%'
ORDER BY E.emp_no;


SELECT 
*
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
AND addr LIKE '%용인%'
ORDER BY E.emp_no;

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며, ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 조인하며 결과집합에서 한번만 표기됩니다.

SELECT 
E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E NATURAL JOIN tb_dept D;


SELECT 
*
FROM tb_emp E NATURAL JOIN tb_dept D;



-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름이 일치하는 모든 컬럼에 대해 조인이
--    일어나지만 USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다.

SELECT 
E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D USING (dept_cd);



-- # JOIN ON절
-- 1. 조인 조건 서술부(ON절)와 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.
SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C, tb_dept D
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.dept_cd = D.dept_cd
;



SELECT 
E.emp_no, E.emp_nm, E.dept_cd, D.dept_nm
FROM tb_emp E 
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE addr LIKE '%용인%'
ORDER BY E.emp_no;


-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];


SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A 
JOIN tb_emp_certi B 
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd
JOIN tb_dept D
ON  A.dept_cd = D.dept_cd
;




