--문자열 연산자 like애서 사용할 테이블
create table test_like(
   num number,
   name varchar2(30),
   loc varchar2(300),
   highschool varchar2(60)
);

insert into test_like(num,name,loc,highschool)
values(1,'김정윤','서울시 강남구 역삼동','오지고');

insert into test_like(num,name,loc,highschool)
values(2,'김정운','서울시 구로구 개봉동','지리고');

insert into test_like(num,name,loc,highschool)
values(3,'박영민','경기도 수원시 영통구','레잇고');

insert into test_like(num,name,loc,highschool)
values(4,'김희철','서울시 강남구 서초구 서초동','먹고');

insert into test_like(num,name,loc,highschool)
values(5,'김저정은','평양시 평양동','씹고');

insert into test_like(num,name,loc,highschool)
values(6,'하정운','경기도 수원시 수원동','맛보고');

select * from test_like;
commit;

--like 연산자 %,_  기호와 같이 사용
--%는 모든 문자열, _는 한 문자

--test_like 테이블에서 '서울시 '에 사는 사람의 번호, 이름, 출신고등학교명을 조회
select NUM, NAME, HIGHSCHOOL
from test_like
where loc like '서울시%';

--이름이 '운'으로 끝나는 학생의 번호, 이름, 주소를 조회
select    num, name, loc
from   test_like
where  name like '%운';

--이름에 '정'이 포함되어 있는 학생의 번호, 이름 ,주소, 고등학교명 을 조회하세요.
select NUM, NAME, LOC, HIGHSCHOOL
from  test_like
where name like '%정%';

--이름이 3글자이며 가운데 글자가 '정'인 사람의 번호,이름을 조회
select NUM, NAME
from test_like
where name like '_정_';

--이름이 4글자인 학생의 번호, 이름, 고등학교명을 조회하세요ㅗ
select NUM, NAME, HIGHSCHOOL
from  test_like
where name like '____';

--지번주소를 저장하는 테이블
create table zipcode(
	zipcode char(7),
 	sido char(6),
 	gugun varchar2(25),
 	dong varchar2(100),
 	bunji varchar2(25),
 	seq number(5)
);

alter table zipcode modify dong varchar2(100);

truncate table zipcode;

select count(*)
from zipcode;

select*
from zipcode;

--우리집의 지번 주소를 조회
--동이름)
select  zipcode, sido, gugun,dong,bunji,seq
from  zipcode
where  dong like '신정7동%';

--사원테이블에서 사원명에 'L'가 2개 들어있는 사원의
--사원번호, 사원명, 입사일 조회

select  empno, ename, hiredate
from emp
where ename like '%A%A%';

--중복배제
-- 사원테이블에서 매니저번호를 조회. 단, 중복되는 매니저번호는 출력하지 않는다.
--distinct: 집계함수를 사용하여 그룹별 집계를 보여줄 수 없다.
-- 다른 값이 나오는 컬럼과 같이 사용할 경우, 모든 컬럼의 값이 동일해야 중복 배제가 된다.
select distinct mgr /*,ename*/
from emp;
--group by : 그룹으로 묶여지지 않은 컬럼과 같이 사용되면 error
select mgr /*ename*/
from emp
group by mgr;
























