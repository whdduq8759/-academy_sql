

-- 단일행 서브쿼리(신)
-- 서브쿼리의 조회 결과가 1건 이하인 경우


-- 부서번호가 100004번인 부서의 모든 사원정보 조회
SELECT 
*
FROM tb_emp
WHERE dept_cd = '100004';

-- 이나라가 속해 있는 부서의 모든 사원정보 조회


SELECT 
*
FROM tb_emp
WHERE dept_cd = (
        SELECT dept_cd FROM tb_emp WHERE emp_nm= '이관심'
);


-- 20200525에 받은 급여가 회사의 20200525 전체 평균 급여보다 높은 사원들의 정보 조회(덮밥)
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


-- 다중 행 서브쿼리
-- 서브쿼리 조회 건수기 여러 행인 것
-- 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는 사원번호와 보유 자격증 개수를 조회
select * from tb_certi where issue.insti.nm = '한국데이터베이스진흥원';

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
                            select certi_cd from tb_certi where issue.insti.nm = '한국데이터베이스진흥원'
                            )
and a.emp_no = b. emp_no
group by a.emp_no, b.emp_nm
order by a.emp_no;

-- 다중 컬럼 서브쿼리
-- 부서원이 2명 이상인 부서 중에서 각 부서의 가장 나이 많은 사람의 사원정보를 조회


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

--EXISTS문
-- 주소가 강남인 직원들이 근무하고 있는 부서들의 전체정보를 조회

select DISTINCT
a.dept_cd, a.dept_nm
from tb_dept a, tb_emp b
where a.dept_cd = b.dept_cd
and b.addr like '%강남%';


select 
*
from tb_emp 
where addr like '%강남%';


select 
a.dept_cd, a.dept_nm
from tb_dept a
where exists (

                        select
                        'x'
                        from tb_emp b
                        where b.addr like '%강남%'
                        and a.dept_cd = b.dept_cd

);




select
1
from tb_emp
where addr like '%강남%';


--스칼라 서브쿼리(select절에 들어가는 서브쿼리)
select
a.emp_no, a.emp_nm, 
(select b.dept_nm from tb_dept b where a.dept_cd = b.dept_cd) AS dept_nm
,a.addr, a.birth_de, a.sex_cd
from tb_emp a;




-- 인라인 뷰 (from절 안에 넣는 서브쿼리)


