--다중 if(else~ if)점수를 입력받아 판정내리기
--점수를 입력받아 점수가 0보다 작은경우 '0보다 작아서 실패'
--100보다 큰 경우 '100보다 커서 실패' 그렇지 않은 경우 '성공'출력
--PL/SQL작성

set serveroutput on
set verify off

accept score prompt '점수를 입력하시오: '
declare
	score number := &score;
begin 
	dbms_output.put('점수 : '||score);
	if score < 0 then
		dbms_output.put_line(' 0보다 작아서 실패');
	elsif score > 100 then
	     dbms_output.put_line(' 100보다 커서 실패'); --실패
	else 
	     dbms_output.put_line(' 성공'); --성공
	end if;
end;
/