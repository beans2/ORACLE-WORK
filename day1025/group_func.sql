--집계함수 -컬럼의 값을 하나로 만들어 반환하는 함수들
-- count: null이 아닌 컬럼의 갯수를 셀 때
--사원테이블에 레코드 수(사원수), 보너스를 수령하는 사원 수,보너스를 수령하지 않는 사원수 ,매니저가 있는 사원수
select count(empno),count(comm), count(*)-count(comm),count(mgr)
from emp;

--연봉 합, 보너스의 합 ,인건비의 총합
select sum(sal),sum(comm),sum(sal)+sum(comm)
from emp;

--연봉 평균   ,보너스 평균
select trunc(avg(sal),0), avg(comm)
from emp;

--최고 연봉액,최저 연봉액, 두 값의 차이
select max(sal),min(sal),max(sal)-min(sal)
from emp;
--where max(sal)=5000;


--**where 에서는 집계함수를 사용할 수 없다.
--사원테이블에서 평균 연봉보다 많이 수령하는 사원의 사원번호,
--사원명, 연봉, 입사일을 조회해라
select ENAME, EMPNO, SAL, HIREDATE
from emp
where sal> (select avg(sal) from emp);

--집계함수는 group by와 함께 사용하면 그룹집계를 낼 수 있다.
--부서번호, 부서별 인원수 , 부서별 연봉의 합 , 연봉평균, 최고연봉액, 최저연봉액
select count(deptno), sum(sal),trunc(avg(sal),2),max(sal),min(sal)
from  emp
group by deptno
order by deptno;

--사원테이블에서 매니저별 관리인원수, 최고연봉과 최저연봉, 최고 연봉과 최저연봉의 차이

select count(mgr), max(sal), min(sal), max(sal)-min(sal)
from emp
where mgr is not null
group by mgr;

select * from EMP;

--------- 날짜함수
---날짜에 +를 사용하면 일을 더한다.
select sysdate+100 from dual;

select add_months(sysdate,7)
from dual;


select months_between('2018-11-25', sysdate)from dual;



