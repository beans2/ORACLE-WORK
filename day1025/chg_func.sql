--��ȯ�Լ�
--���ڿ��� �ƴ� ��(����, ��¥)�� ���ڿ��� ��ȯ
--���� -> ������ �ڸ��� �޸�(,)�� ��(.)�� ���

select to_char(20181025,'0,000,000,000'),
to_char(20181025,'9,999,999,999')
from dual;


select to_char(2018.1025,'9999,999.999') from dual;

--������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ
--��, ������ �����Ͱ� �ִ� �ͱ����� �޸�(,)�� �־� ���
select EMPNO, ENAME, HIREDATE, to_char(SAL,'999,999,999') from emp;

--to_char�� ��ȯ�� ���� ���ڿ��̹Ƿ� ���⿡ ���ڸ� ���ϴϱ� ������ �ȵǼ� ERROR����.
select to_char(sal,'9,999')+100 from emp;


--��¥�� ���ڿ��� ��ȯ
select to_char(sysdate,'yyyy-mm-dd am hh12:mi:ss day dy q') from dual;

--pattern�� Ư�����ڰ� �ƴ� ���ڿ� ��� "�� ���´�
select to_char(sysdate,'yyyy"��"mm"��"dd"��"')  from dual;

--pattern�� ��� ����ϸ� Error
select concat (to_char(sysdate,'yyyy "��" mm " ��" dd " �� " hh24 " �� " mi " �� " ss "�� " ') from dual;

--������̺��� �����ȣ, �����, �Ի����� ��ȸ
--��, �Ի����� '��-��-�� ����'�� �������� ���
select  empno, ename, hiredate, to_char(hiredate,'yyyy-mm-dd day hh:mi:ss')
from   emp;

--������̺��� �Ի�⵵�� '1981'���� �������
--�����ȣ, �����, �Ի���, ������ ��ȸ�ϼ���.
select EMPNO, ENAME, HIREDATE, SAL
from emp
where to_char(hiredate,'yyyy') = '1981';

select * from CLASS4_INFO ;

--���糯¥�� �ƴ� ��¥�� �߰��� ��
--��¥ ������ ���ڿ��� �߰��ϸ� �ȴ�.
insert into class4_info(num,name,input_date)
values(8,'�缼��',to_date('2018-10-21','yyyy-mm-dd'));
insert into class4_info(num,name,input_date)
values(9,'�缼��',to_date('2018-10-22','yyyy-mm-dd'));

select to_char(input_date,'yyyy-mm')
from class4_info;

--to char�� ��¥�� ���ڸ� �Է¹޾ƾ��Ѵ�. (�Լ��� ��(����)��
--���������� �����Ѵ�.)
select to_char(to_date('2018-10-25'),'mm')
from dual;


--���ں�ȯ : to_number('���������� ���ڿ�')
select '25'-'10', to_number('25')-to_number('10')
from dual;

---------------------------------------------------------------------------------------------------
--�����Լ� : decode(��, �񱳰�, ��°�, �񱳰�, ��°�,,,, �񱳰��� ���� �� ��°�)
---------------------------------------------------------------------------------------------------

--������̺��� �����ȣ, �����, ����, �μ��� ��ȸ
--��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
-- 10-���ߺ�, 20-���������� , 30- ǰ�������� �� �ܴ� Ź���η� ���

select EMPNO, ENAME, SAL, decode(DEPTNO,10,'���ߺ�',20,'����������','Ź����')  DNAME
from emp;

--�����ȣ, �����, ���ʽ�, �μ�Ƽ�� ��ȸ
--�μ�Ƽ��� �μ����� �Ʒ��� ǥ�Ͱ��� ���������մϴ�
--10-����20%, 20- ����50%��, 30- ����30% �� �� ���� 10%�� ����Ͽ� ���

select EMPNO, ENAME, COMM, DEPTNO,sal, decode(deptno,10,sal*0.2,20,sal*0.5,30,sal*0.3,sal*0.1)  incentive
from emp;

--case
--������̺��� �����ȣ, �����, ����, �μ��� ��ȸ
--��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
-- 10-���ߺ�, 20-���������� , 30- ǰ�������� �� �ܴ� Ź���η� ���
select EMPNO, ENAME, SAL, DEPTNO,
case deptno when 10 then '���ߺ�'
when 20 then '����������'
when 30 then 'ǰ��������'
else 'Ź����'
end
OUTPUT
from emp;
--case
--�����ȣ, �����, ���ʽ�, �Ѽ��ɾ� ��ȸ
--�Ѽ��ɾ��� ����+ ���ʽ� + �μ����� �����ȴ�.
--�μ�Ƽ��� �μ����� �Ʒ��� ǥ�Ͱ��� ���������մϴ�
--10-����20%, 20- ����50%��, 30- ����30% �� �� ���� 10%�� ����Ͽ� ���

select EMPNO, ENAME, COMM,
case deptno when 10 then sal+ nvl(comm,0)+sal*0.2
when 20 then sal+ nvl(comm,0)+sal*0.5
when 30 then sal+ nvl(comm,0)+sal*0.3
else sal+nvl(comm,0)+sal*0.1
end
"Incentive"
from emp;

--������̺��� �����ȣ, �����, ������ ��ȸ
--��, ������ ù ���ڰ� 'C'-�ĸ���� ,'S'-��������ִ»��
--'M'- ������, 'A'- ���캸�� ���, 'P'- �θ��

select empno,ename,job,decode(substr(job,1,1),'C','�Ҹ�ǰ',
'S','�� ����� �ִ� ���',
'M','������',
'A','���캸�»��',
'�θ��')
from emp;

select decode(to_char(hiredate,'yyyy'),'1987','������','����')
from emp;


