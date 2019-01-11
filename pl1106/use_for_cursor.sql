--부서번호를 입력받아 해당 부서에 따른 사원번호, 사원명, 입사일, 연봉을 조회

--입사일은 "년-월-일-분기"의 형식으로 출력

set serveroutput on
set verify off
	accept deptno prompt '부서번호 : '
declare
	--1.선언
	cursor cur_emp is
		select  empno, ename, sal, to_char(hiredate,'yyyy-mm-dd q') hiredate
		from emp
		where deptno=&deptno;
	i number:=0;
begin
     -- open cur_emp; 커서가 이미 열려있으므로 에러
	--2. for을 사용한 인출(fetch를 사용하지 않는다)
	for emp_data in cur_emp loop
		dbms_output.put_line(emp_data.empno||' '|| emp_data.ename||' '|| emp_data.sal||' '|| emp_data.hiredate);	
		i:= i+1;
	end loop;
	dbms_output.put_line(i||'번 출력');
	--close cur_emp; for를 빠져 나오는 순간 커서가 닫히기 때문에 에러 
	
end;
/ 