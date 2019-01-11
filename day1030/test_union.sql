insert into cp_emp3(empno, ename, deptno, job,sal)
values(1112,'이재찬',10,'대리',3500);

insert into cp_emp3(empno, ename, deptno, job,sal)
values(1113,'이재현',20,'차장',7500);

insert into cp_emp3(empno, ename, deptno, job,sal)
values(1114,'정택성',20,'알바',1500);

commit;


--emp: 미국본사, cp_emp3 :한국지사

--미국본사와 한국지사의 연봉 2000 이하인 사원급여를 올려주고 싶어 2000이하인 사원의
--사원번호, 사원명, 연봉, 직무를 조회.
--union 중복데이터 조회x union all 중복데이터가 조회
select empno, ename, sal, job
from emp
where sal<=2000
union all
select empno, ename, sal, job
from cp_emp3
where sal<= 2000;



--cp_emp3에 emp테이블에서 30번 부서사원정보를 모두 추가
insert into cp_emp3(empno,ename,deptno,job, sal)
(select empno,ename, deptno, job,sal from emp where deptno = 30)  ;
commit;

--컬럼의 갯수가 일치x 데이터형이 일치x error발생
select empno, ename, sal
from emp
where sal<=2000
union all
select empno, ename, sal, job
from cp_emp3
where sal<= 2000;

--컬럼의 데이터형이 일치하지 않는 경우 error
select empno, ename, sal ,job
from emp
where sal<=2000
union all
select sal, job,ename, empno
from cp_emp3
where sal<= 2000;


select * from cp_emp3;
select * from EMP;


--intersect:
--미국본사의 사원정보와 한국지사의 사원정보 중 일치하는 정보만 조회

select empno, ename, sal, job
from emp
where sal<=2000
intersect
select empno, ename, sal, job
from cp_emp3
where sal<= 2000;

--minus : 상위 select 에서 조회된 결과를 하위 select에서 조회된 결과에서 뺀
--나머지를 조회

select empno, ename, sal, job
from emp
minus
select empno, ename, sal, job
from cp_emp3
where sal<= 2000;
