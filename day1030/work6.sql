/*1. ��ⷮ�� 1500~3000 ������ ������ ������,������,�𵨸�,���,����,
    �̹���,�Է���,��ⷮ, �ɼ��� ��ȸ
   ��. ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�,
     �ɼ��� ó�� ',' ������ ��� �Ұ�. ���ݰ� ������ 3�ڸ����� ,�� �־����,
     �Է����� ��-��-�� �� �������� ��� �Ұ�.
*/
select  r, country, maker, model, to_char(car_year,'9,999') car_year, to_char(price,'9,999') price,
	   car_img, to_char(hiredate,'mm-dd-yyyy') price,cc,substr(car_option,1,instr(car_option,',')) car_option
from (
	select rownum r, country, maker, model, car_year, price, car_img, hiredate,cc, car_option
	from (
		select cc.country, cma.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img, cmo.hiredate, cmo.cc, cmo.car_option
		from car_country cc, car_maker cma, car_model cmo
		where (cc.maker = cma.maker and cma.model = cmo.model) and (cmo.cc between 1500 and 3000)
		order by cmo.cc desc
		)
	 )
where r between 3 and 6;

---




select r, country, maker, model, to_char(car_year,'9,999,999') car_year, to_char(price,'9,999,999')
car_img, to_char(hiredate,'mm-dd-yyyy') hiredate, cc,substr(car_option,instr(car_option,'_')+1) car_option
from (select rownum r,country, maker, model, car_year, price, car_img, hiredate, cc, car_option
	 from (select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img, cmo.hiredate, cmo.cc,cmo.car_option
		  from car_country cc, car_maker cma, car_model cmo
		  where (cc.maker = cma.maker and cma.model = cmo.model) and cmo.cc between 1500 and 3000
		  order by cmo.cc desc
		  )

	)
where r between 3 and 6;

------

select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate


-------------------------------------------------------------------------------------------
/*2. �μ���ȣ�� 10�� 30,40���� ��� �μ���
�����ȣ,�����, �Ի���,����,��������,�μ���, �μ���ȣ, ��ġ, �����ȣ, �õ�, ����, ��, ������ ��ȸ.
��, ����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
�����ȣ�� '-'�ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü�Ͽ� ���,
�Ի����� ��-��-�� ���ϱ��� ���.
*/
select rank() over(order by sal) salrank,r,ename, to_char(hiredate,'dd-mm-yyyy day'), sal, loc, substr(zipcode,instr(zipcode,'-')+1), sido, gugun, dong, decode(bunji,'','��������',bunji)
from(select rownum r,ename, hiredate, sal, loc, zipcode, sido, gugun, dong, bunji
	from (select e.ename, e.hiredate, e.sal,d.loc,
  		 zipcode, z.sido, z.gugun, z.dong, bunji
		from emp e, dept d, zipcode z
		where (e.deptno = d.deptno and d.deptno = z.seq)
		order by d.deptno
		)
	)
where r between 2 and 5;

-----------------
/*2. �μ���ȣ�� 10�� 30,40���� ��� �μ���
�����ȣ,�����, �Ի���,����,��������,�μ���, �μ���ȣ, ��ġ, �����ȣ, �õ�, ����, ��, ������ ��ȸ.
��, ����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
�����ȣ�� '-'�ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü�Ͽ� ���,
�Ի����� ��-��-�� ���ϱ��� ���.
*/
select r,empno, ename, to_char(hiredate,'mm-dd-yyyy'), sal, salrank, dname, deptno, loc, zipcode , sido, gugun, dong, decode(bunji,'','��������',bunji) bunji
from (
	select rownum r, empno, ename, hiredate, sal, salrank, dname, deptno, loc, substr(zipcode,instr(zipcode,'-')+1)zipcode , sido, gugun, dong, bunji
	from (
		select e.empno,e.ename,e.hiredate, e.sal, rank() over(order by sal) salrank, d.dname, d.deptno,d.loc,z.zipcode, z.sido, z.gugun, z.dong, z.bunji
		from emp e, dept d, zipcode z
		where (e.deptno(+) = d.deptno and d.deptno = z.seq) and d.deptno in(10,30,40)
		order by d.deptno
    	 	)
  	)
where r between 2 and 5;


select * from EMP; -- empno, ename, job, mgr, hiredate, sal, comm, deptno
select * from DEPT;-- deptno, dname, loc
select * from ZIPCODE; -- zipcode , sido, gugun, dong, bunji, seq
-------------------------------------------------------------------------------------------
/*
3. ������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰� �ɼǿ� 'ABS','TCS'��
 �ִ� ������ // ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ
  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ ����
   �Ͽ� ���,
   �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
   ��������� ������ Bmw, Audi �� �������� ��� .
*/
select cc.country, initcap(cc.maker), cma.model, cmo.car_year, cmo.price, cmo.car_option,
substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) imgname,
substr(cmo.car_img,instr(cmo.car_img,'.')+1) imghwak, cmo.cc
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model) and cc.maker in('����','���','�Ｚ','BMW','AUDI')
and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
order by cmo.car_year desc, cmo.price desc;

--
select country, initcap(maker), model, car_year, price, car_option, substr(car_img,1,instr(car_img,'.')-1) imgname,
	  substr(car_img,instr(car_img,'.')+1) hwackname, cc
from(
	select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
	from car_country cc, car_maker cma, car_model cmo
	where (cc.maker = cma.maker and cma.model = cmo.model)
	and (cc.maker in('����','���','�Ｚ','BMW','AUDI'))
	and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
	order by cmo.car_year desc, cmo.price desc
	);



/*select country, maker, model, car_year, price, car_option, car_img, cc
from( select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
	 from car_country cc, car_maker cma, car_model cmo
	 where (cc.maker = cma.maker and cma.model = cmo.model)
	 order by cmo.car_year desc, cmo.price desc
	)
where maker in('����','���','�Ｚ','BMW','AUDI') and car_option like '%ABS%' or car_option like '%TCS%';

--
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model)
order by cmo.car_year desc, cmo.price desc;
*/

select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate

------------------------------------------------------------------------------------------
update car_model
set car_img='qm5_001.jpg'
where car_img='qm5_001.jpg,qm5_002.jpg';

update car_model
set car_img='qm5_003.jpg'
where car_img='qm5_003.jpg,qm5_004.jpg';

update car_model
set car_img='qm5_005.jpg'
where car_img='qm5_005.jpg,qm5_006.jpg';

commit;

--------------------------------------------------------------------
/*4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
  ������,����,������ �Ʒ��� ���� ������ �������� ���.
  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.

*/
select '['||cma.model||'] ������ ������ ['  ||cmo.car_year||  ']�̰�, �������� ['  ||cc.country||
']�̸�,['  ||cc.maker||  ']�簡 �������Դϴ�. ������ ['  ||to_char(rpad(cmo.price,8,'0'),'99,999,999')||  ']�� �Դϴ�.'
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model)
and cma.model in('K5','�ƹ���','�ҷ���','A8','SM3')
order by cmo.price;




/*4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
  ������,����,������ �Ʒ��� ���� ������ �������� ���.
  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.

*/




-----------------------------------
select r,'['||model||']�� ������ ������ ['||car_year||']�̰�, �������� ['||country||']�̸�,['||maker||']�簡 �������Դϴ�. ������ ['
||to_char(rpad(price,8,0),'99,999,999')||']�� �Դϴ�.'
from(
	select rownum r,model, country, maker, price, car_year
	from(
 		select cma.model, cc.country, cma.maker, cmo.price, cmo.car_year
 		from  car_country cc, car_maker cma, car_model cmo
		where (cc.maker = cma.maker and cma.model = cmo.model)
		and cma.model in('K5','�ƹ���','�ҷ���','A8','SM3')
  		order by cmo.price
   	  )
   	)
where r between 2 and 7;


select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate----------------------------------------------------------------------

--------------------------------------------------------------------
/*
5. �����簡 '����'�� ������ ���, �𵨸�, ���ĺ� �Ѱ����� ��ȸ .
*/
select cmo.car_year, cmo.model, sum(cmo.price)
from car_country cc, car_maker cma, car_model cmo
where (cc.maker = cma.maker and cma.model = cmo.model)
and cc.maker in('����')
group by rollup(cmo.model,cmo.car_year)
order by cmo.car_year, cmo.model;


select * from CAR_COUNTRY; -- country, maker
select * from CAR_MAKER;  -- maker, model
select * from CAR_MODEL; -- model, car_year, price, cc, car_option, car_img, hiredate

--------------------------------------------------------------------
/*6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��,
   �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ

   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���
     �����λ���� �μ���ȣ�� ���� ���� �λ�
     10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
     ����Ͽ� 3�ڸ����� ,�� �־� ���.
     ��� ����� �ҹ��ڷ� ���.
*/
select e.empno, lower(e.ename), e.hiredate, e.sal,e.sal*3.3 tax ,(e.sal+e.sal*1.5+nvl(e.comm,0)-e.sal *0.033) cil,
to_char(decode(d.deptno,10,e.sal*0.07,20,e.sal*0.04,30,e.sal*0.1,e.sal*0.03),'9,999,999') insang ,d.deptno,lower(d.dname), lower(d.loc),z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno = d.deptno and d.deptno = z.seq) and (e.ename like '__A__' or e.ename like '%S');

--
/*6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��,
   �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ

   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���
     �����λ���� �μ���ȣ�� ���� ���� �λ�
     10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
     ����Ͽ� 3�ڸ����� ,�� �־� ���.
     ��� ����� �ҹ��ڷ� ���.
*/

-----

select e.empno, lower(e.ename), e.hiredate, e.sal, e.sal*0.003 tax, e.sal+trunc((e.sal/12),0)+nvl(e.comm,0)-sal*0.033 sil,
	  to_char(decode(d.deptno,10,sal*0.07,d.deptno,20,sal*0.04,30,sal*0.1,sal*0.03),'9,999') insang, d.deptno, lower(d.dname), d.loc,
	  z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno(+) = d.deptno and d.deptno = z.seq) and (e.ename like '%S'or e.ename like '__A__') ;







select * from EMP; -- empno, ename, job, mgr, hiredate, sal, comm, deptno
select * from DEPT;-- deptno, dname, loc
select * from ZIPCODE; -- zipcode , sido, gugun, dong, bunji, seq



