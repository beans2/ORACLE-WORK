--코드를 여러번 반복실행시켜주는 loop 사용
set serveroutput on

declare
	i number;
	
begin
	i:=0;
	
	loop
		dbms_output.put_line(i);
		i:=i+1;
		
		exit when(i=163780);
--		if i=10 then 
--		exit;
--		end if;
		end loop;
end;
/
