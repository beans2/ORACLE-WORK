select * from user_procedures;
--�ܺκ�������
var cnt number;
var msg varchar2(300);
--���ν��� ����
execute update_test_proc(1112,'����',3000,:cnt, :msg);
--ó����� ���
print msg;
print cnt;

-- ����:���, ����, �븮, ����, ����, ���� ,�̻�, ��, ����, ��ǥ�̻�
execute update_test_proc(1112,'����',3100,:cnt, :msg);
--ó����� ���
print msg;
print cnt;

--�������
execute update_test_proc(1114,'����',2490,:cnt, :msg);
--ó����� ���
print msg;
print cnt;

select * from test_proc;


--����: �����ϴ� �����ȣ�� ����, �������� �ʴ� �����ȣ�� ����
exec delete_test_proc(1111,:msg,:cnt);
print msg;
print cnt;

var sal number;

exec select_test_proc_cnt('��븮',:msg,:cnt,:sal);
print msg;
print cnt;
print sal;

select * from test_proc;

var address varchar2(300);
var cnt number;
select * from zipcode where dong like '%����7��%';

--�� �̸����� �����ȣ �˻�
exec search_zipcode('����7��',:msg,:cnt);
print msg;
print cnt;

--sys_refcursor�� ���
var cur_dept refcursor;

--sys_refcursor�� ����
exec	select_all_dept(:cur_dept);

--���
print cur_dept;
--�μ���ȣ �Է��Ͽ� �μ��� ��� ���� ��ȸ
var cur_emp refcursor;

exec select_emp(15,:cur_emp);
print select_emp;

select * from DEPT;
select * from EMP;
