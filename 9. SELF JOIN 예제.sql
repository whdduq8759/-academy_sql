--SELF JOIN
-- �ڱ� �ڽ��� ���̺��� �����ϴ� ���� 
--�ڱ� ���̺��� Į������ ��Ī�Ͽ� ��ȸ�ϴ� ���

SELECT 
a.emp_no, a.emp_nm, a.direct_manager_emp_no, b.emp_nm 
FROM tb_emp A, tb_emp B
WHERE a.emp_no = b.emp_no;
