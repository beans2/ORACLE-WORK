/*
3. 이름을 입력받아 성과 이름을 출력하는  PL/SQL을 하세요.
    이름의 글자수가 3자 이하라면 '단성'으로 판단하고 4자 이상이라면 
    '복성' 이라고 판단한다.
    단성- 성이 하나인 성 (예: 김,이,오,박),  
    복성 - 성이 두개인성 (예 : 선우용녀, 재갈공명 등)
    출력은  성: 김  이름 : 희철 
*/
set serveroutput on
set verify off

accept name prompt '이름을 입력:  '
declare
	name varchar(40) := '&name';
	firstname varchar2(8);
	secondname varchar2(32);
begin 	 
	if length(name)<4 then
		dbms_output.put('단성입니다. ');
		firstname := substr(name,1,1);
		secondname := substr(name,2);
	     dbms_output.put_line('성 : '|| firstname || '  이름: '|| secondname);
	else
		dbms_output.put('복성입니다. ');
	     firstname := substr(name,1,2);
		secondname := substr(name,3);
	     dbms_output.put_line('성 : '|| firstname || '  이름: '|| secondname);
	end if;
end;
/