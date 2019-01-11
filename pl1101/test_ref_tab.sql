--이름 나이를 입력받아 ref_tab 테이블을 참조하여 생성한
--변수(record변수)에 값을 입력한 후 아래와 같이 출력하는
--PL/SQL을 생성하시오.
--출력) 이름: xxx님 나이: xx살
-- (작년나이 xx살, 내년나이: xx 살)
set verify off
set serveroutput on
accept age prompt '나이 입력: '
accept name prompt '이름 입력: '

declare
	ne REF_TAB%rowtype;
	
begin 
	ne.age := &age;
	ne.name := '&name';
	dbms_output.put_line
	(
		'이름: '||ne.name|| ' 님 나이: '||
		ne.age||' 살' || '( 작년나이 '||(ne.age-1)|| ' , 내년나이: '||
		(ne.age+1)|| ' 살)'
	);
					 
end;
/  




