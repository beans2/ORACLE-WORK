--�����ȣ�� �Է¹޾� CP_EMP2���̺��� �����ȣ�� ��ġ�ϴ� 
--����� �����ϴ� PL/SQL�� �ۼ�.

set serveroutput on
set verify off


	accept empno prompt '�����ȣ: ';
declare
     i_empno cp_emp2.empno%type := &empno;
     cnt number;
begin
	--delete�� where�������� �÷���� �������� ���ٸ� ��� ������ �Ǵ��Ͽ�
	--��� ���ڵ带 �����Ѵ�.
	--������� �÷����� ���еɼ� �ֵ��� �̸��� �����ؾ��Ѵ�.
     delete from cp_emp2
     where empno=i_empno;
     
     cnt:= sql%rowcount;
     if	cnt =1 then
     	dbms_output.put_line(cnt||'�� ���ڵ� ����');
     	commit;
     else
     	dbms_output.put_line('�������� ���ڵ�� ������ �� �����ϴ�.');
          rollback;
     end if;
	
end;
/