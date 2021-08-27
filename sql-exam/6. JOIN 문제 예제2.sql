--OUTER JOIN, �߰� ����
SELECT * FROM job_history ORDER BY employee_id;

--��� ����� ������ ��ȸ���ǵ� Ȥ�� �������� �̷��� ������ �Բ� ��ȸ�ϰ� �ʹ�. 
SELECT 
E.employee_id, E.first_name, E.hire_date, E.job_id AS "current job"
, J.start_date, J.end_date, J.job_id AS "last job"
FROM employees E
LEFT JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id;








-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.
SELECT 
a.employee_id, a.first_name, a.manager_id, b.first_name AS "manager_name"
FROM employees A
LEFT JOIN employees B
ON a.manager_id = b.employee_id
WHERE a.employee_id = 103
ORDER BY a.employee_id;
-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����
SELECT 
E.first_name,
D.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E
LEFT JOIN departments D
ON E.department_Id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id;

-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
SELECT 
E.first_name,
D.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E
LEFT JOIN departments D
ON E.department_Id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id
WHERE  E.employee_id = 103;
-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
SELECT 
E.first_name,
D.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E
LEFT JOIN departments D
ON E.department_Id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id
WHERE D.department_name LIKE 'IT%';
-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.






































































































































