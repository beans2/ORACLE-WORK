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
	ne REF_TAB%rowtype;
	
begin 
	ne.age := &age;
	ne.name := '&name';
	dbms_output.put_line
	(
		'�̸�: '||ne.name|| ' �� ����: '||
		ne.age||' ��' || '( �۳⳪�� '||(ne.age-1)|| ' , ���⳪��: '||
		(ne.age+1)|| ' ��)'
	);
					 
end;
/  




