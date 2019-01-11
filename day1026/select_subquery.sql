--단수행:
--scalar subquery: select에 조회하는 컬럼의 서브쿼리를 사용하는 것.
--emp테이블에서 사원번호, 사원명, 부서번호, 부서명 조회
--부서명은 dept테이블에 존재
--같은 이름의 컬럼이 존재하면 어떤 테이블의 존재하는 컬럼인지
--구분하여 사용해야합ㄴ디ㅏ.(테이블명.컬럼명)
select empno, ename, deptno,(select dname from dept
where dept.deptno= emp.deptno)
from emp;


insert into cp_emp3
(select empno,ename,deptno,job,sal from emp
where deptno in(10,30));
commit;
--사원테이블에서 사원번호가 '7698'인 사원의 부서번호와 같은 부서번호와
--같은 부서를 cp_emp3테이블에서 조회
--조회 컬럼은 사원번호, 사원명, 부서번호, 직무조회.
select empno,ename, deptno, job
from cp_emp3
where deptno =(select deptno from emp where empno =7698);

--컬럼값의 다중행 서브쿼리 in, any,all,exists
--사원테이블에서 사원번호가 '7698','7566'인 사원의 부서번호와 같은 부서번호와
--같은 부서를 cp_emp3테이블에서 조회
--조회 컬럼은 사원번호, 사원명, 부서번호, 직무조회.

select empno,ename,deptno,job
from cp_emp3
where  deptno
in(select deptno from emp where empno in(7698,7782));


select * from EMP;

--외부값을 입력받기:
--쿼리문에 &변수명 -입력창이 동작 입력창에 입력한 값이 query에 대입.
--&변수명이 쿼리문에 그대로 대입되므로 문자열을 입력한 경우 ''로 묶어 주어야 에러가 발생하지 않는다.
select * from emp where deptno=&deptno;
select * from emp where ename='&ename';

--exists: 서브쿼리에 값이 존재한다면 바깥쿼리를 수행
--사원테이블에서 입력되는 부서번호가 존재한다면 사원번호,
--사원명, 입사일,부서번호로를 조회

select empno, ename, hiredate, deptno
from        emp
where exists(select deptno from emp where deptno = &deptno);

--all:and < :서브쿼리에 조회된 값 중 가장 작은 값으로 비교 수행
--        >: 서브쿼리에 조회된 값 중 가장 큰 값으로 비교 수행
--입력된 부서에서 가장 연봉이 작은 사원보다, 연봉이 작은 사원을 조회

select empno,ename, sal
from emp
where sal > all(select sal from EMP where deptno =&d_no);

--any:or
select empno,ename, sal
from emp
where sal < any(select sal from EMP where deptno =&d_no);


-----------------
--rownum: 조회된 결과에 순차적인 번호를 붙이는 가상컬럼
-----------------
--번호, 사원번호, 사원명, 입사일 조회
--단, 번호는 조회결과에 1 부터 순차적으로 부여되어야 한다.
--order by와 같이 사용되면 번호가 섞이게된다.
select  rownum,empno,ename
from  emp
order by ename;

--rownum은 where절에서 사용하면 1번부터는 조회가 되나
--1번이 아닌 번호는 조회되지 않는다.
--사원테이블에서 사원번호, 사원명, 입사일 연봉을 조회
--단, 출력은 조회순서의 1~5까지만 출력
select rownum,empno,ename,hiredate,sal
from  emp
where rownum between 1 and 10;


--복수행 서브쿼리
--조회결과(inline view) 를 가지고 재 조회
/*
select 컬럼명....
from (select ...)
*/

select rownum,empno, ename, sal, hi
from (select rownum,empno, ename, sal, hiredate hi
			from emp);

--사원테이블에서 가장 마지막에 입사한 사원부터 5명 조회
--조회 컬럼, 사원번호, 사원명, 입사일을 조회
select rownum,empno,ename,hiredate
from (select empno,ename,hiredate  from emp order by hiredate desc)
where rownum between 1 and 5;

--사원테이블에서 가장 마지막에 입사한 이전 사원부터 5명 조회
--조회컬럼: 사원번호, 사원명, 입사일

select rownum,empno,ename,hiredate
from(
select rownum r,empno,ename, hiredate
from (select empno, ename, hiredate from emp order by hiredate desc)
)
where r between 2 and 6;

select *
from user_constraints;


