/*
3. �̸��� �Է¹޾� ���� �̸��� ����ϴ�  PL/SQL�� �ϼ���.
    �̸��� ���ڼ��� 3�� ���϶�� '�ܼ�'���� �Ǵ��ϰ� 4�� �̻��̶�� 
    '����' �̶�� �Ǵ��Ѵ�.
    �ܼ�- ���� �ϳ��� �� (��: ��,��,��,��),  
    ���� - ���� �ΰ��μ� (�� : ������, �簥���� ��)
    �����  ��: ��  �̸� : ��ö 
*/
set serveroutput on
set verify off

accept name prompt '�̸��� �Է�:  '
declare
	name varchar(40) := '&name';
	firstname varchar2(8);
	secondname varchar2(32);
begin 	 
	if length(name)<4 then
		dbms_output.put('�ܼ��Դϴ�. ');
		firstname := substr(name,1,1);
		secondname := substr(name,2);
	     dbms_output.put_line('�� : '|| firstname || '  �̸�: '|| secondname);
	else
		dbms_output.put('�����Դϴ�. ');
	     firstname := substr(name,1,2);
		secondname := substr(name,3);
	     dbms_output.put_line('�� : '|| firstname || '  �̸�: '|| secondname);
	end if;
end;
/