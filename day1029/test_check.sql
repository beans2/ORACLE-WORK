--check, not null, default
--check: �÷��� ���� ��ȿ�� ������ ������ �߰��� ��
--not null: ���� �ݵ�� �Է¹޾ƾ� �� ��
--default: �÷��� �����Ǿ�  null�� �Էµ� �� ��� �� �⺻��.

--�̸�, ����, �ּ�, �Է����� �����ϴ� ���̺��� �����Ͻÿ�
-- ��, �̸��� �ʼ��Է��̰�, ���̴� 20~30����� �Է°����ϰ�
--�Է����� �����Ǹ� ���� ��¥�� �Էµǵ��� �����Ͻÿ�/

create table other_constraints(
	name varchar2(30 byte) constraint c_name not null,
	age number(2) constraint c_age check(age between 20 and 39),
	addr varchar2(20byte) null,
	input_date date default sysdate

	);
--user_constraints������ �������(PK,FK,UK,check, not null)�� Ȯ�ΰ���
select * from other_constraints;

--defaultȮ���ϰ� ������ select * from user_tab_cols�� Ȯ���ϱ�
select * from user_tab_cols
where table_name='OTHER_CONSTRAINTS';


--�߰�����
--���� ������
insert into other_constraints(name,age,addr,input_date)
values('������',27,'�����','2018-10-26');
--�ּҿ� �Է��� ����
insert into other_constraints(name,age)
values('�ڿ���' , 27 );

--error
--�̸��� �����Ǵ� ���(not null����)
insert into other_constraints(age,addr,input_date)
values(27,'�����','2018-10-26');

insert into other_constraints(name,age,addr,input_date)
values('',27,'�����','2018-10-26');

--���̰� 20~30�� �ƴ� ���
insert into other_constraints(name,age,addr,input_date)
values('������',15,'�����','2018-10-26');

insert into other_constraints(name,age,addr,input_date)
values('������',40,'�����','2018-10-26');

-------------------------------------------------------
select * from OTHER_CONSTRAINTS;

--not null�� ���̺���� ��������� ������ �� ����.
create table temp(
	name varchar2(10),
	constraint c_name1 not null(name)
	);


--alter
--���� ��ױ�: �����ڸ� ����
alter user scott account lock;

--���� ����:
alter user scott account unlock;

--��� ����
alter user scott identified by 1111;
alter user scott identified by tiger;

--���̺� ����
create table test_atler(
	num number,
	neam varchar2(30),
     addr number
     );

--���̺����
alter table test_atler rename to test_alter;

-- �÷��� ����
alter table test_alter rename column NEAM to NAME;

--�÷��� �������� ����: ���ڵ尡 �����Ƿ� ������������ ���氡��\
--addr �� number ���������� varchar2(100)
alter table test_alter modify addr varchar2(100) not null;

insert into test_alter(num,name,addr) values(1,'�׽�Ʈ','����� ������');
commit;
--���������� ������ ������ ���ڵ尡 ����־���Ѵ�.
alter table test_alter modify addr number;
--���ڵ尡 ������ ������ ���� ������������ ũ�⸸ ���氡��
alter table test_alter modify addr varchar2(200);
alter table test_alter modify addr varchar2(10); --==> ������ �ȵ�

--�÷� �߰�: �߰��Ǵ� �÷��� ���� �������� �߰��ȴ�.
--���ڵ尡 �������� ������ ��� ��������� �ο��� �� �ִ�.
alter table test_alter add id varchar2(16);
--�÷�����
alter table test_alter drop column addr;

--������� �߰�
--���ڵ��� ������ ��������� �����ϰ� �ִ��� �Ǵ�.
update test_alter
set    id='test'
where  num=1;

alter table test_alter add constraint pk_test_alter
	primary key(id);

	--> NULL�� �ִ� ���� pk�� �������ָ� ����
select * from user_constraints
where table_name= 'TEST_ALTER';

--������� ��Ȱ��ȭ: ���������� �������� �ʴ´�.
alter table test_alter disable constraint pk_test_alter;

insert into test_alter(num,name,id) values(2,'������','test');

--������� Ȱ��ȭ: ���ڵ��� ������ ���� �ٸ���.
delete from test_alter where num=2;
alter table test_alter enable constraint pk_test_alter;

--������� ����
alter table test_alter drop constraint pk_test_alter;

---------------------------------
select * from TEST_ALTER;
