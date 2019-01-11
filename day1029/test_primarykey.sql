--��������� Ȯ��: user_constraints
select *
from user_constraints;

-- ��ȣ, �̸�, ��ȭ��ȣ, �ֹι�ȣ, �̸����� �����ϴ� ���̺��� ����.
-- �ֹι�ȣ�� NULL�� ������� �����鼭 �����ؾ��Ѵ�.
create table column_primary(
	num number,
	name varchar2(30),
	tel varchar2(13),
	ssn char(14) constraint pk_column_primary primary key,
	email varchar2(50)
);

/*drop table column_primary;
purge recyclebin;*/

insert into column_primary(num, name,ssn)values(1,'test','880101-1234567');

insert into dept(deptno, dname, loc) values(10,'t','t');


--�÷��ϳ��� pk�� �����Ǵ� ���
--�߰�����
--���� ���ڵ� ����
insert into column_primary(num,name,tel,ssn,email)
values(1,'������','010-1234-5678','880101_1234567','lee@test.com');
select * from COLUMN_PRIMARY;
commit;

--�ֹι�ȣ�� �ٸ� ���
insert into column_primary(num,name,tel,ssn,email)
values(2,'������','010-1234-6432','890101_1234567','lee@test.com');

--�߰�����
--�ֹι�ȣ�� ���� �ֹι�ȣ�� �ԷµǴ� ���
insert into column_primary(num,name,tel,ssn,email)
values(3,'���ü�','010-7281-1279','880101_1234567','jung@test.com');

--null�� �ԷµǴ� ���
--����, ��¥�� �÷��� �����Ǹ� null�� �Էµǰ�
--���ڿ�(��������, ��������)�� �÷��� �����Ǵ� ���� "(empty)
--�� �����Ͱ� �߰��Ǵ� ��쿡 null �Էµȴ�.
--�÷��� �����Ǿ� insert �Ǵ� ���
insert into column_primary(num,name,tel,email)
values(3,'���ü�','010-7281-1279','jung@test.com');
--�÷��� ���ǵǾ������� ''�� �ԷµǴ� ���
insert into column_primary(num,name,tel,ssn,email)
values(3,'���ü�','010-7281-1279','','jung@test.com');

--table level constraint
--�̸�, ���̵�, ��й�ȣ�� �����ϴ� ���̺��� ����
--���̵�� null�� ������������鼭 ���� �����ؾ��Ѵ�.

create table table_primary(
	name varchar2(30),
	id varchar2(20),
	passwd varchar2(30),
	constraint pk_table_primary primary key(id)
);

--�߰�����
insert into table_primary(name,id, passwd)
values('����ö','kim','1234');
insert into table_primary(name,id, passwd)
values('����ö','test','1234');
commit;
select * from TABLE_PRIMARY;
--�߰�����
insert into table_primary(name,passwd)
values('����ö','1234');
insert into table_primary(name,id,passwd)
values('����ö','','123455');



--���� ������ �����ȣ���� 1������ ������
--EMMP_00007899 �� ������ ���� ���� ��ȸ
--���� �Ѱ�
select 'EMP_'||lpad(empno+1,8,'0')
from (select rownum r ,empno from emp order by empno)
where r =14;

--������� �ϽŰ�
select concat('EMP_',lpad(max(empno)+1,8,0))
from emp;

select * from EMP order by empno  ;


--�������� �÷��� pk�� �����Ǵ� ���.
--table ���� ����������θ� ��������

--�����۸�, ������ ��ȣ, ����
--������ ��ȣ�� ���ڵ尡 �߰��ɶ� ����������
--�����ϸ� 'ITEM_0001'�� ������ ������.
--������ ��ȣ�� �����۸��� ���� �� ����.

create table table_multi_primary(
	item_num char(9),
	item varchar2(60),
	item_info varchar2(4000),
	constraint pk_table_multi_primary primary key(item_num, item)
);
select * from user_constraints;

--'ITEM_0001' ��ȸ
select 'ITEM_'||lpad(nvl(max(item_num),0)+1,4,0) from table_multi_primary ;

insert into  table_multi_primary;

--�������� �÷��� �ϳ��� PK�� �����Ǵ� ���
--�߰�����: ���ʵ����� �Է�
insert into table_multi_primary(item_num, item, item_info)
values((select 'ITEM_'||lpad(nvl(max(item_num),0)+1,4,0) from table_multi_primary ),'���ĸ�','�ٷ� �� ���̴����� ���� ���̴��� ��� �ٿ� �� �ִ�.');
-- �� �÷��� ���� ��� �ٸ� ��� : ����
insert into table_multi_primary(item_num,item, item_info)
values((select 'ITEM_'|| lpad(max(substr(item_num,instr(item_num,'_')+1,4))+1,4,0) from table_multi_primary ),'����ź ','�����Ÿ� �� ���̴����� ���� ���̴��� ��� �ٿ� �� �ִ�.');

select * from TABLE_MULTI_PRIMARY;
commit;

--�� �÷� �� �ϳ��� �÷��� �ٸ����
insert into table_multi_primary(item_num,item, item_info)
values('ITEM_0002','����ź','�����Ÿ� �� ���̴����� ���� ���̴��� ��� �ٿ� �� �ִ�.');
--�� �÷� ��� ���� ���� ���� ��
insert into table_multi_primary(item_num, item, item_info)
values('ITEM_0002','���ĸ�','���ϸ� ¥����.');

--���� �ϳ��� null�� �߰��� ��
insert into table_multi_primary(item_num, item, item_info)
values('ITEM_0002','','���ϸ� ¥����.');

insert into table_multi_primary(item_num,item_info)
values('ITEM_0003','Ư�� ���̴��� ���� �̻��� �߻�.');

delete from dept
where deptno = 30;
rollback;





