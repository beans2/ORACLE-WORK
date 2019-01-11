--����1.
--�����縦 �ΰ� �Է¹޾� �����翡 �ش��ϴ� ��� ������
-- ������, ������,�𵨸�,���,����,�ɼ��� ��ȸ �ϼ���.
-- ����� ������ ������������ ��ȸ�Ͽ��� �� ��ȸ�� ����� 
--   3~6��° ���ڵ常  ����ϼ���.
--
--����, ��Ƹ� �Է��Ͽ��� ��
-- ��� ��
-------------------------------------------------------------------
--��ȣ ������  ������  �𵨸�  ���  ����   �Է��� 
-------------------------------------------------------------------
--1     ����     ����    �ƹ���  2001  3,500 mm-dd-yyyy
--
--
-------------------------------------------------------------------
--�˻� ��� ���� [x]��, ��� [x]��
--  

       
set serveroutput on
set verify off
	accept maker1 prompt '������1: ' 
	accept maker2 prompt '������2: '
	
declare
     type rec_car is record(country car_country.country%type, maker car_maker.maker%type, model car_model.model%type, 
     car_year car_model.car_year%type, price car_model.price%type, hiredate car_model.hiredate%type);
     type tab_car is table of rec_car index by binary_integer;
     arr_car1 tab_car;
     i number:=0;
     search_cnt1 number :=0;
     search_cnt2 number :=0;
 
     
     type num_tab is table of number index by binary_integer;
     arr_num num_tab;  
begin
   	dbms_output.put_line('---------------------------------------------------');
     dbms_output.put_line('��ȣ  ������  ������   �𵨸�     ���   ����    �Է���');
     dbms_output.put_line('---------------------------------------------------'); 

     for temp1 in 
     	(
     	select cc.country,cma.maker, cmo.model, cmo.car_year, cmo.price, cmo.hiredate
     	from car_country cc, car_maker cma, car_model cmo
     	where  (cma.maker = cc.maker and cma.model = cmo.model) and (cma.maker ='&maker1' or cma.maker='&maker2')
     	order by cmo.price 
     	) 
     loop
     i:=i+1;
     arr_car1(i):= temp1;
     end loop;

     for i in 3.. 6 loop 
     		dbms_output.put_line(rpad(i,6,' ')|| rpad(arr_car1(i).country,8,' ')||rpad(arr_car1(i).maker,8,' ')||
     		rpad(arr_car1(i).model,12,' ')||rpad(arr_car1(i).car_year,6,' ')||
     		rpad(to_char(arr_car1(i).price,'9,999'),8,' ')||to_char(arr_car1(i).hiredate,'mm-dd-yyyy')); 
     		if arr_car1(i).maker = '&maker1'then
     		    search_cnt1:=search_cnt1+1;
     		elsif arr_car1(i).maker = '&maker2' then
     			search_cnt2:=search_cnt2+1;
     		end if;
     end loop;	
     	dbms_output.put_line('---------------------------------------------------');
     	dbms_output.put_line('�˻����'||'&maker1'||' [' ||search_cnt1||']��'||'&maker2'||' [' ||search_cnt2||']��');    
end;
/
