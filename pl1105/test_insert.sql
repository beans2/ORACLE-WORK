--PL/SQL���� DML ���
set serveroutput on

declare

begin
	insert into cp_emp3(empno, ename, deptno, job, sal)
		values(3333,'���缮',10,'�����',8000);
	if sql%rowcount = 1 then
	commit;
	--������ ���� �� ��� :�Ͻ���(������)Ŀ�� ���
	--sql(�Ͻ��� Ŀ��)
	--insert�� �߰����� �ƴϸ� ���ܰ� �߻��ϰ� �ǹǷ� 
	--���� �Ͻ���Ŀ���� ����Ͽ� �߰��� ���� ���� ���
	--���� �ʿ䰡 ����.
	dbms_output.put_line(sql%rowcount||'���߰�');
     else
     	rollback;
     end if;
	exception
	when others then
	dbms_output.put_line('���� �߻�');
end;
/

