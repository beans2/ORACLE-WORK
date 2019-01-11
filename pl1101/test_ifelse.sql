--이름을 입력받아 '이재찬'이면 '반장'을 출력하고 그렇지 않으면
--'평민'을 출력 한 후 입력한 이름을 출력하는 PL/SQL을 작성

set serveroutput on
set verify off

accept name prompt '이름을 입력하시오 : '
declare
	name varchar(10) := '&name';

begin
	if name = '이재찬' then
		dbms_output.put('그는 반장이다');
	else 
		dbms_output.put('그는 평민이다');
	end if;
	dbms_output.put_line(name);

end;
/