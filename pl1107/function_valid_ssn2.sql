/*
방법)
 880101-1234567 에 
    ****** - *******
  234567 892345 를 곱해서 나온 값을 다 더해서 11로 다눈 나머지를 구하기
나온 결과를 11에서 뺀다
이 값을 10으로 나눈 나머지 구하기 => 주민번호의 끝자리와 같은지 비교, 같으면 유효, 같지않으면 무효
입력값: ssn
*/

create or replace function  valid_ssn1(ssn char) return varchar2
is
 	result_msg varchar2(6) := '무효'; 
 	temp_val number :=0; --연산결과를 저장할 변수
 	flag_num char(1); -- 주민번호의 끝자리
 	idx number :=2; 
 	temp_ssn varchar2(13);

begin
    
    if check_ssn(ssn) = 'success' then 
    	temp_ssn :=substr(ssn,1,6)||substr(ssn,8,6);
    	flag_num := substr(ssn,14,1);
    	--temp_ssn 880101123456
    	for i in 1.. length(temp_ssn)loop
    		temp_val:=temp_val+ substr(temp_ssn,i,1)*idx;  
    		
    		idx:=idx+1;
    		if idx = 10 then
    			idx:=2;
    		end if;
    	end loop;
    	
    		temp_val:=mod(11-mod(temp_val,11),10);
    		if temp_val =  flag_num then
    		result_msg:='유효';
    		end if;
    end if;
     
	return result_msg;
end;
/
