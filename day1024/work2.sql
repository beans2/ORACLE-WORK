--1. ��� ���̺��� '10' �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
--��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from emp
where deptno !=10 and sal between 1000 and 3000;

--2. ��� ���̺��� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
--����,���ʽ�, �Ѽ��ɾ�, ������ ��ȸ �ϼ���.
-- ������ ������ 12������ ���� ����� ��.
select EMPNO, ENAME, SAL, COMM, SAL/12 MONTHSAL, COMM+SAL TOTALSAL
from emp
where COMM IS NOT NULL;

--3.  ��� ���̺��� �μ���ȣ�� 10,30��  ������� �����, �����ȣ
--�Ի���, ������ ��ȸ �ϼ���.
--��, �����  xxxx�� xxxx����� xxxx�⿡ �Ի��Ͽ��� ������ xxx$�Դϴ�.
--�� �������� �ϰ�, �÷����� output ���� �����Ұ�.
select ENAME||'�� '|| EMPNO||'����� '|| HIREDATE||'�⿡ �Ի��Ͽ��� '||'������ '|| SAL|| '�Դϴ�' output
from emp
where deptno in(10,30);

--4. ��� ���̺��� ������ 3000 �̸��� ������� �����ȣ, �����,
--�Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
--��, ������ ������������ �����ϵ� ������ ���ٸ� ������� ������������
--�����Ұ�.
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from emp
where sal<3000
order by sal,ename desc ;

--5. test_like ���̺� �Ʒ��� ���� �����͸� �߰��Ұ�.
    --7, ����������,����� ���۱� �󵵵�,'�����'
    --8, ���븸,����� ���빮�� ���빮1��,'��Ÿ��'
    --9, ���¼�,����� ���빮�� ���빮2��,'�����'
insert into test_like( num, name, loc, highschool)
values(7,'��������','����� ���۱� �󵵵�', '�����');

insert into test_like( num, name, loc, highschool)
values(8,'���븸','����� ���빮�� ���빮1��', '��Ÿ��');

insert into test_like( num, name, loc, highschool)
values(9,'���¼�','����� ���빮�� ���빮2��', '�����');

delete from test_like
where num = 7;
commit;
select * from TEST_LIKE;

--6. test_like ���̺��� '�����'�� �����ϴ� �л���  ��ȣ,�л���,
   -- �ּ�, �б������� �Ʒ���  ���� �������� ����ϰ�
   --  �÷����� ��ҹ��� �����Ͽ� Output����  �Ұ�.
   -- ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx
select '�������'||' ��ȣ: '||NUM||' �̸�: '|| NAME||' �ּ�: '|| LOC||' �б�: '|| HIGHSCHOOL
from test_like
where loc like '%�����%';

--7. ������̺��� ������� 4�����̰ų� ������ 3000�̻��� �����
  -- �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ�Ұ�.
  -- ��, ��� �����ʹ� ������ ������������ �����ϰ�, ������ ���ٸ�
   --  ������� ���� �������� �����Ұ�.
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where   ename like '____' or sal>=3000
order by sal, ename desc;

--8.  test_like ���̺��� ����б����� ����ϰ� �б����� ����
   -- �������� �����Ͽ� ����� ��.
   -- ��, ����б� ���� ���ٸ� �ϳ��� ����ϼ���.(2������ �� ��.)
select distinct HIGHSCHOOL
from test_like
order by highschool;

--9. ��� ���̺��� �����ȣ, �����, �Ի���, ����, ���⿬����
  --  ��ȸ �ϼ���.
  --  ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����Ұ�.
select EMPNO, ENAME, HIREDATE, SAL , SAL+(SAL*0.07) NEXTYEARSAL
from emp;

--10. ��� ���̺��� ������� 5�����̸鼭 ����° ���ڿ� 'A'�� ���
  --  �� ����� �����, �����ȣ, �Ի���, ������ ��ȸ�ϼ���.
  --  ��, ������ ������������ ����Ұ�.
select ENAME, EMPNO, HIREDATE, SAL
from emp
where ename like '_____' and ename like '__A%'
order by sal;

--11. ��� ���̺��� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
     --����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �Ұ�.
select ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600;

