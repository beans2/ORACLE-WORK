--pl sql에서 update를 사용
--

set serveroutput on


declare
	cnt number;
begin
	update cp_emp2
	set    sal = 3500
	where  empno=2221;
	
	--암시적(묵시적)커서 sql을 사용하여 변경한 행의 수를 얻는다.
	cnt:= sql%rowcount;
	--변경된 사원이 1명일때만 Transaction을 완료하고 그렇지 않다면 
	--작업을 취소.

	if cnt =1 then
		dbms_output.put_line(cnt||'건 변경');
		commit;
	else
		dbms_output.put_line('조회된 사원이 여러명이거나 없으므로 변경작업을 취소합니다.');
		rollback;
	end if;

end;
/
