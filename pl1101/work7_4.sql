/*
4. ��������� �Է¹޾�, '�ý�','����','����ö' �� ��쿡�� 
  �Ʒ��� ���� ������� �Ѵ� ����� �����ϼ���.
   �ý� : 3800 -
   ���� : 1200
   ����ö :1250��
 ��� : ����ٿ� ����ϴ� ��������� 'XX'�̰� �⺻ ���: xx ���Դϴ�.
      �պ������ xx���̰�, �Ѵ� 20�� ���� ������ xx�� �Դϴ�.
    �ý�, ����, ����ö�� �ƴ϶��  '���߱����� �ƴմϴ�.' �� ����ϼ���.

*/ 
set serveroutput on
set verify off

accept sudan prompt '��������� �Է�:  '
declare
	sudan varchar(20) := '&sudan';
	yogum number;
	texiyogum number :=3800;
	busyogum number :=1200;
	subyogum number :=1250;
begin
	if sudan in('�ý�','����','����ö') then	 
		if sudan ='�ý�' then
		yogum:= texiyogum;	
		elsif sudan ='����' then
		yogum:= busyogum;
		elsif sudan='����ö' then
		yogum:= subyogum;	
		end if;
		dbms_output.put_line('����ٿ� ����ϴ� ��������� '||sudan||'�̰� �⺻���:'||yogum||
	  			'�Դϴ�.'||'�պ������'||yogum*2||'�Ѵ� 20�� ���� ������' ||yogum*40);
	else
		dbms_output.put_line('���߱����� �ƴմϴ�.');
	end if;
	
end;
/