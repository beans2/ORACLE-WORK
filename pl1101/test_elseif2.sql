-- ������ �Է¹޾� 0~100���϶� ���� ���, 0~100���̰� �ƴ϶��
-- �Է� �������
-- 0~100������ �� 0~40���̶�� '����' 41~60 -�ٸ� ���� ����
-- 61~100�̸� �հ��� ���


set serveroutput on
set verify off

accept score prompt '������ �Է��Ͻÿ�: '
declare
	score number := &score;
begin 
	dbms_output.put('���� : '||score);
	if score between 0 and 100 then 
		if score <= 40 then
			dbms_output.put_line(' ���� OTL');
		elsif score <= 60 then
	     	dbms_output.put_line(' �ٸ����� ����'); --����
		else                    
	     	dbms_output.put_line(' �ڰ��� ���'); --����
		end if;
	end if;
end;
/
