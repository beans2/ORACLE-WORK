--outer join :��� ���� ���̺��� ���ڵ尡 �����ϴ��� ��ȸ
--��� �μ��� �μ���ȣ, �μ���,�����ȣ, �����, �Ի����� ��ȸ
--ANSI )left�� right�� ����� �� ���ڵ尡 �ִ� �� ���̺� ����
--���ڵ��� ������ �� �𸥴ٸ� fuu outer join�� �Ͽ� ó���Ѵ�.
select d.deptno,e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  emp e
left /*outer*/ join dept d
on  e.deptno = d.deptno;
-- ==>emp���� �μ���ȣ�� 10,20,30 ���ְ�,  dept���� �μ���ȣ�� 10,20,30,40 �� �����Ƿ� 40�� ��µǵ��� dept�� �ִ�==> dept left join

-------------------------------------------------------------------------------------------
--oracle ) �������ǿ� ���ڵ尡 ���� �ʿ� (+)�� ���δ�.
select d.deptno,e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  emp e, dept d
where (e.deptno(+) = d.deptno);

select * from DEPT;
select * from EMP;
--�����簡 '����','���'�� ��� ������ ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ
select cc.country, cc.maker, cma.model, cmo.price, cmo.car_option
from car_country cc, car_maker cma, car_model cmo
where (cma.maker = cc.maker and cmo.model(+) = cma.model)
and 	cma.maker in('����','���');

select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

--�𵨸��� 'k5','K7','�ҳ�Ÿ','Ccalss','A6' �� ��� ������
--������, ������,�𵨸�, ����, ������ ��ȸ�Ͻÿ�
--��, ������ ������������ �����Ͽ� ��ȸ�� ��, ������ ���ٸ�
--������ ������������ ������ ��.

--ANSI)
select cc.country,cma.model, cma.model, cmo.price
from car_country cc
left join car_maker cma
on  cma.maker = cc.maker
left join car_model cmo
on cmo.model = cma.model
where cma.model in('K5','K7','�ҳ�Ÿ','Cclass','A6')
order by cmo.price desc;

----------------------------------------------------------------------
--oracle
select cc.country,cma.model, cma.model, cmo.price
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model= cmo.model(+))
and cma.model in('K5','K7','�ҳ�Ÿ','Cclass','A6')
order by cmo.price desc;

--������̺��� ������� 'scott'�� ������� ������ �۰� �޴� �����
--�����ȣ, �����, �Ի���, ������ ��ȸ
select empno, ename, hiredate
from emp
where sal<=(select sal from emp where ename = 'SCOTT' ) ;
select * from EMP;
-------------------------------------------------------------------


-------------------------------------------------------------






