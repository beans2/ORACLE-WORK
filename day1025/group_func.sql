--�����Լ� -�÷��� ���� �ϳ��� ����� ��ȯ�ϴ� �Լ���
-- count: null�� �ƴ� �÷��� ������ �� ��
--������̺� ���ڵ� ��(�����), ���ʽ��� �����ϴ� ��� ��,���ʽ��� �������� �ʴ� ����� ,�Ŵ����� �ִ� �����
select count(empno),count(comm), count(*)-count(comm),count(mgr)
from emp;

--���� ��, ���ʽ��� �� ,�ΰǺ��� ����
select sum(sal),sum(comm),sum(sal)+sum(comm)
from emp;

--���� ���   ,���ʽ� ���
select trunc(avg(sal),0), avg(comm)
from emp;

--�ְ� ������,���� ������, �� ���� ����
select max(sal),min(sal),max(sal)-min(sal)
from emp;
--where max(sal)=5000;


--**where ������ �����Լ��� ����� �� ����.
--������̺��� ��� �������� ���� �����ϴ� ����� �����ȣ,
--�����, ����, �Ի����� ��ȸ�ض�
select ENAME, EMPNO, SAL, HIREDATE
from emp
where sal> (select avg(sal) from emp);

--�����Լ��� group by�� �Բ� ����ϸ� �׷����踦 �� �� �ִ�.
--�μ���ȣ, �μ��� �ο��� , �μ��� ������ �� , �������, �ְ�����, ����������
select count(deptno), sum(sal),trunc(avg(sal),2),max(sal),min(sal)
from  emp
group by deptno
order by deptno;

--������̺��� �Ŵ����� �����ο���, �ְ����� ��������, �ְ� ������ ���������� ����

select count(mgr), max(sal), min(sal), max(sal)-min(sal)
from emp
where mgr is not null
group by mgr;

select * from EMP;

--------- ��¥�Լ�
---��¥�� +�� ����ϸ� ���� ���Ѵ�.
select sysdate+100 from dual;

select add_months(sysdate,7)
from dual;


select months_between('2018-11-25', sysdate)from dual;



