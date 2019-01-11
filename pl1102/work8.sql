--1.  class4 강의장의 학생들의 교통요금을 구하는  PL/SQL을 제작
--   하고자한다.  대중교통수단 요금은 아래와 같으며 
--   [버스 : 1200원,  지하철 :1250원] , 10키로를 초과하면 매4키로마다
--  100원의 요금 더부과된다.  
--  이 정보를 이용하여 아래 학생들의 데이터를 처리하세요
--  1, 김정운, 서울시 강남구 역삼동, 5키로, 버스
--  2, 김희철, 인천시 남동구 구월동, 20키로, 지하철
--  3, 이재찬, 인천시 부평구 부평동, 16키로, 지하철
--  4, 박영민, 서울시 관악구 봉천동, 10키로, 지하철
--  5, 정택성, 서울시 동대문구 동대문동, 8키로, 버스 
--출력
--   번호, 이름,  주소, 거리, 교통수단, 기본요금, 총요금 
set serveroutput on

declare
	type class4_record is record(num number,name varchar2(30),addr varchar(300),km number, sudan varchar(15));
	type class4_table is table of class4_record index by binary_integer;
     class4_tab class4_table;
     price number:=0;
     sumprice number:=0;
     j number :=0;
begin
    	class4_tab(1).num := 1;
    	class4_tab(1).name := '김정운';
    	class4_tab(1).addr := '서울시 강남구 역삼동';
    	class4_tab(1).km := 5;
    	class4_tab(1).sudan := '버스';
    	
    	class4_tab(2).num := 2;
    	class4_tab(2).name := '김희철';
    	class4_tab(2).addr := '인천시 남동구 구월동';
    	class4_tab(2).km := 20;
    	class4_tab(2).sudan := '지하철';
    	
    	class4_tab(3).num := 3;
    	class4_tab(3).name := '이재찬';
    	class4_tab(3).addr := '인천시 부평구 부평동';
    	class4_tab(3).km := 16;
    	class4_tab(3).sudan := '지하철';
    	
    	class4_tab(4).num := 4;
    	class4_tab(4).name := '박영민';
    	class4_tab(4).addr := '서울시 관악구 봉천동';
    	class4_tab(4).km := 10;
    	class4_tab(4).sudan := '지하철';
    	
    	class4_tab(5).num := 5;
    	class4_tab(5).name := '정택성';
    	class4_tab(5).addr := '서울시 동대문구 동대문동';
    	class4_tab(5).km := 8;
    	class4_tab(5).sudan := '버스';
    	
    	dbms_output.put_line('번호, 이름,               주소,          거리,      교통수단,  기본요금, 총요금 ');
    	for i in 1 .. class4_tab.count loop
    			if class4_tab(i).km <= 10 then 
    			     if class4_tab(i).sudan ='버스' then 
    			     	price := 1200;
    		     		sumprice := price;	
    		     	elsif class4_tab(i).sudan ='지하철' then
    		     		price := 1250;
    			     	sumprice := price;		
    		     	end if;
    		     	
    		     elsif  class4_tab(i).km between 14 and 17 then
    		          if class4_tab(i).sudan ='버스' then 
    			     	price := 1200;
    		     		sumprice := price+100;	
    		     	elsif class4_tab(i).sudan ='지하철' then
    		     		price := 1250;
    			     	sumprice := price+100;		
    		     	end if;
    		     elsif  class4_tab(i).km between 17 and 21 then
    		          if class4_tab(i).sudan ='버스' then 
    			     	price := 1200;
    		     		sumprice := price+200;	
    		     	elsif class4_tab(i).sudan ='지하철' then
    		     		price := 1250;
    			     	sumprice := price+200;		
    		     	end if;
    		     
    		     end if;
    		     dbms_output.put_line(class4_tab(i).num ||'     '|| class4_tab(i).name ||'    '|| class4_tab(i).addr || 
    		     				'    '||class4_tab(i).km||'km       '|| class4_tab(i).sudan||'       '||price||'       '||sumprice);	 
    		 	
    	end loop;

end;
/

