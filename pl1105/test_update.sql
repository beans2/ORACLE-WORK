--pl sql���� update�� ���
--

set serveroutput on


declare
	cnt number;
begin
	update cp_emp2
	set    sal = 3500
	where  empno=2221;
	
	--�Ͻ���(������)Ŀ�� sql�� ����Ͽ� ������ ���� ���� ��´�.
	cnt:= sql%rowcount;
	--����� ����� 1���϶��� Transaction�� �Ϸ��ϰ� �׷��� �ʴٸ� 
	--�۾��� ���.

	if cnt =1 then
		dbms_output.put_line(cnt||'�� ����');
		commit;
	else
		dbms_output.put_line('��ȸ�� ����� �������̰ų� �����Ƿ� �����۾��� ����մϴ�.');
		rollback;
	end if;

end;
/
