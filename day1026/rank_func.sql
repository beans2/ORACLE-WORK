--순위 구하기
--전체 순위 구하기
--rank() over(order by 컬럼명 정렬방식) - 중복순위가 발생할 수 있다.
--사원테이블에서 사원번호, 사원명, 연봉, 연봉순위 조회
select * from EMP;

select EMPNO, ENAME, SAL ,rank() over(order by sal)
from emp;

--사원테이블에서 사원번호, 사원명, 연봉, 연봉순위 조회
--단, 중복순위가 발생하지 않도록 처리하여 조회 할 것.
select EMPNO, ENAME, SAL ,row_number() over(order by sal)
from emp;

--조회된 레코드를 그룹별 순위: partition by
--사원테이블에서 사원번호, 사원명, 연보으, 부서별연봉순위 조회
select EMPNO, ENAME, SAL ,
deptno,rank() over(partition by deptno order by sal)
from emp;

select EMPNO, ENAME, SAL ,
deptno,row_number() over(partition by deptno order by sal)
from emp;

---------------------------
----rollup, cube
---------------------------
--rollup: 그룹별 소계를 얻을 때 사용


--사원테이블에서  부서별 ,연봉의 합을 조회하고 총계를 출력

select  deptno,sum(sal)
from    emp
group by   rollup(deptno);

select  deptno,sum(sal)
from    emp
group by   cube(deptno);

--사원테이블에서 부서별 직무의 연봉합,소계 조회


select deptno,job,sum(sal)
from emp
group by rollup(deptno,job)
order by deptno;

--사원테이블에서 부서별, 직무의 연봉합, 직무별 소계, 총계, 조회되는 레코드의 소계조회
select deptno,job,sum(sal)
from emp
group by cube(deptno,job)
order by deptno;


select *
from user_constraints;

desc dept;
