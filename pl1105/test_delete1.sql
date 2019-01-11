--사원번호를 입력받아 CP_EMP2테이블에서 사원번호와 일치하는 
--사원을 삭제하는 PL/SQL을 작성.

set serveroutput on
set verify off


	accept empno prompt '사원번호: ';
declare
     i_empno cp_emp2.empno%type := &empno;
     cnt number;
begin
	--delete의 where절에서는 컬럼명과 변수명이 같다면 모두 참으로 판단하여
	--모든 레코드를 삭제한다.
	--변수명과 컬럼명은 구분될수 있도록 이름을 설정해야한다.
     delete from cp_emp2
     where empno=i_empno;
     
     cnt:= sql%rowcount;
     if	cnt =1 then
     	dbms_output.put_line(cnt||'건 레코드 삭제');
     	commit;
     else
     	dbms_output.put_line('여러건의 레코드는 삭제할 수 없습니다.');
          rollback;
     end if;
	
end;
/