--�����Լ�
select sin(25),cos(25),tan(25) from dual;

--���밪 :abs(��)
select abs(25), abs(-25) from dual;

--�ݿø�: round(��, �ڸ���)
select round(777.777,2),round(777.777,-1) from dual;

--����:trunc(��, �ڸ���)
select trunc(777.777,2),trunc(777.777,-1) from dual;

--�ø�: ceil(��)
select ceil(777.7) from dual;

--����: floor(��)
select floor(777.7) from dual;

--������̺��� �����ȣ, �����, �Ի���,����, ������ ��ȸ�ϼ���.
--��, ������ ������ 3.3%�� ����ϰ� �ʴ��������Ͽ� ����غ�����.
select EMPNO, ENAME, HIREDATE, JOB, sal*0.033,trunc(sal*0.033,0) tax
from emp;

