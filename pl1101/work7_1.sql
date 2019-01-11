/* 1. 혈액형을 입력받아 혈액형별 특징을 출력 하는 PL/SQL작성.
   -혈액형은 대소문자 모두 비교 가능 해야한다.
   -'A' : 내향적이다. 조심스럽고, 세심하다
   -'B' : 자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.
   -'AB' : 합리적이다. 합리적인 반듯함을 선호하게된다. 
   -'O' :  한결같은 노력과 추진력이 있다. 동료의식이 강하다 
*/

set serveroutput on
set verify off

accept bloodtype prompt '혈액형을 입력:  ' 
declare
	bloodtype varchar(3) := '&bloodtype';	

begin
	if bloodtype = 'A' then
		dbms_output.put_line(bloodtype||' : 내향적이다. 조심스럽고, 세심하다');
	elsif bloodtype = 'B' then
		dbms_output.put_line(bloodtype||' : 자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.');
	elsif bloodtype = 'AB' then
		dbms_output.put_line(bloodtype||' : 합리적이다. 합리적인 반듯함을 선호하게된다.');
	else
		dbms_output.put_line(bloodtype||' : 내향적이다. 조심스럽고, 세심하다');
	end if;
end;
/
-------------------------------------

