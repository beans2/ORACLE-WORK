-- 점수를 입력받아 0~100사일때 점수 계산, 0~100사이가 아니라면
-- 입력 실패출력
-- 0~100사이일 때 0~40사이라면 '과락' 41~60 -다른 과목 참조
-- 61~100이면 합격을 출력


set serveroutput on
set verify off

accept score prompt '점수를 입력하시오: '
declare
	score number := &score;
begin 
	dbms_output.put('점수 : '||score);
	if score between 0 and 100 then 
		if score <= 40 then
			dbms_output.put_line(' 과락 OTL');
		elsif score <= 60 then
	     	dbms_output.put_line(' 다른과목 참조'); --실패
		else                    
	     	dbms_output.put_line(' 자격증 취득'); --성공
		end if;
	end if;
end;
/
