create table test_proc as
(
select empno,ename,hiredate,sal,job from EMP
where 1=0);

alter table test_proc add constraint pk_test_proc primary key(empno);

--insert_test_proc ���ν����� ����
var msg varchar2(300);
var cnt number;

--��������

exec insert_test_proc(1111,'�׽�Ʈ',3000,'����',:msg,:cnt);

--������
print msg;
print cnt;
select * from TEST_PROC;
--������� 1. �����ȣ 1~9999 , 0���Է�, 10000���Է�
exec insert_test_proc(0,'�׽�Ʈ',3000,'����',:msg,:cnt);

--������
print msg;
print cnt;

exec insert_test_proc(10000,'�׽�Ʈ',3000,'����',:msg,:cnt);

--������
print msg;
print cnt;

--�������2. ������ 2500~8000 ���� ,2500 ���϶�� 2500����,
--8000�̻��̶�� 8000���� �߰�
--������
exec insert_test_proc(1112,'�׽�Ʈ',2400,'���',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--������
exec insert_test_proc(1113,'�׽�Ʈ',8500,'���',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--������� 3.
--������
exec insert_test_proc(1114,'�׽�Ʈ',1400,'�˹�',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--����4 ������ ù�ڸ� �빮�ڷ�
--������
exec insert_test_proc(1114,'kim',1400,'���',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;

--5, ������� ��� �ԷµǴ� ���
exec insert_test_proc(1115,'������',5000,'����',:msg,:cnt);

print msg;
print cnt;
select * from TEST_PROC;



