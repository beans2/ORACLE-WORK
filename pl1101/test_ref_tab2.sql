--�̸� ���̸� �Է¹޾� ref_tab ���̺��� �����Ͽ� ������
--����(record����)�� ���� �Է��� �� �Ʒ��� ���� ����ϴ�
--PL/SQL�� �����Ͻÿ�.
--���) �̸�: xxx�� ����: xx��
-- (�۳⳪�� xx��, ���⳪��: xx ��)

set verify off
set serveroutput on
accept age prompt '���� �Է�: '
accept name prompt '�̸� �Է�: '

declare
	age ref_tab.age%type;
	name ref_tab.name%type;
	
begin 
	age := &age;
	name := '&name';
	dbms_output.put_line
	(
		'�̸�: '||name|| ' �� ����: '||
		age||' ��' || '( �۳⳪�� '||(age-1)|| ' , ���⳪��: '||
		(age+1)|| ' ��)'
	);
					 
end;
/ 