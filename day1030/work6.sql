/*1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
    이미지,입력일,배기량, 옵션을 조회
   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
     입력일은 월-일-년 의 형식으로 출력 할것.
*/
select  r, country, maker, model, to_char(car_year,'9,999') car_year, to_char(price,'9,999') price,
	   car_img, to_char(hiredate,'mm-dd-yyyy') price,cc,substr(car_option,1,instr(car_option,',')) car_option
from (
	select rownum r, country, maker, model, car_year, price, car_img, hiredate,cc, car_option
	from (
		select cc.country, cma.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img, cmo.hiredate, cmo.cc, cmo.car_option
		from car_country cc, car_maker cma, car_model cmo
		where (cc.maker = cma.maker and cma.model = cmo.model) and (cmo.cc between 1500 and 3000)
		order by cmo.cc desc
		)
	 )
where r between 3 and 6;

---




select r, country, maker, model, to_char(car_year,'9,999,999') car_year, to_char(price,'9,999,999')
car_img, to_char(hiredate,'mm-dd-yyyy') hiredate, cc,substr(car_option,instr(car_option,'_')+1) car_option
from (select rownum r,country, maker, model, car_year, price, car_img, hiredate, cc, car_option
	 from (select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img, cmo.hiredate, cmo.cc,cmo.car_option
		  from car_country cc, car_maker cma, car_model cmo
		  where (cc.maker = cma.maker and cma.model = cmo.model) and cmo.cc between 1500 and 3000
		  order by cmo.cc desc
		  )

	)
where r between 3 and 6;

------

select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate


-------------------------------------------------------------------------------------------
/*2. 부서번호가 10과 30,40번인 모든 부서의
사원번호,사원명, 입사일,연봉,연봉순위,부서명, 부서번호, 위치, 우편번호, 시도, 구군, 동, 번지를 조회.
단, 출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
우편번호는 '-'뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체하여 출력,
입사일은 월-일-년 요일까지 출력.
*/
select rank() over(order by sal) salrank,r,ename, to_char(hiredate,'dd-mm-yyyy day'), sal, loc, substr(zipcode,instr(zipcode,'-')+1), sido, gugun, dong, decode(bunji,'','번지없음',bunji)
from(select rownum r,ename, hiredate, sal, loc, zipcode, sido, gugun, dong, bunji
	from (select e.ename, e.hiredate, e.sal,d.loc,
  		 zipcode, z.sido, z.gugun, z.dong, bunji
		from emp e, dept d, zipcode z
		where (e.deptno = d.deptno and d.deptno = z.seq)
		order by d.deptno
		)
	)
where r between 2 and 5;

-----------------
/*2. 부서번호가 10과 30,40번인 모든 부서의
사원번호,사원명, 입사일,연봉,연봉순위,부서명, 부서번호, 위치, 우편번호, 시도, 구군, 동, 번지를 조회.
단, 출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
우편번호는 '-'뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체하여 출력,
입사일은 월-일-년 요일까지 출력.
*/
select r,empno, ename, to_char(hiredate,'mm-dd-yyyy'), sal, salrank, dname, deptno, loc, zipcode , sido, gugun, dong, decode(bunji,'','번지없음',bunji) bunji
from (
	select rownum r, empno, ename, hiredate, sal, salrank, dname, deptno, loc, substr(zipcode,instr(zipcode,'-')+1)zipcode , sido, gugun, dong, bunji
	from (
		select e.empno,e.ename,e.hiredate, e.sal, rank() over(order by sal) salrank, d.dname, d.deptno,d.loc,z.zipcode, z.sido, z.gugun, z.dong, z.bunji
		from emp e, dept d, zipcode z
		where (e.deptno(+) = d.deptno and d.deptno = z.seq) and d.deptno in(10,30,40)
		order by d.deptno
    	 	)
  	)
where r between 2 and 5;


select * from EMP; -- empno, ename, job, mgr, hiredate, sal, comm, deptno
select * from DEPT;-- deptno, dname, loc
select * from ZIPCODE; -- zipcode , sido, gugun, dong, bunji, seq
-------------------------------------------------------------------------------------------
/*
3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
 있는 차량의 // 제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
   하여 출력,
   이미지는 이미지명과 확장자를 구분하여 출력할것,
   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
*/
select cc.country, initcap(cc.maker), cma.model, cmo.car_year, cmo.price, cmo.car_option,
substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) imgname,
substr(cmo.car_img,instr(cmo.car_img,'.')+1) imghwak, cmo.cc
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model) and cc.maker in('현대','기아','삼성','BMW','AUDI')
and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
order by cmo.car_year desc, cmo.price desc;

--
select country, initcap(maker), model, car_year, price, car_option, substr(car_img,1,instr(car_img,'.')-1) imgname,
	  substr(car_img,instr(car_img,'.')+1) hwackname, cc
from(
	select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
	from car_country cc, car_maker cma, car_model cmo
	where (cc.maker = cma.maker and cma.model = cmo.model)
	and (cc.maker in('현대','기아','삼성','BMW','AUDI'))
	and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
	order by cmo.car_year desc, cmo.price desc
	);



/*select country, maker, model, car_year, price, car_option, car_img, cc
from( select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
	 from car_country cc, car_maker cma, car_model cmo
	 where (cc.maker = cma.maker and cma.model = cmo.model)
	 order by cmo.car_year desc, cmo.price desc
	)
where maker in('현대','기아','삼성','BMW','AUDI') and car_option like '%ABS%' or car_option like '%TCS%';

--
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model)
order by cmo.car_year desc, cmo.price desc;
*/

select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate

------------------------------------------------------------------------------------------
update car_model
set car_img='qm5_001.jpg'
where car_img='qm5_001.jpg,qm5_002.jpg';

update car_model
set car_img='qm5_003.jpg'
where car_img='qm5_003.jpg,qm5_004.jpg';

update car_model
set car_img='qm5_005.jpg'
where car_img='qm5_005.jpg,qm5_006.jpg';

commit;

--------------------------------------------------------------------
/*4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.

*/
select '['||cma.model||'] 차량의 연식은 ['  ||cmo.car_year||  ']이고, 제조국은 ['  ||cc.country||
']이며,['  ||cc.maker||  ']사가 제조사입니다. 가격은 ['  ||to_char(rpad(cmo.price,8,'0'),'99,999,999')||  ']원 입니다.'
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model)
and cma.model in('K5','아반테','소렌토','A8','SM3')
order by cmo.price;




/*4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.

*/




-----------------------------------
select r,'['||model||']명 차량의 연식은 ['||car_year||']이고, 제조국은 ['||country||']이며,['||maker||']사가 제조사입니다. 가격은 ['
||to_char(rpad(price,8,0),'99,999,999')||']원 입니다.'
from(
	select rownum r,model, country, maker, price, car_year
	from(
 		select cma.model, cc.country, cma.maker, cmo.price, cmo.car_year
 		from  car_country cc, car_maker cma, car_model cmo
		where (cc.maker = cma.maker and cma.model = cmo.model)
		and cma.model in('K5','아반테','소렌토','A8','SM3')
  		order by cmo.price
   	  )
   	)
where r between 2 and 7;


select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate----------------------------------------------------------------------

--------------------------------------------------------------------
/*
5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회 .
*/
select cmo.car_year, cmo.model, sum(cmo.price)
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model)
and cc.maker in('현대')
group by rollup(cmo.model,cmo.car_year)
order by cmo.car_year, cmo.model;


select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate

--------------------------------------------------------------------
/*6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회

   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
     연봉인상액은 부서번호에 따라 차등 인상
     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
     계산하여 3자리마다 ,를 넣어 출력.
     모든 영어는 소문자로 출력.
*/
select e.empno, lower(e.ename), e.hiredate, e.sal,e.sal*3.3 tax ,(e.sal+e.sal*1.5+nvl(e.comm,0)-e.sal *0.033) cil,
to_char(decode(d.deptno,10,e.sal*0.07,20,e.sal*0.04,30,e.sal*0.1,e.sal*0.03),'9,999,999') insang ,d.deptno,lower(d.dname), lower(d.loc),z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno = d.deptno and d.deptno = z.seq) and (e.ename like '__A__' or e.ename like '%S');

--
/*6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회

   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
     연봉인상액은 부서번호에 따라 차등 인상
     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
     계산하여 3자리마다 ,를 넣어 출력.
     모든 영어는 소문자로 출력.
*/

-----

select e.empno, lower(e.ename), e.hiredate, e.sal, e.sal*0.003 tax, e.sal+trunc((e.sal/12),0)+nvl(e.comm,0)-sal*0.033 sil,
	  to_char(decode(d.deptno,10,sal*0.07,d.deptno,20,sal*0.04,30,sal*0.1,sal*0.03),'9,999') insang, d.deptno, lower(d.dname), d.loc,
	  z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno(+) = d.deptno and d.deptno = z.seq) and (e.ename like '%S'or e.ename like '__A__') ;







select * from EMP; -- empno, ename, job, mgr, hiredate, sal, comm, deptno
select * from DEPT;-- deptno, dname, loc
select * from ZIPCODE; -- zipcode , sido, gugun, dong, bunji, seq



