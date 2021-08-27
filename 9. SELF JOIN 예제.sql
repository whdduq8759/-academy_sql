--SELF JOIN
-- 자기 자신의 테이블을 조인하는 개념 
--자기 테이블의 칼럼들을 매칭하여 조회하는 기법

SELECT 
a.emp_no, a.emp_nm, a.direct_manager_emp_no, b.emp_nm 
FROM tb_emp A, tb_emp B
WHERE a.emp_no = b.emp_no;
