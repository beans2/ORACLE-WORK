--사원번호를 입력받아 사원명, 연봉, 직무, 입사일, 부서번호을 조회
-- 단, 연봉이 2000미만이라면 연봉의 2배를 연산하여 출력하고
-- 부서번호가 10, 20번이라면 입사일을 월-일-년의 형식으로,
--그렇지 않다면, 년-월-일의 형식으로 출력하세요.

set verify off
set serveroutput on

	accept empno prompt '사원번호: '
	
declare
	i_empno emp.empno%type :=&empno;
	ename emp.ename%type;
	sal emp.sal%type;
	hiredate emp.hiredate%type;
	job emp.job%type;
	deptno emp.deptno%type;
	date_format varchar2(30) :='yyyy-mm-dd';		
begin

	
	select ename, sal, hiredate, deptno, job
	into  ename, sal,hiredate, deptno, job
	from emp
	where empno=i_empno; 
	
	if sal<2000 then
		sal:=sal*2;
	end if;
	
	--부서번호에 대한 날짜 출력형식 변경
	if deptno in(10,20) then
	    date_format:= 'mm-dd-yyyy';
	end if;
	dbms_output.put_line(i_empno||'번 사원정보');
	dbms_output.put_line('사원명: '||ename||
				',직무: '||job||',연봉: '||sal||',부서번호: '||deptno||', 입사일: '||to_char(hiredate, date_format));
	exception
	when no_data_found then
		dbms_output.put_line('입력하신 ['||i_empno||'] 번사원은 존재하지 않습니다.');	
		
		--연봉이 2000미만인 사원에 대한 처리
		
	
end;
/