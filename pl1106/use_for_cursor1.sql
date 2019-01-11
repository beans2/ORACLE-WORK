--부서번호를 입력받아 해당 부서에 따른 사원번호, 사원명, 입사일, 연봉을 조회

--입사일은 "년-월-일-분기"의 형식으로 출력
--부서번호가 10,20,30번이 아니라면 10번 부서로 조회하여 
--출력할 것.

set serveroutput on
set verify off
	accept deptno prompt '부서번호: '
declare

	i_deptno number:=&deptno;
begin
     if i_deptno not in (10,20,30) then
     	i_deptno:=10;
     end if;
     
     for emp_data in
      	(select empno, ename, sal ,to_char(hiredate,'yyyy-mm-dd q') hiredate
      	 from emp
      	 where deptno=i_deptno)
      	 
     loop
     	dbms_output.put_line(emp_data.empno||' /'|| emp_data.ename ||'/ '|| emp_data.sal);
     end loop;
     
end;
/
