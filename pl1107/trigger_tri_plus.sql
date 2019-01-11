--cp_emp���̺� ���ڵ尡 �߰��Ǹ�
--cp_emp3 ���̺� �����ȣ, �����,�μ���ȣ,����, ������ �߰��ϴ� Ʈ���Ÿ� �ۼ�
--�μ���ȣ�� emp���̺��� �����ȣ�� 7788�� ����� ������ ��ȣ�� �߰�
--������ 2000���ϰ� �߰��Ǹ� cp_emp3���̺��� ������ 500�� 
--���Ͽ� �߰��ϴ� trigger �ۼ�

create or replace trigger tri_plus
after insert on  cp_emp
for each row 
declare 

	sal number(4); 
	deptno_7788 number(4);
begin 

	select deptno
	into deptno_7788
	from  emp
	where empno='7788';
	
	
	if (:new.sal <2000) then
		sal := :new.sal+500;
	else
		sal := :new.sal;
	end if; 
	
	insert into cp_emp3(empno,ename,deptno,job,sal)
	values(:new.empno,:new.ename, deptno_7788, '���' , sal);

end;
/
