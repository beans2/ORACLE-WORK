--���̺� ����
--������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ�Ͽ� ��ȸ�� ����� CP_EMP��� ���̺��� ������ ��.

create table CP_EMP as(select EMPNO, ENAME, hiredate, SAL from emp);

select * from CP_EMP ;

alter table cp_emp modify SAL, DEPTNO, SAL number(7,2) not null;
 select * from user_constraints;

-- cp_emp ���̺��� �����ȣ�� 7500~7599 ���̿� ���� ����� �����ȣ , �����, �Ի���, ������ ��ȸ�Ͽ�
--cp_emp2���̺��� �����ϰ� �Է��ϼ���.

create table cp_emp2 as (select * from cp_emp where empno between 7500 and 7599);
select * from CP_EMP2;

--������ ����(���ڵ带 ��ȸ���� �ʰ� ���������� ����)
--������̺��� �����ȣ, �����, �μ���ȣ, �μ���, ������ ���ڵ尡 ��ȸ���� �ʵ��� ��ȸ

create table cp_emp3 as (select EMPNO, ENAME, DEPTNO, JOB, SAL from emp where 1=0);

select * from CP_EMP3  ;

