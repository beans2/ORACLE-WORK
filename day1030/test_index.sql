--�ε�����ȸ
select * from user_indexes;


create table cp_zipcode as(select * from zipcode);

select count(*)from cp_zipcode;
select count(*)from zipcode;;

--cp_zipcode���̺��� seq�÷��� unique index����
create unique index idx_zipcode on cp_zipcode(seq);
drop index idx_zipcode;

select*from user_indexes;


--�ε����� ������� �ʴ� ��ȸ
select zipcode, sido, gugun, bunji, seq
from zipcode
where seq=49000;

--�ε����� ����� ��ȸ
select /*+ordered index(idx_zipcode)*/zipcode, sido, gugun, bunji, seq
from cp_zipcode
where seq=49000;

--�����ȣ�� �ߺ������� ��Ư�� ���¸� ������.
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;
--�ε����� ������� ���� ��ȸ
select zipcode,sido, gugun, bunji, seq
from zipcode
where zipcode='402-866';
--�ε����� ����� ��ȸ
select /*+ordered index(idx_zipcode)*/zipcode, sido, gugun, bunji, seq
from cp_zipcode
where zipcode='402-866';

select * from user_indexes;

--�ε����� ���� ���̺��� ����Ǹ� ��������� �������� �ʴ´�. ==> rebuild ������Ѵ�.
--���̺�� �ε����� �����ϰ� ���ߴ� ����
alter index idx_zipcode rebuild;


--group by having ��
--having �׷����� ���� ����
-- ������� 4�� �̻��� �μ��� �μ���ȣ, �����, ������, �ְ����� ��ȸ�ϼ���

select deptno, count(deptno), sum(sal),max(sal)
from emp
group by deptno having count(deptno)>=4;


--replace : ���� ġȯ
select replace('������ ����� �Դϴ�','������','������')
from dual;


select replace('���ü�, ������,������,����ö','������','��õ���� �ڶ�������')
from dual;


select * from user_objects;


drop table zipcode;
drop table cp_zipcode;
purge recyclebin ;

select * from ZIPCODE;

drop table zipcode;
drop table cp_zipcode;
drop table emp;

