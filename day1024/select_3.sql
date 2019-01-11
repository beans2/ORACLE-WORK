--정렬
-- 사원테이블에서 사원번호 사원명, 연봉ㅡ 입사일을 조회
--단, 연봉은 오름차순으로 정렬하여 출력할 것.  연봉이 같다면 입사일의 내림차순으로 정렬하여 출력할 것.
select EMPNO,ENAME, SAL, HIREDATE
from   emp
order by sal, hiredate desc;

--사원테아블에서 사원명의 매니저번호, 사원번호, 사원명, 연봉을 조회하세요
--단, 매니저번호의 내림차순으로 정렬하되, 매니저번호가 같다면 사원명의 오름차순으로 정렬하세요.
select MGR, EMPNO, ENAME, SAL
from emp
order by mgr desc, ename;

create table test_orderby(
	num varchar2(10)
);

insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
insert into test_orderby(num) values('204');
insert into test_orderby(num) values('21');
insert into test_orderby(num) values('191');
insert into test_orderby(num) values('300');
insert into test_orderby(num) values('20001');      

commit;

--번호 오름차순으로 정렬
select num
from test_orderby
order by num;  


