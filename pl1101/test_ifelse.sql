--�̸��� �Է¹޾� '������'�̸� '����'�� ����ϰ� �׷��� ������
--'���'�� ��� �� �� �Է��� �̸��� ����ϴ� PL/SQL�� �ۼ�

set serveroutput on
set verify off

accept name prompt '�̸��� �Է��Ͻÿ� : '
declare
	name varchar(10) := '&name';

begin
	if name = '������' then
		dbms_output.put('�״� �����̴�');
	else 
		dbms_output.put('�״� ����̴�');
	end if;
	dbms_output.put_line(name);

end;
/