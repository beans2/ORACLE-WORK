--1~100까지 출력하는 loop

set serveroutput on

declare
	cnt number(3);

begin
	--초기값
	cnt :=1;
	--1에서부터 100까지 짝수만 출력
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

