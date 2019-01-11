--outer join :어느 한쪽 테이블에만 레코드가 존재하더라도 조회
--모든 부서의 부서번호, 부서명,사원번호, 사원명, 입사일을 조회
--ANSI )left나 right를 사용할 때 레코드가 있는 쪽 테이블 지정
--레코드의 구조를 잘 모른다면 fuu outer join을 하여 처리한다.
select d.deptno,e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  emp e
left /*outer*/ join dept d
on  e.deptno = d.deptno;
-- ==>emp에는 부서번호가 10,20,30 이있고,  dept에는 부서번호가 10,20,30,40 이 있으므로 40이 출력되도록 dept에 있다==> dept left join

-------------------------------------------------------------------------------------------
--oracle ) 조인조건에 레코드가 없는 쪽에 (+)를 붙인다.
select d.deptno,e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  emp e, dept d
where (e.deptno(+) = d.deptno);

select * from DEPT;
select * from EMP;
--제조사가 '현대','기아'안 모든 차량의 제조국, 제조사, 모델명, 연식, 가격, 옵션을 조회
select cc.country, cc.maker, cma.model, cmo.price, cmo.car_option
from car_country cc, car_maker cma, car_model cmo
where (cma.maker = cc.maker and cmo.model(+) = cma.model)
and 	cma.maker in('현대','기아');

select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

--모델명이 'k5','K7','소나타','Ccalss','A6' 인 모든 차량의
--제조국, 제조사,모델명, 연식, 가격을 조회하시오
--단, 가격의 내림차순으로 정렬하여 조회할 것, 가격이 같다면
--연식의 내림차순으로 정렬할 것.

--ANSI)
select cc.country,cma.model, cma.model, cmo.price
from car_country cc
left join car_maker cma
on  cma.maker = cc.maker
left join car_model cmo
on cmo.model = cma.model
where cma.model in('K5','K7','소나타','Cclass','A6')
order by cmo.price desc;

----------------------------------------------------------------------
--oracle
select cc.country,cma.model, cma.model, cmo.price
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model= cmo.model(+))
and cma.model in('K5','K7','소나타','Cclass','A6')
order by cmo.price desc;

--사원테이블에서 사원명이 'scott'인 사원보다 연봉을 작게 받는 사원의
--사원번호, 사원명, 입사일, 연봉을 조회
select empno, ename, hiredate
from emp
where sal<=(select sal from emp where ename = 'SCOTT' ) ;
select * from EMP;
-------------------------------------------------------------------


-------------------------------------------------------------






