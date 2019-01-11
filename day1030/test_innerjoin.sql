--inner join 서로다른 테이블에 같은 값이 있는 경우에만 조회

--사원번호, 사원명, 부서번호(driving table로 잡음), 부서명, 위치, 연봉 조회
--ANSI
select e.empno, e.ename, e.deptno,d.dname, d.loc, e.sal
from   emp e
inner join dept  d
on  	d.deptno= e.deptno;

select * from emp;
--내가 한 oracle 조인
select empno,ename,emp.deptno, dname, loc, sal
from emp, dept
where emp.deptno = dept.deptno;

--내가 한 oracle 조인2
select empno, ename,e.deptno, dname, loc, sal
from emp e, dept d
where e.deptno = d.deptno;


--oracle 조인
select e.empno, e.ename, e.deptno,d.dname, d.loc, e.sal
from   emp e,dept d
where e.deptno =d.deptno;
----------------------------------------------------------------------------
--자동차테이블에 프라이머리, 포린키 넣기
select * from CAR_COUNTRY; --     메이커,제조국
select * from CAR_MODEL;   --모델,연식, 가격, 가격, 옵션,이미지, 입고일
select * from CAR_MAKER; --모델 ,메이커

--제조국에 pk넣기 ==> 중복데이터x ==> maker로
select * from user_constraints;
alter table car_country add constraint pk_car_country primary key(maker);
--제조사 테이블에 fk설정 ==> maker로
alter table car_maker add constraint fk_maker
foreign key(maker) references car_country(maker);
--제조사 테이블에 pk설정 (중복데이터 x) ==> model로
alter table car_maker add constraint pk_car_maker primary key(model);
--모델테이블 fk설정 ==> 중복데이터가 아닌게 없으므로 fk만 지정
alter table car_model add constraint fk_model
foreign key(model) references car_maker(model);


-- 모델명이 '아반테','소나타','A8'인 차량의 제조국, 제조사, 모델명, 연식, 가격, 이미지명 조회
--제조사, 제조국 => car country
--제조사, 모델명 => car maker
--모델명, 연식, 가격, 이미지 == > car models

--ANSI
select    cc.country, cc.maker, cma.model ,cmo.car_year ,cmo.price ,cmo.car_img
from   car_country  cc
inner join car_maker  cma
on    cma.maker = cc.maker
inner join car_model cmo
on    cmo.model = cma.model
where cmo.model in('아반테','소나타','A8');

--oracle
select cc.country, cc.maker, cma.model ,cmo.car_year ,cmo.price ,cmo.car_img
from car_country  cc, car_maker cma, car_model cmo
where (cma.maker=cc.maker and cmo.model= cma.model) and cmo.model in('아반테','소나타','A8')  ;

select * from CAR_COUNTRY; --     maker, country
select * from CAR_MODEL;   --모델,연식, 가격, 가격, 옵션,이미지, 입고일
select * from CAR_MAKER; --모델 ,메이커
------------------------------------------------------------------------------------------
--사원번호, 사원명, 연봉, 입사일, 부서번호, 부서명, //위치, 우편번호, 시도, 구군, 동, 번, 번지를 조회하세요.
--사원테이블의 사원번호와 우편번호 테이블의 seq를 조인조건으로 사용

--ANSI
select  e.empno, e.ename, e.sal, e.hiredate, e.deptno,d.loc, e.deptno, z.zipcode, z.sido, z.GUGUN, z.dong, z.bunji
from  dept d
inner join emp e
on  e.deptno = d.deptno
inner join zipcode z
on  z.seq = e.deptno;

--oracle
select  e.empno, e.ename, e.sal, e.hiredate, e.deptno,d.loc, e.deptno, z.zipcode, z.sido, z.GUGUN, z.dong, z.bunji
from  dept d, emp e, zipcode z
where (e.deptno = d.deptno and z.seq = e.deptno);

------------------------------------------------------------------------------------------
                                                                           






------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------












