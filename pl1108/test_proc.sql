create table test_proc as
(
select empno,ename,hiredate,sal,job from EMP
where 1=0);

alter table test_proc add constraint pk_test_proc primary key(empno);

--insert_test_proc 프로시저를 실행
var msg varchar2(300);
var cnt number;

--직접실행

exec insert_test_proc(1111,'테스트',3000,'주임',:msg,:cnt);

--실행결과
print msg;
print cnt;
select * from TEST_PROC;
--제약사항 1. 사원번호 1~9999 , 0번입력, 10000번입력
exec insert_test_proc(0,'테스트',3000,'주임',:msg,:cnt);

--실행결과
print msg;
print cnt;

exec insert_test_proc(10000,'테스트',3000,'주임',:msg,:cnt);

--실행결과
print msg;
print cnt;

--제약사항2. 연봉은 2500~8000 사이 ,2500 이하라면 2500으로,
--8000이상이라면 8000으로 추가
--실행결과
exec insert_test_proc(1112,'테스트',2400,'사원',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--실행결과
exec insert_test_proc(1113,'테스트',8500,'사원',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--제약사항 3.
--실행결과
exec insert_test_proc(1114,'테스트',1400,'알바',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--제약4 영어라면 첫자를 대문자로
--실행결과
exec insert_test_proc(1114,'kim',1400,'사원',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--5, 사원명이 길게 입력되는 경우
exec insert_test_proc(1115,'선우용녀',5000,'과장',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;



