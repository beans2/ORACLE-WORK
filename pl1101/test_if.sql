--���� if: ���ǿ� �´� ��쿡�� �ڵ带 ���� �ؾ��� ��.
--�̸��� �Է¹޾� �̸��� '������'�̶�� �̸� ������� 
--'��õ�� �ڶ�'�� ��� �� ��. �ٸ��̸��� �̸��� ���
set serveroutput on
set verify off

accept name prompt '�̸��Է�: '

declare

	name table_primary.name%type := '&name';
begin 
	
	if name='������' then
		dbms_output.put('��õ���� �ڶ� ');
	end if;   
	
	dbms_output.put_line(name||' �� �ȳ��ϼ���?');
	

end;
/          



