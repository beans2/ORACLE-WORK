--for:시작과 끝을 한눈에 알수 있고 1씩 증가하는  반복문
set serveroutput on

declare
 	ssum number(5);
 	msg varchar2(300);
begin  
	ssum := 0;
	/*
	for i in 1 .. 10 loop
		dbms_output.put_line('i='||i);
	end loop;
	--for의 index 를 저장하는 변수는 declare 에서 선언된 
	--변수를 사용하지 않는다.
	dbms_output.put_line('for 종료'||i);
	*/
	--1~100까지의 합을 구하여 출력: 5050
    /* 
 	for i in 1..100 loop
 		ssum := ssum +i;  
 	end loop;
 	dbms_output.put_line(ssum);
     */
	--1~9까지 1씩 증가하는 for 작성하여 출력.
    	--구구단(복수 for)
    	--바깥 for의 인덱스는 단을 사용하기 위한 것
    	--안쪽 for의 인덳스는 단에 곱해지는 수를 사용하기 위한 것
     dbms_output.put_line('----------------구구단 시작----------------');
     for i in 2..9 loop  
     	dbms_output.put_line(i||'단');
     	
     	for j in 1..9 loop
     		dbms_output.put(i||'*'||j||'='||i*j||' ');
     		dbms_output.put_line('');
     	end loop; 
     	dbms_output.put_line('------------------');
     end loop;
     dbms_output.put_line('--------------구구단 끝----------------');
     
     
     
     msg:= '오늘은 금요일 입니다.';
     /*--for를 사용하여 글자 한자씩 잘라내서 출력
     	reverse를 사용하면 반복되는 인덱스를 거꾸로 사용한다.
     오
     늘
     은
     
     금
     요
     일
     
     입
     니
     다
     */ 
     for i in 1..length(msg) loop
     	dbms_output.put_line(substr(msg,i,1));
     	if mod(i,4)=0 then
     		dbms_output.put_line('.'); 
     	end if;
     end loop;	
    
     
end;
/
