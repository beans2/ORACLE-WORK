--��ǰ��, �����, ������ �Է¹޾� ������� 'Ư��'�̶�� ��ǰ������ 30%���ε�
--�������� ����ϼ���. Ư���� �ƴ϶�� '�Ϲ�'
-- xx��� ���� ������ xxx�� �Դϴ�. 
--"Ư���� ��쿡�� �Ʒ��� �޽��� ���"
-- ��ǰ���� xx�� ���ΰ� xx��
set serveroutput on
set verify off

accept name prompt '��ǰ��  �Է� : '
accept rank prompt '�����("�Ϲ�" or "Ư��")  �Է� : '
accept price prompt '����  �Է� : '
declare
	name varchar(60):='&name';
	rank char(6):='&rank';
	price number(7):=&price;
begin

	dbms_output.put_line(rank||' ��� ����'||name||' ��ǰ�� ������'|| price||'���Դϴ�');
	if rank = 'Ư��' then
		dbms_output.put_line(' ��ǰ���� : '||price||'�� ���ΰ� : '||price*0.7||' ��');
	end if;
end;
/    

