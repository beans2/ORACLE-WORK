--외부값 입력 받기
set serveroutput on
set verify off

accept name prompt '이름입력:'
accept age prompt '나이입력:'

declare
	name varchar2(90);
	age number;

begin
	--입력된 값을 변수에 저장
	--입력된 값이 문자열인 경우에는 ''로 묶어서 사용한다.

	name := '&name';
	age := &age;


	dbms_output.put_line(name||' 님 나이는 '||age||' 살 입니다.');
	--태어난 해 출력:xx살 태어난 해 xxxx년생  
	--문자열은 연산이 안된다. 
	dbms_output.put('태어난 해 출력: ');
	dbms_output.put(age||'살 ');
	dbms_output.put_line(to_char(sysdate,'yyyy')-age+1||' 년생');
	
	  
	--산술 연산자가 아닌 연산자의 결과를 출력할 수 없다.
	--dbms_output.put_line(age>10);
	



end;
/
