

-- ������ ��������(��)
-- ���������� ��ȸ ����� 1�� ������ ���


-- �μ���ȣ�� 100004���� �μ��� ��� ������� ��ȸ
SELECT 
*
FROM tb_emp
WHERE dept_cd = '100004';

-- �̳��� ���� �ִ� �μ��� ��� ������� ��ȸ


SELECT 
*
FROM tb_emp
WHERE dept_cd = (
        SELECT dept_cd FROM tb_emp WHERE emp_nm= '�̰���'
);


-- 20200525�� ���� �޿��� ȸ���� 20200525 ��ü ��� �޿����� ���� ������� ���� ��ȸ(����)
SELECT 
a.emp_no, a.emp_nm, b.pay_de, b.pay_amt
FROM tb_emp A
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
where b.pay_de = '20200525'
and b.pay_amt >= (
                                
                                select 
                                avg(pay_amt)
                                from tb_sal_his
                                where pay_de = '20200525'

)
order by emp_no, b.pay_de;


-- ���� �� ��������
-- �������� ��ȸ �Ǽ��� ���� ���� ��
-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����ȣ�� ���� �ڰ��� ������ ��ȸ
select * from tb_certi where issue.insti.nm = '�ѱ������ͺ��̽������';

select
a.emp_no, b.emp_nm, count(certi_cd) 
from tb_emp_certi A, tb_emp B
where certi_cd in  ('100001', '100002', '100003', '100004', '100005', '100006' )
group by a.emp_no, b.emp_nm
order by a.emp_no;


select
a.emp_no, b.emp_nm, count(certi_cd) 
from tb_emp_certi A, tb_emp B
where certi_cd in (
                            select certi_cd from tb_certi where issue.insti.nm = '�ѱ������ͺ��̽������'
                            )
and a.emp_no = b. emp_no
group by a.emp_no, b.emp_nm
order by a.emp_no;

-- ���� �÷� ��������
-- �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� ���� ���� ���� ����� ��������� ��ȸ


select 
a.emp_no, a.emp_nm, a.birth_de, a.dept_cd,
b.dept_nm
from tb_emp a
join tb_dept b
on a.dept_cd = b.dept_cd
where (a.dept_cd, a.birth_de) in (

                                            select 
                                            dept_cd, min(birth_de)
                                            from tb_emp
                                            group by dept_cd
                                            having count(*) >= 2

)

order by a.emp_no;


select 
dept_cd, min(birth_de)
from tb_emp
group by dept_cd
having count(*) >= 2;

--EXISTS��
-- �ּҰ� ������ �������� �ٹ��ϰ� �ִ� �μ����� ��ü������ ��ȸ

select DISTINCT
a.dept_cd, a.dept_nm
from tb_dept a, tb_emp b
where a.dept_cd = b.dept_cd
and b.addr like '%����%';


select 
*
from tb_emp 
where addr like '%����%';


select 
a.dept_cd, a.dept_nm
from tb_dept a
where exists (

                        select
                        'x'
                        from tb_emp b
                        where b.addr like '%����%'
                        and a.dept_cd = b.dept_cd

);




select
1
from tb_emp
where addr like '%����%';


--��Į�� ��������(select���� ���� ��������)
select
a.emp_no, a.emp_nm, 
(select b.dept_nm from tb_dept b where a.dept_cd = b.dept_cd) AS dept_nm
,a.addr, a.birth_de, a.sex_cd
from tb_emp a;




-- �ζ��� �� (from�� �ȿ� �ִ� ��������)


