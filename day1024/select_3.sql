--����
-- ������̺��� �����ȣ �����, ������ �Ի����� ��ȸ
--��, ������ ������������ �����Ͽ� ����� ��.  ������ ���ٸ� �Ի����� ������������ �����Ͽ� ����� ��.
select EMPNO,ENAME, SAL, HIREDATE
from   emp
order by sal, hiredate desc;

--����׾ƺ��� ������� �Ŵ�����ȣ, �����ȣ, �����, ������ ��ȸ�ϼ���
--��, �Ŵ�����ȣ�� ������������ �����ϵ�, �Ŵ�����ȣ�� ���ٸ� ������� ������������ �����ϼ���.
select MGR, EMPNO, ENAME, SAL
from emp
order by mgr desc, ename;

create table test_orderby(
	num varchar2(10)
);

insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
insert into test_orderby(num) values('204');
insert into test_orderby(num) values('21');
insert into test_orderby(num) values('191');
insert into test_orderby(num) values('300');
insert into test_orderby(num) values('20001');      

commit;

--��ȣ ������������ ����
select num
from test_orderby
order by num;  


