-- update subquery: �ٸ� ���̺��� ���� �����Ͽ� ���� ���̺��� ���� ������ ��

--�ܼ���
--cp_emp3���̺��� �����ȣ�� '1111'�� ����� ������ emp���̺��� �����ȣ�� '7788'�� ����� ��������
--����
update cp_emp3
set sal =
(select sal from emp where empno=7788)
where empno = 1111;
select * from CP_EMP3;

--�ܼ��� ���������� �������� �߻��ϸ� error�߻�
update cp_emp3
set sal =
(select sal from emp)
where empno = 1111;

-- �÷� ������ ��ȸ�� error
update cp_emp3
set sal =
(select sal,deptno from emp where empno =7788)
where empno = 1111;

--������ ���������� in�� ����Ͽ� where ���� ���
insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222,'�׽�Ʈ',30,'SALESMAN',2000);
commit;
--cp_emp3���̺��� emp���̺��� �μ� ��ȣ�� 30���� ��� ������� �����ȣ�� ���� �����
--������ 1000���� �����Ͻÿ�.
update cp_emp3
set sal=1000
where empno in(select empno from emp where deptno=30);


-----------------------------------
--delete subquery
-----------------------------------
--�ٸ� ���̺��� ���� �����Ͽ� ���� ���̺��� ���ڵ带 ����
--�ܼ���
update cp_emp3
set    ename = '���ī'
where  empno = 7698;

commit;


select * from CP_EMP3;

--cp_emp���̺��� ��������� ����
--��������: emp ���̺��� ������� 'BLAKE'�� ����� �����ȣ��
--���� ����� cp_emp3���̺��� ����
delete from cp_emp3
where empno =
(select empno from emp where ename = 'BLAKE');

--������: cp_emp3���̺��� emp���̺��� �μ� ��ȣ�� 30���� ��� ������� �����ȣ�� ���� ����� ����
delete from cp_emp3
where empno in
(select empno from emp where deptno=30);







