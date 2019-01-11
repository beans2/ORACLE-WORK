--최소 0번 수행, 최대 조건까지 반복수행하는 while
set serveroutput on

declare
	i number;
begin
     --1에서 10까지 1씩 증가하는 값을 출력하는 while
     --초기값
      
    
     
      /*
     --조건식 
     i :=1;
     while i<=10 loop
     --반복수행문장
     	dbms_output.put_line(i);
     	--증가식, 감소식 - 조건에 도달하여 반복을 멈추기 위해
     	i:=i+1;
     end loop;
     */
     
     
     
     
     --0~100 사이의 홀수만 출력하는 while 문을 만드시오. 
     i :=1;
     while i<=100 loop
          dbms_output.put_line(i);
		i:=i+2;
	end loop;
	
	
end;
/