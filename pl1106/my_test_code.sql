--�μ���ȣ�� �Է¹޾� �ش� �μ��� ���� �����ȣ, �����, �Ի���, ������ ��ȸ

--�Ի����� "��-��-��-�б�"�� �������� ���

set serveroutput on
set verify off
	accept deptno prompt '�μ���ȣ : '
declare
	--1.����
	cursor cur_emp is
		select  empno, ename, sal, to_char(hiredate,'yyyy-mm-dd q') hiredate
		from emp
		where deptno=&deptno;
	i number:=0;
begin
     -- open cur_emp; Ŀ���� �̹� ���������Ƿ� ����
	--2. for�� ����� ����(fetch�� ������� �ʴ´�)
	if &deptno in(10,20,30) then
		for emp_data in cur_emp loop
			dbms_output.put_line(emp_data.empno||' '|| emp_data.ename||' '|| emp_data.sal||' '|| emp_data.hiredate);	
			i:= i+1;
		end loop;
		dbms_output.put_line(i||'�� ���');
	else 
		dbms_output.put_line('�߸� �Է��ߴ�');
	end if;
	--close cur_emp; for�� ���� ������ ���� Ŀ���� ������ ������ ���� 
	
end;
/ 