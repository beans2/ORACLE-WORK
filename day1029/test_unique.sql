--unique: ���� ���� ���� �ְ� �ִٸ� �����ؾ� �� ��.
--�̸�, �̸���, �ּ� �����ϴ� ���̺� ����

create table column_unique(
	name varchar2(30),
	email varchar2(50)constraint uk_email unique,
	addr varchar2(100)
);


select * from user_constraints;

--�߰�����
--�����Է�
insert into column_unique(name,email,addr)
values('������','lee@test.com','��⵵ ������ ���뱸');
commit;

--�̸����� ����(null�Է�) ���
insert into column_unique(name,addr)
values('������','��⵵ ������ ���뱸');
commit;

insert into column_unique(name,email,addr)
values('������','','��⵵ ������ ���뱸');
commit;

--�����ϴ� ���
--���� �̸����� �ԷµǾ��� ��
insert into column_unique(name,email,addr)
values('�ڿ���','lee@test.com','�λ�� ');
commit;

--���̺����
--��ȣ, �̸�, ��ȭ��ȣ, ī���ȣ�� �����ϴ� ���̺��� ����
--��ȭ��ȣ�� ī���ȣ�� ���� ���� �ְ� �ִٸ� ����

create table table_unique(
	name varchar2(30),
	num number(5),
	tel varchar2(13),
	constraint uk_tel unique(tel),
	card_num char(4),
	constraint uk_card_num unique(card_num)
);

--�߰�����
--�����Է�
insert into table_unique(num,name,tel,card_num)
values(1,'������','010-8769-6112','1234');
commit;

--��ȭ��ȣ�� ī���ȣ�� �ٸ����
insert into table_unique(num,name,tel,card_num)
values(2,'��������', '010-1111-2222','1235');

--null�Է�
insert into table_unique(num,name,tel,card_num)
values(2,'��������', '','');
commit;

insert into table_unique(num,name)
values(2,'������');

--����
--��ȭ��ȣ�� ī���ȣ�� ���߿� �ϳ��� ���ٸ� ����
insert into table_unique(num,name,tel,card_num)
values(4,'���ü�', '010-1111-2223','1235');

insert into table_unique(num,name,tel,card_num)
values(4,'���ü�', '010-1111-2222','9999');

--------------------------------------------
select * from TABLE_UNIQUE;
