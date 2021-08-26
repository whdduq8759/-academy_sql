-- # �ǽ� ����
-- 1. employees, departments���̺��� INNER JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
E.first_name, D.department_id, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id;

SELECT 
E.first_name, department_id, D.department_name
FROM employees E
JOIN departments D USING 
(department_id);
-- 2. employees, departments���̺��� NATURAL JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
 E.first_name, department_id, D.department_name
FROM
employees E NATURAL JOIN departments D;

SELECT
 E.first_name, department_id, D.department_name
FROM
employees E 
JOIN departments D
USING (department_id, manager_id);


-- 3. employees, departments���̺��� JOIN ON�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
E.first_name, D.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id;

