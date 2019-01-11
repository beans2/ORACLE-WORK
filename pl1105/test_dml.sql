--사원번호, 사원명, 부서번호, 직무를  입력받아 CP_EMP3 테이블에 추가하는
--pl/SQL을 작성
--단, 사원의 연봉은 부서번호에 따라 동일 연봉으로 추가한다.
--10번부서 :emp테이블의 사원번호가 7566의 사원과 같은
--연봉, 
--20번 부서: emp테이블의 사원번호가 7698 
--30번 부서: 7782
--그 외 부서번호가 입력되면 7788사원의 연봉으로 추가

set serveroutput on
set verify off
     accept empno prompt '사원번호: ';
	accept ename prompt '사원명: ';
	accept deptno prompt '부서번호: ';
	accept job prompt '직무: ';
declare
	
	empno cp_emp3.empno%type := &empno;
	ename cp_emp3.ename%type := '&ename';
	deptno cp_emp3.deptno%type := &deptno;
	job cp_emp3.job%type := '&job';
	sal cp_emp.sal%type;
	select_empno cp_emp.empno%type:=7788;
		
begin
	--입력되는 부서번호별로 참조할 연봉을 조회하기 위한
	--사원번호를 설정 
	if deptno = 10 then		
		select_empno := 7566;
	elsif deptno =20 then
	     select_empno := 7698;
	elsif deptno =30 then
	     select_empno := 7782;
	end if; 
	--설정된 사원번호별로 연봉을 조회
	select sal 
	into   sal
	from   emp
	where  empno=select_empno;
	
	--조회된 연봉으로 추가작업
	insert into cp_emp3(empno, ename, deptno, job, sal)
	values(empno, ename, deptno, job, sal);
	dbms_output.put_line(empno||'번 사원정보를 추가하였습니다.');
	commit;
	
end;
/