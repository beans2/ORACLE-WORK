/* 1. �������� �Է¹޾� �������� Ư¡�� ��� �ϴ� PL/SQL�ۼ�.
   -�������� ��ҹ��� ��� �� ���� �ؾ��Ѵ�.
   -'A' : �������̴�. ���ɽ�����, �����ϴ�
   -'B' : �ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.
   -'AB' : �ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�. 
   -'O' :  �Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ� 
*/

set serveroutput on
set verify off

accept bloodtype prompt '�������� �Է�:  ' 
declare
	bloodtype varchar(3) := '&bloodtype';	

begin
	if bloodtype = 'A' then
		dbms_output.put_line(bloodtype||' : �������̴�. ���ɽ�����, �����ϴ�');
	elsif bloodtype = 'B' then
		dbms_output.put_line(bloodtype||' : �ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.');
	elsif bloodtype = 'AB' then
		dbms_output.put_line(bloodtype||' : �ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�.');
	else
		dbms_output.put_line(bloodtype||' : �������̴�. ���ɽ�����, �����ϴ�');
	end if;
end;
/
-------------------------------------

