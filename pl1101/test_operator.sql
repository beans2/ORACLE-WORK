--�ܺΰ� �Է� �ޱ�
set serveroutput on
set verify off

accept name prompt '�̸��Է�:'
accept age prompt '�����Է�:'

declare
	name varchar2(90);
	age number;

begin
	--�Էµ� ���� ������ ����
	--�Էµ� ���� ���ڿ��� ��쿡�� ''�� ��� ����Ѵ�.

	name := '&name';
	age := &age;


	dbms_output.put_line(name||' �� ���̴� '||age||' �� �Դϴ�.');
	--�¾ �� ���:xx�� �¾ �� xxxx���  
	--���ڿ��� ������ �ȵȴ�. 
	dbms_output.put('�¾ �� ���: ');
	dbms_output.put(age||'�� ');
	dbms_output.put_line(to_char(sysdate,'yyyy')-age+1||' ���');
	
	  
	--��� �����ڰ� �ƴ� �������� ����� ����� �� ����.
	--dbms_output.put_line(age>10);
	



end;
/
