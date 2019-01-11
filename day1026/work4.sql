/*
1. 사원 테이블에서 사원번호,사원명, 연봉, 보너스를 조회
   단, 사원 번호를 내림차순 정렬 했을 때 3~5사이의 레코드만 출력 하고
      연봉은 7자리로 맞춰 출력하고 ,를 넣어 출력한다.
      해당 자리에 값이 없으면 0을 출력한다.  -완
*/
select rownum,EMPNO, ENAME, to_char(SAL,'0,000,000'), COMM
from (select rownum r,empno,ename,sal, comm
			from (select empno,ename,sal,comm from emp order by empno desc))
where r  between 3 and 5;

/*
2. class4_info 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
   태어난 해는 현재년도-나이+1 로 구합니다. -완
*/

create table class4_info(
	num number(4),
	name varchar2(15),
	ssn char(14),
	age number(3),
	eye number(3,2),
	email varchar2(50),
	gender char(3),
	input_date date
	);
insert into class4_info values(1, '정택성','930101-1234567',26,1.3,'jung@test.com', '남' , sysdate);
insert into class4_info values(2,'오영근','910101-1234567',28,1.8,'oh@test.com','남', sysdate);
insert into class4_info values(3,'공쓰','921111-1234567',27,1.8,'kong.test.com','남',sysdate);
commit;

select NUM, NAME, AGE ,
to_char(sysdate,'yyyy')-age+1
from class4_info;

/*
3. class4_info 테이블 번호, 이름 나이, 이메일, 이메일의 유효성 여부를
   조회.
   단, 이메일의 유효성은 '@' 이 없으면 '무효', '@'이 존재하면 '유효'를출력
*/
select NUM, NAME, AGE, EMAIL,
decode(gol,'@','유효','무효') "유효성"
from (select num, name, age, email,
substr(email,instr(email,'@'),1) gol
from class4_info);

/*
4. car_model 테이블에서 옵션에 'ABS'나 '에어백'이 있는 차량의
    모델명,년식,가격,옵션, 이미지, 제조사를 조회 하세요.
    단, 가격의 오름차순으로 정렬하여 출력할 것.
*/
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, HIREDATE,(select maker from car_maker where car_model.model = car_maker.model) 제조사
from car_model
where car_option like '%ABS%' or car_option like '%에어백%'
order by price;

select * from CAR_MAKER;

/*
5. car_model 테이블에서 모델명이 '아반테', '소렌토', 'A8'인 차량의
    모델명,모델별 가격 총합과 총계를 조회 하세요.
*/
select MODEL, sum(PRICE)
from car_model
where model in('아반테','소렌토','A8')
group by rollup(model);


/*
6. car_model 테이블에서 차량 가액이 1500~3000 사이인 차량의
   모델명, 년식, 가격, 옵션, 입력일, 가격별 순위를 조회하세요.
   단, 가격별 순위는 중복되지 않는 번호가 출력되어야합니다.
*/
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, rownum ranking
from (
	select model, car_year, price, car_option, hiredate
	from car_model
	order by price)
where price between 1500 and 3000;
----------------------------------------
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, row_number() over(order by price) ranking
from car_model
where price between 1500 and 3000;


/*
7. 사원 테이블에서 입사년도가 1981년 이상이면서 매니저가 있는  사원의
   사원번호,사원명,연봉,매니저번호, 연봉 순위를 조회 하세요.
   단, 연봉순위는 동일한 연봉일 때 동일한 순위를 보여줍니다.
*/

select EMPNO, ENAME, SAL, MGR, rank() over(order by sal) ranking ,hiredate
from emp
where to_char(hiredate,'yyyy') >='1981'
