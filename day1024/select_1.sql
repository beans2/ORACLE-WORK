
--1. 컬럼을 붙여 문자열로 조회: //(or연산자)
--EMP테이블에서 사원번호, 사원명, 직무를 조회
--출력형식은: 사원명(사원번호)님 xxx직무입니다.
--alias는 "로 묶어서 부여하면 대소문자가 가려진 컬럼이 나온다.
--alias는 바로 아래 where절에서 사용할 수 없다. 예를들어 SAL을 S로 바꿔줬는데
--아래 where절에서 S에 조건을 걸면 안된다.
select ename||' ('||empno||' )님 '||job||' 직무입니다.' output
from emp;


--2. 산술연산자 : +,-,*,/
--사원테이블에서 사원번호, 사원명, 연봉, 세금 을 조회
--단, 세금은 연봉에 3.3% 계산하여 출력, 사원번호는 현재 번호에
--10을 더한 값으로 출력.
select empno,empno+10 new_empno/*alians*/, ename, sal, sal*0.033 tex/*alians*/
from emp
order by empno;

--컬럼끼리 연산
select empno-mgr
from emp;

--null은 연산되면 결과가 null이 나온다.
--사원테이블에서 사원번호, 연봉, 보너스, 총수령액을 조회
--단, 총 수령액은 역봉과 보너스를 합산한 금액으로 조회 \
-- null인 컬럼에 연산을 하기 위해서 NULL에 값을 주는 함수: nvl(컬럼명, 값)
select empno,sal,comm,sal+nvl(comm,0) total
from emp;


--나눈 나머지:mod(컬럼명, 나눌값) 함수사용
--dual 테이블: 모든 계정에서 사용할 수 있는 가상 테이블 (오라클에서 간단하게 테스트하라고 준거라고 생각하면 됨)
--            입력되는 값으로 컬럼을 생성하여 조회처리

select '공선의' name, mod(11,3),mod(1992,12)
from dual;
-- 나머지는 0~11이 나온다
--11:양,10:말,9:뱀,8:용,7:토끼,6:호랑이, 5:소, 4:쥐 ,3:돼지, 2:개, 1: 닭, 0:원숭이




--조회하는 컬럼에 관계연산자를 사용하면 Error
select  sal>300
from emp;


--관계연산자: where절, having절 사용
--     >,<,>=,<=,=,!=(<>)

-- 사원테이블에서 연봉이 3000보다 작거나 같은  사원의 사원번호, 사원명,매니저번호, 연봉, 입사일, 부서번호 조회

select empno,ename,mgr, sal ,hiredate, deptno
from EMP
where sal<=3000;


-- 사원테이블에서 연봉이 3000이상인 사원의 사원번호, 사원명,매니저번호, 연봉, 입사일, 부서번호 조회
select empno,ename,mgr, sal ,hiredate, deptno
from EMP
where sal>=3000;

--사월테이블에서 부서번호가 '30'번인 사원들의
--사원번호, 사원명, 직무, 입사일을 조회

select empno, ename, job, hiredate, deptno
from  emp
where deptno = 30;




--사원테이블에서 부서번호가 '20'번이 아닌 사원들의 사원번호, 부서번호, 사원명 , 직무를 조회

select empno, deptno, ename, job
from emp
where deptno <> 20;


--사원테이블에서 보너스가 없는 사원의 사원번호, 사원명, 연봉, 보너스를 조회하세요. (null은 관계연산자로 비교할 수 없다)
-- is null, is not null 로 조회
select empno, ename, sal, comm
from emp
where comm is NULL;




--논리연산자: and(모든 비교 조건이 맞는 레코드를 조회,
-- or(비교조건에 해당하는 모든 레코드를 조회
-- not

--사원테이블에서 사원번호가 7369 이면서 직무가 'clerk'인 사원의 사원번호, 사원명, 직무, 입사일, 연봉을 조회하세요.
select EMPNO, ENAME , JOB, HIREDATE, SAL
from   emp
where  empno=7369 and job = 'CLERK';

--사원테이블에서 연봉이 1500이상 3000이하인 사원들의 사원번호, 사원명, 직무, 연봉 조회
--범위를 검색조건으로 사용할 대에는 between을 사용할 수 있다.
--문법) 컬럼명 between 작은값 and 큰값 => and문보다  between 을 더 많이 쓴다.(가독성이 좋아서)
select EMPNO, ENAME, JOB, SAL
from emp
--where sal>=1500 and sal<=3000;
where sal between 1500 and 3000;

--사원 테이블에서 7902 , 7839,7566 매니저의 관리를 받는  사원의 사원번호, 사원명, 매니저번호, 연봉, 입사일을 조회
--or,는 in()으로 바꿔 사용할 수 있다. 사용법) 컬럼명  in(값,값, 값 ....들) in이 더 짧아서 많이 쓴다.
--in은 포함하는, not in은 포함하지 않는
select EMPNO, ENAME, MGR, SAL, HIREDATE
from  emp
--where mgr=7902 or mgr=7839 or mgr=7566;
where mgr not in(7902,7839,7566); 

--








