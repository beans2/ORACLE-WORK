--�ڵ带 ������ �ݺ���������ִ� loop ���
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
