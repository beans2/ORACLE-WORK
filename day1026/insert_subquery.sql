--insert ��������

--�ܼ���
--cp_emp3�� �Ʒ��� ���� ���ڵ带 �߰�
--�����ȣ: 1111, �����: ����ö, �μ���ȣ: 10, ����: ���, ����: emp���̺��� �����ȣ�� 7566�� ����� ������ ����
--�������� �߰�
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111,'����ö',10,'���',(select sal from emp where empno = 7566));

select * from CP_EMP3;


--������ ���������� �����ϴ� ������ �������� ���Ǹ� error
--�������� ������ ���
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111,'����ö',10,'���',(select sal from emp));
--�÷� �ϳ��� ���� �־�� �ϴ� ���� �÷� �������� ��ȸ�Ǹ� ����
insert into cp_emp3(empno, ename, deptno, job, sal) values(1111,'����ö',10,'���',(select sal,deptno from emp where empno = 7566));
select * from CP_EMP3;


--������(������) ��������
--emp���̺��� �μ���ȣ�� 30���� �μ��� �����ȣ,�����, �μ���ȣ, ����, ������ ��ȸ�Ͽ�  cp_emp3���̺�  �߰�
insert into cp_emp3 (select EMPNO, ENAME, DEPTNO, JOB, SAL from emp where deptno=30);
select * from CP_EMP3;

create table test(job varchar2(9),sal number(7,2), hiredate date);
alter table test add input_date date;
alter table test modify hiredate varchar2(7);
--������̺��� 1981-02�� �Ի��� ����� ����, ������, �Ի��-��, �Է����� test ���̺� �߰�
insert into test (
select JOB, sum(SAL), to_char(hiredate,'yyyy-mm'),sysdate
from emp
--where to_char(hiredate,'yyyy-mm') = '1981-02'
group by job, hiredate having to_char(hiredate,'yyyy-mm') = '1981-02'  --1981-02�� �Ի��� ��� ���� ��
) ;
select * from TEST; 
















