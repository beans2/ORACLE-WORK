--�����, ��ǰ��, ������ �Է¹޾� ó���ϴ� PL/SQL�� �ۼ�
--����� ������� 'Ư�� �Ǵ� �Ϲ�'�� ��쿡�� ���α׷��� ����Ǿ� ������ �����մϴ�
--Ư������ ��ǰ������ ��ǰ���� 50%, �Ϲݰ��� ��ǰ������ 
--��ǰ���� 30%�� ����Ͽ� ���


set serveroutput on
set verify off

accept rank prompt '������� �Է�: '
accept name prompt '��ǰ�̸��� �Է�: '
accept price prompt '������ �Է�: '

declare
	rank varchar(40):= '&rank';
	name varchar(40):= '&name';
	price number:= &price;
	sale number :=0.3;
	
begin
	if rank in('Ư��','�Ϲ�') then
		if rank = 'Ư��' then
			sale:=0.5;
		end if;
		dbms_output.put_line('������ �����:  '|| rank || '�̰�'||name||' ��ǰ�� ������'|| (price-(price*sale))||'�Դϴ�');
	end if;
	dbms_output.put_line('������� Ư�� �̳� �Ϲ����� �������ּ���');
	
end;
/


