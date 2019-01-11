/*
 숙제 2.   
  학생들의 정보를 처리하는 PL/SQL작성.
   번호, 이름, 오라클점수,자바점수,총점,평균 을 저장할 수있는 record를
  만들고 아래의 데이터를 입력한 후 
  반복문을 사용하여  총점,평균을 처리하는 PL/SQL 작성   
 1, 김정운, 80,81
  2, 김희철, 94,80
  3, 이재찬, 97,96
  4, 박영민, 86,92
  5, 정택성, 76,99

 출력 
   번호, 이름, 오라클점수,자바점수,총점,평균 
  .
  .
  .
  자바최고점수 [xx] 오라클 최고점수 [xxx]

*/  
set serveroutput on

declare
	type class4_record is record(num number(4),name varchar2(30), 
	oracle_score number(4),java_score number(4));
	type class4_table is table of class4_record index by binary_integer;
     class4_tab class4_table;
     total_score number :=0;
     n_total_score number:=0;
    
begin
    	class4_tab(1).num := 1;
    	class4_tab(1).name := '김정운';
     class4_tab(1).oracle_score := 80;
    	class4_tab(1).java_score := 81;
    	
    	class4_tab(2).num := 2;
    	class4_tab(2).name := '김희철';
     class4_tab(2).oracle_score := 94;
    	class4_tab(2).java_score := 80;
    	
    	class4_tab(3).num := 3;
    	class4_tab(3).name := '이재찬';
     class4_tab(3).oracle_score := 97;
    	class4_tab(3).java_score := 96;
    	
    	class4_tab(4).num := 4;
    	class4_tab(4).name := '박영민';
     class4_tab(4).oracle_score := 86;
    	class4_tab(4).java_score := 92;

     class4_tab(5).num := 5;
    	class4_tab(5).name := '정택성';
     class4_tab(5).oracle_score := 76;
    	class4_tab(5).java_score := 99;
    	
    	dbms_output.put_line('번호     이름       오라클점수    자바점수    총점      평균');
  	dbms_output.put_line('=========================================================='); 
  	
  	for i in 1 .. class4_tab.count loop
  		n_total_score:=0;
  		n_total_score:=class4_tab(i).java_score+class4_tab(i).oracle_score;
  		dbms_output.put_line(class4_tab(i).num||'        '||class4_tab(i).name||'          '
  						||class4_tab(i).oracle_score||'          '||class4_tab(i).java_score||'          '
  						||n_total_score||'          '||n_total_score/2);
  		 total_score := total_score+n_total_score;
  	end loop;
  	dbms_output.put_line('=========================================================='); 
  	dbms_output.put_line(' 총점['|| total_score||'],평균['||total_score/class4_tab.count||']');
end;
/

    	