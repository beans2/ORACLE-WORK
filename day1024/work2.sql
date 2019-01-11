--1. 사원 테이블에서 '10' 부서가 아니면서 연봉이 1000이상 3000이하의
--모든 사원들의  사원번호,사원명, 입사일,부서번호, 연봉을 조회하세요.
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from emp
where deptno !=10 and sal between 1000 and 3000;

--2. 사원 테이블에서 보너스를 수령하는 사원들의  사원번호,사원명,
--연봉,보너스, 총수령액, 월급을 조회 하세요.
-- 월급은 연봉을 12개월로 나눠 계산할 것.
select EMPNO, ENAME, SAL, COMM, SAL/12 MONTHSAL, COMM+SAL TOTALSAL
from emp
where COMM IS NOT NULL;

--3.  사원 테이블에서 부서번호가 10,30인  사원들의 사원명, 사원번호
--입사일, 연봉을 조회 하세요.
--단, 출력은  xxxx번 xxxx사원님 xxxx년에 입사하였고 연봉은 xxx$입니다.
--의 형식으로 하고, 컬럼명은 output 으로 설정할것.
select ENAME||'번 '|| EMPNO||'사원님 '|| HIREDATE||'년에 입사하였고 '||'연봉은 '|| SAL|| '입니다' output
from emp
where deptno in(10,30);

--4. 사원 테이블에서 연봉이 3000 미만인 사원들의 사원번호, 사원명,
--입사일, 연봉,직무, 부서번호를 조회 하세요.
--단, 연봉의 오름차순으로 정렬하되 연봉이 같다면 사원명의 내림차순으로
--정렬할것.
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from emp
where sal<3000
order by sal,ename desc ;

--5. test_like 테이블에 아래와 같은 데이터를 추가할것.
    --7, 기임저엉은,서울시 동작구 상도동,'정기고'
    --8, 정대만,서울시 동대문구 동대문1동,'썸타고'
    --9, 송태섭,서울시 동대문구 동대문2동,'정기고'
insert into test_like( num, name, loc, highschool)
values(7,'기임저엉','서울시 동작구 상도동', '정기고');

insert into test_like( num, name, loc, highschool)
values(8,'정대만','서울시 동대문구 동대문1동', '썸타고');

insert into test_like( num, name, loc, highschool)
values(9,'송태섭','서울시 동대문구 동대문2동', '정기고');

delete from test_like
where num = 7;
commit;
select * from TEST_LIKE;

--6. test_like 테이블에서 '서울시'에 거주하는 학생의  번호,학생명,
   -- 주소, 학교정보를 아래와  같은 형식으로 출력하고
   --  컬럼명은 대소문자 구분하여 Output으로  할것.
   -- 출력형식 :  번호 : x, 이름 : xx, 주소 : xx, 학교 : xx
select '출력형식'||' 번호: '||NUM||' 이름: '|| NAME||' 주소: '|| LOC||' 학교: '|| HIGHSCHOOL
from test_like
where loc like '%서울시%';

--7. 사원테이블에서 사원명이 4글자이거나 연봉이 3000이상인 사원의
  -- 사원번호, 사원명, 연봉, 입사일, 부서번호, 직무를 조회할것.
  -- 단, 출력 데이터는 연봉의 오름차순으로 정렬하고, 연봉이 같다면
   --  사원명의 오름 차순으로 정렬할것.
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where   ename like '____' or sal>=3000
order by sal, ename desc;

--8.  test_like 테이블에서 고등학교명을 출력하고 학교명의 오름
   -- 차순으로 정렬하여 출력할 것.
   -- 단, 고등학교 명이 같다면 하나만 출력하세요.(2가지로 할 것.)
select distinct HIGHSCHOOL
from test_like
order by highschool;

--9. 사원 테이블에서 사원번호, 사원명, 입사일, 연봉, 내년연봉을
  --  조회 하세요.
  --  내년 연봉은 현재 연봉보다 7% 향상된 금액으로 계산하여 출력할것.
select EMPNO, ENAME, HIREDATE, SAL , SAL+(SAL*0.07) NEXTYEARSAL
from emp;

--10. 사원 테이블에서 사원명이 5글자이면서 세번째 글자에 'A'가 들어
  --  간 사원의 사원명, 사원번호, 입사일, 연봉을 조회하세요.
  --  단, 연봉의 오름차순으로 출력할것.
select ENAME, EMPNO, HIREDATE, SAL
from emp
where ename like '_____' and ename like '__A%'
order by sal;

--11. 사원 테이블에서 사원명이 'A'로 시작하면서 연봉이 1600이상인
     --사원의 사원명,연봉,직무, 매니저번호, 입사일을 조회 할것.
select ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600;

