
----------------Data for lunch_admin------------------
insert into lunch_admin(ID,PASS,NAME)
values('admin','1234','������');
insert into lunch_admin(ID,PASS,NAME)
values('lunch','1234','����ö');
insert into lunch_admin(ID,PASS,NAME)
values('root','1234','�ڿ���');
commit;

----------------Data for lunch------------------
insert into lunch(LUNCH_CODE, LUNCH_NAME, IMG, PRICE, SPEC, ID)
values(lunch_code,'��ũĥ��','m1_l1.gif',4500,'����� ������ ���������� ȯ���� ��������
 �پ��� ���� ������ �� �ִ� �κ� ������.','admin');
insert into lunch(LUNCH_CODE, LUNCH_NAME, IMG, PRICE, SPEC, ID)
values(lunch_code,'���','m1_l2.gif',3800,'������ �����ϴ� ���!
�ٻ�Ƣ�ܳ� Ƣ��ʾȿ� ������ ��⸦ ���� �����
�������� ����Ե�  ��� ������ȭ�� �κ� ������.
�ҽ����� �����ݴϴ�','admin');
commit;
select * from lunch;
----------------Data for ordering------------------
insert into ordering(ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code,1,'������','010-3456-4756','211.63.18.133','L_000001');
insert into ordering(ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code,3,'������','010-5436-2455','211.63.18.157','L_000001');
insert into ordering(ORDER_NUM,  QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code,1,'������','010-2314-8781','211.63.18.135','L_000002');
commit;
select * from ordering;
