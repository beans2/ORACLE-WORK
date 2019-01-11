/*  1. ������̺����� �����ȣ, �����,����, �Ŵ�����ȣ,����,
   �Ի����� ��ȸ�ϼ���.
 ��, ������ ������������ �����ϵ�, ������ ���ٸ� �����ȣ��
    ������������ �����ϼ���.
    �Ի����� ��-��-���� �������� ����ϼ���.
    ������ 3�ڸ����� ,�� �־� ����ϼ���.
    */
select EMPNO, ENAME, JOB, MGR, to_char(SAL,'9,999,999'), to_char(HIREDATE,'mm-dd-yyyy')
from emp
order by sal, empno desc;

/*
 2. ������̺����� 3,4�б⿡ �Ի��� �������  �μ��� ������,
    �������, �ְ�����, ��������, ������� ��ȸ�Ͽ� �Ʒ��� ���� ����ϼ���.
    ��¿� )  10���μ� ������� [x]��, ������� : [xx],
	   �ְ����� [xx], ��������[xx]
*/
select deptno||'���μ� �������'||'['||count(*)||'] ��,'||'������� : ['
||trunc(avg(sal),0)||'], �ְ����� ['|| max(sal)||'], ��������['||min(sal)||']' OUTPUT
from emp
where to_char(hiredate, 'q') in('3','4')
group by deptno
order by deptno;

/*
3. TEST_ORDERBY���̺����� ��ȣ�� ����ϼ���.
   ��, ��µǴ� ��ȣ��  S_0000000001 ��������
   10�ڸ��� ���ڰ� �Ǿ���ϸ�, 10�ڸ��� ���� �ʴ� ���ڴ�
  �տ� 0�� �ٿ� 10�ڸ��� ����� 'S_' �� �ٿ� ����Ѵ�.
*/

select   lpad(lpad(num,10,'0'),12,'S_')
from test_orderby;

/*4. ������̺����� �μ���ȣ, �μ���, ����,���ʽ�,�Ѽ��ɾ�,
 �Ի����� ��ȸ�ϼ���.
   ��. �Ѽ��ɾ��� '����+����+���ʽ�'�� �ջ��� �ݾ�����
   ��ȸ�ϼ���.  ������ ������ 12�� ���� ���� ������ �����Ͽ�
   ����ϼ���.
*/

select EMPNO, ENAME, SAL, COMM, sal+ trunc(sal/12,0)+comm SUMSAL, HIREDATE
from emp;


/*
5. ��� ���̺����� �μ���ȣ,�μ���,����, ���ʽ�, �μ�Ƽ�긦
   ��ȸ�ϼ���.
   �μ�Ƽ���  �Ʒ�ǥ�� ���� �μ����� ���� �����մϴ�.
   10- ���޿� 100%, 20- ���޿� 150%, 30 - ���޿� 300%
   �׿� ���޿� 50%
*/

select EMPNO, EMPNO, ENAME, SAL, COMM ,decode(deptno,10,sal+sal,20,sal+1.5*sal,30,3*sal,0.5*sal) INCENTIVE
from emp;

/*
 6. class4_info ���̺��� �Ʒ��� ���� �����͸� �߰��մϴ�.
   ��ȣ - 10, �̸� - Ȳ�缺, �ֹι�ȣ - 030101-3234567
   ��ȣ - 12, �̸� - �ż���, �ֹι�ȣ - 011201-4234567
   ��ȣ - 13, �̸� - �ڳ���, �ֹι�ȣ - 880101-2234567
   ��ȣ - 14, �̸� - ��ſ�, �ֹι�ȣ - 880101-2234567
*/
select * from CLASS4_INFO ;
insert into class4_info(num,name,ssn)
values(10,'Ȳ�缺','030101-3234567');
insert into class4_info(num,name,ssn)
values(12,'�ż���','011201-4234567');
insert into class4_info(num,name,ssn)
values(13,'�ڳ���','880101-2234567');
insert into class4_info(num,name,ssn)
values(14,'��ſ�','880101-2234567');

alter table class4_info modify(SSN char(14));
commit;
select * from CLASS4_INFO ;



/*
7. class4_info ���̺����� ��ȣ, �̸� , �ֹι�ȣ,
   ������ ��ȸ �ϼ���.
   ������ �ֹι�ȣ��   8��° �ڸ��� ���Ѵ�.
   8��° �ڸ��� 1,3�̸� ����, 2,4�� ���� �׷��� ������ "����"
   ������Ѵ�.
*/

select  NUM, NAME, SSN, decode(substr(ssn,8,1),1,'����',3,'����',2,'����',4,'����')
from class4_info;

