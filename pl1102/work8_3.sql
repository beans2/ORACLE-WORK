/*
3. 아래의 데이터를 처리하는  PL/SQL작성
    "이름, 주민번호, 나이, 성별"을 저장할 수 있는 테이블을
    생성하고 아래의 데이터를 채운다.
   김정운, 880101-1234567  남         2018 - 20+주민번호 +1   to_char(concat('20',substr(znum,1,2))) substr(znum,8,1);  현재날짜-나이+1=생년월인
   나이= 현재날짜-생년월일+1
   김희철, 890101-1234567   남
   이재찬, 011231-3234567    남
   박영민, 920101-2234567     여
   정택성, 020420-4234567   	여
   위의 데이터를 사용하여 
   번호,주민번호,나이, 성별을 보여주는  PL/SQL을 작성하세요.
*/

set serveroutput on

     
     

declare
	type class4_record is record(name varchar2(30),znum varchar2(14));
	type class4_table is table of class4_record index by binary_integer;
     class4_tab class4_table;
     age number;
     gender varchar2(6);
begin
    class4_tab(1).name := '김정운';
    class4_tab(1).znum :='880101-1234567';
    
    
    class4_tab(2).name := '김희철';
    class4_tab(2).znum :='890101-1234567';
    
    
    class4_tab(3).name := '이재찬';
    class4_tab(3).znum :='011231-3234567';
    
    
    class4_tab(1).name := '박영민';
    class4_tab(1).znum :='920101-2234567';
    
    
    class4_tab(4).name := '정택성';
    class4_tab(4).znum :='020420-4234567'; 
    
    dbms_output.put_line('번호   ,    주민번호   ,      나이   ,성별   ');
    for i in 1 .. class4_tab.count loop
    
       if substr(class4_tab(i).znum,8,1) in('3','4') then
       	age := to_char(sysdate,'yy')-to_char(substr(class4_tab(i).znum,1,2));
       else 
       	age := to_char(sysdate,'yy')-to_char(substr(class4_tab(i).znum,1,2))+101;
       end if;
       if substr(class4_tab(i).znum,8,1) in('1','3') then
        	gender:= '남자';	
       else
          gender:= '여자';	
       end if;
       	dbms_output.put_line(class4_tab(i).name||'     '||class4_tab(i).znum||'     '||age||'     '||gender);	
    end loop;
end;
/