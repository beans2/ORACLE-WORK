--테이블 복사
--사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회하여 조회한 결과로 CP_EMP라는 테이블을 생성할 것.

create table CP_EMP as(select EMPNO, ENAME, hiredate, SAL from emp);

select * from CP_EMP ;

alter table cp_emp modify SAL, DEPTNO, SAL number(7,2) not null;
 select * from user_constraints;

-- cp_emp 테이블에서 사원번호가 7500~7599 사이에 속한 사원의 사원번호 , 사원명, 입사일, 연봉을 조회하여
--cp_emp2테이블을 생성하고 입력하세요.

create table cp_emp2 as (select * from cp_emp where empno between 7500 and 7599);
select * from CP_EMP2;

--구조만 복사(레코드를 조회하지 않고 서브쿼리를 수행)
--사원테이블에서 사원번호, 사원명, 부서번호, 부서명, 연봉을 레코드가 조회되지 않도록 조회

create table cp_emp3 as (select EMPNO, ENAME, DEPTNO, JOB, SAL from emp where 1=0);

select * from CP_EMP3  ;

