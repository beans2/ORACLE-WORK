--���ڿ� ������ like�ּ� ����� ���̺�
create table test_like(
   num number,
   name varchar2(30),
   loc varchar2(300),
   highschool varchar2(60)
);

insert into test_like(num,name,loc,highschool)
values(1,'������','����� ������ ���ﵿ','������');

insert into test_like(num,name,loc,highschool)
values(2,'������','����� ���α� ������','������');

insert into test_like(num,name,loc,highschool)
values(3,'�ڿ���','��⵵ ������ ���뱸','���հ�');

insert into test_like(num,name,loc,highschool)
values(4,'����ö','����� ������ ���ʱ� ���ʵ�','�԰�');

insert into test_like(num,name,loc,highschool)
values(5,'��������','���� ��絿','�ð�');

insert into test_like(num,name,loc,highschool)
values(6,'������','��⵵ ������ ������','������');

select * from test_like;
commit;

--like ������ %,_  ��ȣ�� ���� ���
--%�� ��� ���ڿ�, _�� �� ����

--test_like ���̺��� '����� '�� ��� ����� ��ȣ, �̸�, ��Ű���б����� ��ȸ
select NUM, NAME, HIGHSCHOOL
from test_like
where loc like '�����%';

--�̸��� '��'���� ������ �л��� ��ȣ, �̸�, �ּҸ� ��ȸ
select    num, name, loc
from   test_like
where  name like '%��';

--�̸��� '��'�� ���ԵǾ� �ִ� �л��� ��ȣ, �̸� ,�ּ�, ����б��� �� ��ȸ�ϼ���.
select NUM, NAME, LOC, HIGHSCHOOL
from  test_like
where name like '%��%';

--�̸��� 3�����̸� ��� ���ڰ� '��'�� ����� ��ȣ,�̸��� ��ȸ
select NUM, NAME
from test_like
where name like '_��_';

--�̸��� 4������ �л��� ��ȣ, �̸�, ����б����� ��ȸ�ϼ����
select NUM, NAME, HIGHSCHOOL
from  test_like
where name like '____';

--�����ּҸ� �����ϴ� ���̺�
create table zipcode(
	zipcode char(7),
 	sido char(6),
 	gugun varchar2(25),
 	dong varchar2(100),
 	bunji varchar2(25),
 	seq number(5)
);

alter table zipcode modify dong varchar2(100);

truncate table zipcode;

select count(*)
from zipcode;

select*
from zipcode;

--�츮���� ���� �ּҸ� ��ȸ
--���̸�)
select  zipcode, sido, gugun,dong,bunji,seq
from  zipcode
where  dong like '����7��%';

--������̺��� ����� 'L'�� 2�� ����ִ� �����
--�����ȣ, �����, �Ի��� ��ȸ

select  empno, ename, hiredate
from emp
where ename like '%A%A%';

--�ߺ�����
-- ������̺��� �Ŵ�����ȣ�� ��ȸ. ��, �ߺ��Ǵ� �Ŵ�����ȣ�� ������� �ʴ´�.
--distinct: �����Լ��� ����Ͽ� �׷캰 ���踦 ������ �� ����.
-- �ٸ� ���� ������ �÷��� ���� ����� ���, ��� �÷��� ���� �����ؾ� �ߺ� ������ �ȴ�.
select distinct mgr /*,ename*/
from emp;
--group by : �׷����� �������� ���� �÷��� ���� ���Ǹ� error
select mgr /*ename*/
from emp
group by mgr;
























