--�ܷ�Ű: �ٸ����̺�(�θ�)�� �����θ� ���� �߰��ؾ��� �� ���.
--null, �ߺ����� ����Ѵ�.

--�÷����� ������� : foreign key�� ������� �ʴ´�.
-- table_primary ���̺��� id���� �����Ͽ� �����͸� �߰��ϴ�
--foreign key ����
--�ڽ����̺��� �÷����� ���� �ʿ�� ���� , ���������� ũ�⸸ �����ָ� �ȴ�.
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id
		references table_primary(id),
	tel varchar2(13), address varchar2(400)
);
drop table column_foriegn;

--�߰�����
--�θ����̺� �����ϴ� ������ �߰�

insert into column_foreign(f_id,tel, address)
values('kim','010-6784-9713','SM');
insert into column_foreign(f_id,tel, address)
values('test','010-6784-9713','����� ������ �ѵ�����');

--���� ���̵�� ���� �߰��� �� �ִ�.
insert into column_foreign(f_id,tel, address)
values('kim','010-6784-9713','JYP');

--null���
insert into column_foreign(tel, address)
values('010-6784-9713','�̽�ƽ');

--�θ����̺� ���� ���� �߰��ϸ� error�߻�
insert into column_foreign(f_id,tel, address)
values('kim1','010-6784-9713','JYP');

--�θ����̺��� �����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �������� �ʽ��ϴ�.
insert into TABLE_PRIMARY(name,id,passwd)
values('��ȣ��','kang','1234');
commit;
--kang�� �����ϴ� ���ڵ尡 �������� �����Ƿ� �����ȴ�.
delete from table_primary where id = 'kang';
--kim�̳� test�� �����ϴ� ���ڵ尡 �����ϹǷ� �����Ұ�
delete from table_primary where id = 'kim';
delete from table_primary where id = 'test';

--on delete cascade�� �������� �ʾ��� ������ �����ϴ� �ڽķ��ڵ带
--��� �����ϰ� �θ��ڵ带 �����Ѵ�.

delete from column_foreign where f_id = 'kim';     --�ڽ��� ���ڵ� �����
delete from table_primary where id='kim';		--�θ��� ���ڵ� �����.
commit;

--���̺� ���� �������
create table table_foreign(
	id varchar2(20),
	java_score number(3),
	oracle_score number(3),
	constraint fk_table_foreign_id foreign key(id) references table_primary(id)
	);

--�θ����̺� �����ϴ� ������ �߰�
insert into table_foreign(id,java_score, oracle_score)
values('kim',97,78);
commit;

--�����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �θ����̺��� �ٷ� ���� �Ұ�
delete from table_primary
where id = 'kim' ;

insert into table_primary(name, id, passwd)
values('���߱�','song','1234');
insert into table_primary(name, id, passwd)
values('����','gong','1234');
commit;

--�θ��ڵ带 �����ϸ� �����ϴ� ��� �ڽ� ���ڵ带 �����ϴ� �ɼ�: on delete cascade ���
create table test_cascade(
	id varchar2(20),
	addr varchar2(100),
	constraint fk_test_id foreign key(id)
		references table_primary(id)
		on delete cascade
);
insert into test_cascade(id,addr)
	values('song','������ ���ﵿ');
insert into test_cascade(id,addr)
	values('gong','������ ���ﵿ');

--on delete cascade�� �����Ǹ� �θ��ڵ尡 �����Ǹ� �ڽķ��ڵ嵵 �Բ� �����ȴ�.
delete from table_primary where id='song';
delete from table_primary where id='gong';
--ondelete cascade�� ������ ���� ���̺��� �����ϴ� ��ũ��� �������� �ʴ´�.
delete from table_primary where id='kim';

select * from user_indexes;






-----------------------------------------------------------
select * from column_foreign;
select * from TABLE_PRIMARY ;--�θ����̺�
select * from TABLE_FOREIGN;
select * from TEST_CASCADE;
select * from user_constraints;
-----------------------------------------------------------


