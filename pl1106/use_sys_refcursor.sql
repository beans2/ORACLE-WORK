-- sys_refcursor의 사용
--커서의 제어권을 외부로 전달할 때 주로 사용.
--사원테이블에서 매니저번호를 입력받아 매니저가 관리하는 사원의
--사원번호, 사원명, 입사일, 부서번호, 연봉을 조회하세요.
--단, 입력된 매니저번호가 emp테이블에 존재하는 매니저 번호 일 때만
--검색을 수행합니다.
--7839,7782,7698,7902,7566,7788

set serveroutput on
set verify off

	accept mgr prompt '매니저번호: ';
declare
	i_mgr number;

     --1. sys_refcursor 선언: 커서명 sys_refcursor
     cur_mgr sys_refcursor;
     
     --조회 결과를 저장할 record type 선언
     type rec_emp is record( empno emp.empno%type, ename emp.ename%type, hiredate emp.hiredate%type,
     deptno emp.deptno%type, sal emp.sal%type);
     emp_data rec_emp;
     
begin
	--입력된 매니저 번호가 존재하는지 검색
	for temp_mgr in (select distinct mgr from emp where mgr=&mgr)
	loop
		i_mgr:= temp_mgr.mgr;
	end loop;
	
	if i_mgr is not null then
		--2. 커서열기 : 조회 쿼리문을 작성
		open cur_mgr for
			select empno,ename, hiredate, deptno, sal
			from  emp
			where mgr = i_mgr;
			
			--3. 인출
			loop
			   fetch cur_mgr into emp_data;
			   exit when cur_mgr%notfound;
			   dbms_output.put_line(emp_data.empno ||' '||emp_data.ename||' '|| to_char(emp_data.hiredate,'yyyy-mm-dd')|| ' '||
			   emp_data.deptno||' '||emp_data.sal);
			   
			end loop; 
			--4.커서닫기
			close cur_mgr;
	else
	dbms_output.put_line(&mgr||'매니저는 존재하지 않습니다');
	end if;

end;
/




































































