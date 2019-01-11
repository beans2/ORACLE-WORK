/* 8.1번
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
*/
set serveroutput on

declare
	type class4_record is record(num number , name varchar2(20), addr varchar2(200), km number, sudan varchar2(10));
	type class4_table is table of class4_record index by binary_integer;
	class4_tab class4_table;
	price number :=0;
	sumprice number :=0;
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
	dbms_output.put_line('----------------------------------work8_1-------------------------------');
	dbms_output.put_line('번호, 이름,         주소,             거리,     교통수단,   기본요금,   총요금');
	for i in 1 .. class4_tab.count loop
		if class4_tab(i).sudan = '버스' then
			price:=1200;
		else
			price:=1250;
		end if;
		sumprice:=price;

		if class4_tab(i).km > 13 then
			sumprice := price + ceil((class4_tab(i).km-10)/4)*100;
		end if;
		dbms_output.put_line(class4_tab(i).num||'     '||class4_tab(i).name||'  '||rpad(class4_tab(i).addr,24,' ')||'  '||
		rpad(class4_tab(i).km,3,' ')||'      '||rpad(class4_tab(i).sudan,12,' ')||'   '||price||'    '||sumprice);
	end loop;
	dbms_output.put_line('-------------------------------------------------------------------------');
end;
/


/*
-- 숙제 2.
--  학생들의 정보를 처리하는 PL/SQL작성.
--   번호, 이름, 오라클점수,자바점수,총점,평균 을 저장할 수있는 record를
--  만들고 아래의 데이터를 입력한 후
--  반복문을 사용하여  총점,평균을 처리하는 PL/SQL 작성
-- 1, 김정운, 80,81
--  2, 김희철, 94,80
--  3, 이재찬, 97,96
--  4, 박영민, 86,92
--  5, 정택성, 76,99
--
-- 출력
--   번호, 이름, 오라클점수,자바점수,총점,평균
--  .
--  .
--  .
--  자바최고점수 [xx] 오라클 최고점수 [xxx]


set serveroutput on

declare
	type score_record is record(num number, name varchar2(20), oracle_score number, java_score number);
	type score_table is table of score_record index by binary_integer;
	score_tab score_table;
	score_sum number:=0;
	java_score_max number :=0;
	oracle_score_max number:=0;
begin
    score_tab(1).num := 1;
    score_tab(1).name := '김정운';
    score_tab(1).oracle_score := 80;
    score_tab(1).java_score := 81;

    score_tab(2).num := 2;
    score_tab(2).name := '김희철';
    score_tab(2).oracle_score := 94;
    score_tab(2).java_score := 80;

    score_tab(3).num := 3;
    score_tab(3).name := '이재찬';
    score_tab(3).oracle_score := 97;
    score_tab(3).java_score := 96;

    score_tab(4).num := 4;
    score_tab(4).name := '박영민';
    score_tab(4).oracle_score := 86;
    score_tab(4).java_score := 92;

    score_tab(5).num := 5;
    score_tab(5).name := '정택성';
    score_tab(5).oracle_score := 76;
    score_tab(5).java_score := 99;

    dbms_output.put_line(' 번호,   이름,    오라클점수,   자바점수  ,  총점  ,  평균 ');

    for i in 1.. score_tab.count loop
    	score_sum := score_tab(i).oracle_score+ score_tab(i).java_score;
    	dbms_output.put_line(score_tab(i).num ||'     '||score_tab(i).name||'       '|| score_tab(i).oracle_score||'           '
    						||score_tab(i).java_score||'          '||score_sum|| '       '||score_sum/2);
    	if oracle_score_max < score_tab(i).oracle_score then
    	     oracle_score_max := score_tab(i).oracle_score;
    	elsif java_score_max < score_tab(i).java_score then
    	     java_score_max := score_tab(i).java_score;	
    	end if;
    end loop;
        dbms_output.put_line('자바 최고점수: ['||java_score_max||'] 오라클 최고 점수 ['||oracle_score_max||']');
end;
/
*/

/*
3. 아래의 데이터를 처리하는  PL/SQL작성
    "이름, 주민번호, 나이, 성별"을 저장할 수 있는 테이블을
    생성하고 아래의 데이터를 채운다.
   김정운, 880101-1234567  
   김희철, 890101-1234567  
   이재찬, 011231-3234567   
   박영민, 920101-2234567    
   정택성, 020420-4234567   
   위의 데이터를 사용하여 
   번호,주민번호,나이, 성별을 보여주는  PL/SQL을 작성하세요.

set serveroutput on

declare
	type person_record is record(name varchar2(20), personnum varchar(15));
	type person_table is table of person_record index by binary_integer;
	person_tab person_table;
	age number := 0;
	gender varchar2(6);
	
begin
	person_tab(1).name:='김희철';
	person_tab(1).personnum:='890101-1234567';   

    person_tab(2).name:='이재찬';
	person_tab(2).personnum:='011231-3234567';   
	
	person_tab(3).name:='박영민';
	person_tab(3).personnum:='920101-2234567';   
	
	person_tab(4).name:='정택성';
	person_tab(4).personnum:='020420-4234567'; 
	
	dbms_output.put_line(' 번호,   주민번호,	     나이,	  성별 ');
	for i in 1..person_tab.count loop
		if substr(person_tab(i).personnum,instr(person_tab(i).personnum,'-')+1,1) in('1','2') then
			age := to_char(sysdate,'yy')-substr(person_tab(i).personnum,1,2)+100+1;
		else 
			age := to_char(sysdate,'yy')-substr(person_tab(i).personnum,1,2);		
		end if;
		if substr(person_tab(i).personnum,instr(person_tab(i).personnum,'-')+1,1) in('1','3') then
			gender := '남자';
		else
			gender := '여자';
		end if;	
		dbms_output.put_line(person_tab(i).name||'    '||person_tab(i).personnum||'       '||age||'         '||gender);	
	end loop; 

end;
/
*/


