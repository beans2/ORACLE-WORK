--���� ���ϱ�
--��ü ���� ���ϱ�
--rank() over(order by �÷��� ���Ĺ��) - �ߺ������� �߻��� �� �ִ�.
--������̺��� �����ȣ, �����, ����, �������� ��ȸ
select * from EMP;

select EMPNO, ENAME, SAL ,rank() over(order by sal)
from emp;

--������̺��� �����ȣ, �����, ����, �������� ��ȸ
--��, �ߺ������� �߻����� �ʵ��� ó���Ͽ� ��ȸ �� ��.
select EMPNO, ENAME, SAL ,row_number() over(order by sal)
from emp;

--��ȸ�� ���ڵ带 �׷캰 ����: partition by
--������̺��� �����ȣ, �����, ������, �μ����������� ��ȸ
select EMPNO, ENAME, SAL ,
deptno,rank() over(partition by deptno order by sal)
from emp;

select EMPNO, ENAME, SAL ,
deptno,row_number() over(partition by deptno order by sal)
from emp;

---------------------------
----rollup, cube
---------------------------
--rollup: �׷캰 �Ұ踦 ���� �� ���


--������̺���  �μ��� ,������ ���� ��ȸ�ϰ� �Ѱ踦 ���

select  deptno,sum(sal)
from    emp
group by   rollup(deptno);

select  deptno,sum(sal)
from    emp
group by   cube(deptno);

--������̺��� �μ��� ������ ������,�Ұ� ��ȸ


select deptno,job,sum(sal)
from emp
group by rollup(deptno,job)
order by deptno;

--������̺��� �μ���, ������ ������, ������ �Ұ�, �Ѱ�, ��ȸ�Ǵ� ���ڵ��� �Ұ���ȸ
select deptno,job,sum(sal)
from emp
group by cube(deptno,job)
order by deptno;


select *
from user_constraints;

desc dept;
