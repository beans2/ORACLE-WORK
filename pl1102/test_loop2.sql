--1~100���� ����ϴ� loop

set serveroutput on

declare
	cnt number(3);

begin
	--�ʱⰪ
	cnt :=1;
	--1�������� 100���� ¦���� ���
	loop 
		if mod(cnt,2)=0 then
			dbms_output.put(cnt||' ');
		end if;
		cnt:=cnt+1;
		exit when cnt>100 ;
	end loop;
     dbms_output.put_line(' ');
end;
/

