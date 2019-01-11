/*
1. ��� ���̺��� �����ȣ,�����, ����, ���ʽ��� ��ȸ
   ��, ��� ��ȣ�� �������� ���� ���� �� 3~5������ ���ڵ常 ��� �ϰ�
      ������ 7�ڸ��� ���� ����ϰ� ,�� �־� ����Ѵ�.
      �ش� �ڸ��� ���� ������ 0�� ����Ѵ�.  -��
*/
select rownum,EMPNO, ENAME, to_char(SAL,'0,000,000'), COMM
from (select rownum r,empno,ename,sal, comm
			from (select empno,ename,sal,comm from emp order by empno desc))
where r  between 3 and 5;

/*
2. class4_info ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
   �¾ �ش� ����⵵-����+1 �� ���մϴ�. -��
*/

create table class4_info(
	num number(4),
	name varchar2(15),
	ssn char(14),
	age number(3),
	eye number(3,2),
	email varchar2(50),
	gender char(3),
	input_date date
	);
insert into class4_info values(1, '���ü�','930101-1234567',26,1.3,'jung@test.com', '��' , sysdate);
insert into class4_info values(2,'������','910101-1234567',28,1.8,'oh@test.com','��', sysdate);
insert into class4_info values(3,'����','921111-1234567',27,1.8,'kong.test.com','��',sysdate);
commit;

select NUM, NAME, AGE ,
to_char(sysdate,'yyyy')-age+1
from class4_info;

/*
3. class4_info ���̺� ��ȣ, �̸� ����, �̸���, �̸����� ��ȿ�� ���θ�
   ��ȸ.
   ��, �̸����� ��ȿ���� '@' �� ������ '��ȿ', '@'�� �����ϸ� '��ȿ'�����
*/
select NUM, NAME, AGE, EMAIL,
decode(gol,'@','��ȿ','��ȿ') "��ȿ��"
from (select num, name, age, email,
substr(email,instr(email,'@'),1) gol
from class4_info);

/*
4. car_model ���̺��� �ɼǿ� 'ABS'�� '�����'�� �ִ� ������
    �𵨸�,���,����,�ɼ�, �̹���, �����縦 ��ȸ �ϼ���.
    ��, ������ ������������ �����Ͽ� ����� ��.
*/
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, HIREDATE,(select maker from car_maker where car_model.model = car_maker.model) ������
from car_model
where car_option like '%ABS%' or car_option like '%�����%'
order by price;

select * from CAR_MAKER;

/*
5. car_model ���̺��� �𵨸��� '�ƹ���', '�ҷ���', 'A8'�� ������
    �𵨸�,�𵨺� ���� ���հ� �Ѱ踦 ��ȸ �ϼ���.
*/
select MODEL, sum(PRICE)
from car_model
where model in('�ƹ���','�ҷ���','A8')
group by rollup(model);


/*
6. car_model ���̺��� ���� ������ 1500~3000 ������ ������
   �𵨸�, ���, ����, �ɼ�, �Է���, ���ݺ� ������ ��ȸ�ϼ���.
   ��, ���ݺ� ������ �ߺ����� �ʴ� ��ȣ�� ��µǾ���մϴ�.
*/
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, rownum ranking
from (
	select model, car_year, price, car_option, hiredate
	from car_model
	order by price)
where price between 1500 and 3000;
----------------------------------------
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, row_number() over(order by price) ranking
from car_model
where price between 1500 and 3000;


/*
7. ��� ���̺��� �Ի�⵵�� 1981�� �̻��̸鼭 �Ŵ����� �ִ�  �����
   �����ȣ,�����,����,�Ŵ�����ȣ, ���� ������ ��ȸ �ϼ���.
   ��, ���������� ������ ������ �� ������ ������ �����ݴϴ�.
*/

select EMPNO, ENAME, SAL, MGR, rank() over(order by sal) ranking ,hiredate
from emp
where to_char(hiredate,'yyyy') >='1981'
