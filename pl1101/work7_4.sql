/*
4. 교통수단을 입력받아, '택시','버스','지하철' 인 경우에만 
  아래와 같은 요금으로 한달 교통비를 산정하세요.
   택시 : 3800 -
   버스 : 1200
   지하철 :1250원
 출력 : 출퇴근에 사용하는 교통수단은 'XX'이고 기본 요금: xx 원입니다.
      왕복요금은 xx원이고, 한달 20일 기준 교통비는 xx원 입니다.
    택시, 버스, 지하철이 아니라면  '대중교통이 아닙니다.' 를 출력하세요.

*/ 
set serveroutput on
set verify off

accept sudan prompt '교통수단을 입력:  '
declare
	sudan varchar(20) := '&sudan';
	yogum number;
	texiyogum number :=3800;
	busyogum number :=1200;
	subyogum number :=1250;
begin
	if sudan in('택시','버스','지하철') then	 
		if sudan ='택시' then
		yogum:= texiyogum;	
		elsif sudan ='버스' then
		yogum:= busyogum;
		elsif sudan='지하철' then
		yogum:= subyogum;	
		end if;
		dbms_output.put_line('출퇴근에 사용하는 교통수단은 '||sudan||'이고 기본요금:'||yogum||
	  			'입니다.'||'왕복요금은'||yogum*2||'한달 20일 기준 교통비는' ||yogum*40);
	else
		dbms_output.put_line('대중교통이 아닙니다.');
	end if;
	
end;
/