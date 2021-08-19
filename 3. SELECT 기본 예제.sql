--SELECT �⺻
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

--DISTINCT : �ߺ��� ����
SELECT DISTINCT
    issue_insti_nm
FROM
    tb_certi;

SELECT DISTINCT
    certi_nm,
    issue_insti_nm
FROM
    tb_certi;

--�� ��Ī ����(ALIAS)
SELECT
    certi_cd        AS "�ڰ��� �ڵ�",
    certi_nm        AS "�ڰ��� �̸�",
    issue_insti_nm  "������"
 -- AS�� ��������!
FROM
    tb_certi; 

--���տ�����(||)�� ����� �÷������� ����
SELECT
    certi_nm
    || '('
    || certi_cd
    || ')-'
    || issue_insti_nm AS "�ڰ��� ����"
FROM
    tb_certi;

-- ���� ���̺�(dual): �ܼ� �������� ��ȸ�ϰ� ���� ��
SELECT
    ( 3 + 7 ) * 5 / 10 AS "���� ���"
FROM
    dual;


--WHERE ������: ��ȸ ��� ���� �����ϴ� ������
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


--PK�� ������ �����ϸ� ������ �������� ��ȸ�˴ϴ�.
SELECT
    emp_no,
    emp_nm,
    tel_no
FROM
    tb_emp
WHERE
    emp_no = 1000000001;

--�� ������ (=, <>, <, <=, >=)
--SQL �񱳿����� (BETWEEN, IN, LIKE)

SELECT
    emp_no,
    emp_nm,
    tel_no
FROM
    tb_emp
WHERE
        birth_de >= '19900101'
    AND birth_de <= '19991231';

--BETWEEN ������
SELECT
    emp_no,
    emp_nm,
    tel_no
FROM
    tb_emp
WHERE
    birth_de BETWEEN '19900101' AND '19991231';
    
    

--IN �����ڸ� ������ ��
SELECT 
  emp_no,
    emp_nm,
     dept_cd
FROM tb_emp
WHERE dept_cd = '100004' OR dept_cd = '100006';

--IN ������
SELECT 
  emp_no,
    emp_nm,
     dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006', '100007');

--NOT IN ������
SELECT 
  emp_no,
    emp_nm,
     dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006', '100007');


--LIKE ������
--���ϵ�ī�� ���� - %: 1���� �̻� ����, _: �� 1���� ����
SELECT
emp_nm, emp_no
FROM tb_emp
WHERE emp_nm Like '��%';


SELECT
emp_nm, emp_no
FROM tb_emp
WHERE emp_nm Like '%��';

SELECT
emp_nm, emp_no
FROM tb_emp
WHERE emp_nm Like '��__';

-- �˻��� �� ���!
SELECT 
    emp_nm, addr, tel_no
FROM tb_emp
WHERE addr LIKE '%��ź��%';


-- ������ �达�̸鼭, �μ��� 100003, 100004, 100006�� �߿� �ϳ��̸鼭, 
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ
SELECT 
emp_no ,emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm Like '��%' 
AND dept_cd IN ('100003', '100004', '100005') 
AND birth_de BETWEEN '19900101' AND '19991231';


-- NULL�� ��ȸ
SELECT 
emp_no ,emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL; -- NULL�� IS�θ� �񱳰���

SELECT 
emp_no ,emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL;

--���� �񱳿�����
SELECT
emp_nm, emp_no, sex_cd, dept_cd
FROM tb_emp
WHERE emp_nm Like '��__'
AND sex_cd <> 1;
-- <>�� !=�� ����






