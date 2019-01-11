--inner join ���δٸ� ���̺� ���� ���� �ִ� ��쿡�� ��ȸ

--�����ȣ, �����, �μ���ȣ(driving table�� ����), �μ���, ��ġ, ���� ��ȸ
--ANSI
select e.empno, e.ename, e.deptno,d.dname, d.loc, e.sal
from   emp e
inner join dept  d
on  	d.deptno= e.deptno;

select * from emp;
--���� �� oracle ����
select empno,ename,emp.deptno, dname, loc, sal
from emp, dept
where emp.deptno = dept.deptno;

--���� �� oracle ����2
select empno, ename,e.deptno, dname, loc, sal
from emp e, dept d
where e.deptno = d.deptno;


--oracle ����
select e.empno, e.ename, e.deptno,d.dname, d.loc, e.sal
from   emp e,dept d
where e.deptno =d.deptno;
----------------------------------------------------------------------------
--�ڵ������̺� �����̸Ӹ�, ����Ű �ֱ�
select * from CAR_COUNTRY; --     ����Ŀ,������
select * from CAR_MODEL;   --��,����, ����, ����, �ɼ�,�̹���, �԰���
select * from CAR_MAKER; --�� ,����Ŀ

--�������� pk�ֱ� ==> �ߺ�������x ==> maker��
select * from user_constraints;
alter table car_country add constraint pk_car_country primary key(maker);
--������ ���̺� fk���� ==> maker��
alter table car_maker add constraint fk_maker
foreign key(maker) references car_country(maker);
--������ ���̺� pk���� (�ߺ������� x) ==> model��
alter table car_maker add constraint pk_car_maker primary key(model);
--�����̺� fk���� ==> �ߺ������Ͱ� �ƴѰ� �����Ƿ� fk�� ����
alter table car_model add constraint fk_model
foreign key(model) references car_maker(model);


-- �𵨸��� '�ƹ���','�ҳ�Ÿ','A8'�� ������ ������, ������, �𵨸�, ����, ����, �̹����� ��ȸ
--������, ������ => car country
--������, �𵨸� => car maker
--�𵨸�, ����, ����, �̹��� == > car models

--ANSI
select    cc.country, cc.maker, cma.model ,cmo.car_year ,cmo.price ,cmo.car_img
from   car_country  cc
inner join car_maker  cma
on    cma.maker = cc.maker
inner join car_model cmo
on    cmo.model = cma.model
where cmo.model in('�ƹ���','�ҳ�Ÿ','A8');

--oracle
select cc.country, cc.maker, cma.model ,cmo.car_year ,cmo.price ,cmo.car_img
from car_country  cc, car_maker cma, car_model cmo
where (cma.maker=cc.maker and cmo.model= cma.model) and cmo.model in('�ƹ���','�ҳ�Ÿ','A8')  ;

select * from CAR_COUNTRY; --     maker, country
select * from CAR_MODEL;   --��,����, ����, ����, �ɼ�,�̹���, �԰���
select * from CAR_MAKER; --�� ,����Ŀ
------------------------------------------------------------------------------------------
--�����ȣ, �����, ����, �Ի���, �μ���ȣ, �μ���, //��ġ, �����ȣ, �õ�, ����, ��, ��, ������ ��ȸ�ϼ���.
--������̺��� �����ȣ�� �����ȣ ���̺��� seq�� ������������ ���

--ANSI
select  e.empno, e.ename, e.sal, e.hiredate, e.deptno,d.loc, e.deptno, z.zipcode, z.sido, z.GUGUN, z.dong, z.bunji
from  dept d
inner join emp e
on  e.deptno = d.deptno
inner join zipcode z
on  z.seq = e.deptno;

--oracle
select  e.empno, e.ename, e.sal, e.hiredate, e.deptno,d.loc, e.deptno, z.zipcode, z.sido, z.GUGUN, z.dong, z.bunji
from  dept d, emp e, zipcode z
where (e.deptno = d.deptno and z.seq = e.deptno);

------------------------------------------------------------------------------------------
                                                                           






------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------












