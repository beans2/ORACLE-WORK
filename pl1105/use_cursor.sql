--여러 행을 조회할 때 사용하는 CURSOR
-- dept 테이블의 모든 레코드를 조회하는 cursor

set serveroutput on

declare
	--1. 선언: cursor 커서명 is select....;
	cursor cur_dept is
		select deptno, dname, loc
		from dept;
		
	--조회결과를 저장할 변수선언
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc dept.loc%type;
	
	dept_data dept%rowtype;
		 
begin
	if cur_dept%isopen then
		--커서가 열려 있다면 열린 커서를 닫고
		close cur_dept;
	end if;	
     --2.열기
     open cur_dept;
     
     --3. 인출
     loop   
     	--into절에 개별 변수를 사용하여 처리.
     	--fetch cur_dept into deptno, dname, loc;
     	--onto절에 레코드변수를 사용하여 처리;
     	fetch cur_dept into dept_data; 
     	
     	exit when cur_dept%notfound;
--     	if cur_dept%notfound then
--     		dbms_output.put_line('레코드 없음');
--          	exit;
--     			 
--          else 
--          	dbms_output.put_line('레코드 있음');
--          end if;
--          dbms_output.put_line(deptno||' '||dname||' '||loc
--          );
		dbms_output.put_line(dept_data.deptno||' '||dept_data.dname||' '||dept_data.loc );
		
     end loop;
     
     dbms_output.put_line('조회된 레코드 수: '|| cur_dept%rowcount);
     
     --4.커서닫기
     close cur_dept;
 
     
end;
/