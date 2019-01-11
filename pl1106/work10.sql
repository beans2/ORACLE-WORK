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
     arr_car2 tab_car;
     i number:=0;
     j number:=0;
     search_cnt1 number :=0;
     search_cnt2 number :=0;
     i_cnt number :=0; 
     
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
     	where  (cma.maker = cc.maker and cma.model = cmo.model) and cma.maker ='&maker1' 
     	order by cmo.price 
     	) 
     loop
     i:=i+1;
     arr_car1(i):= temp1;
     end loop;
     search_cnt1:=i;
     i :=0;
     for temp2 in 
     	(
     	select cc.country,cma.maker, cmo.model, cmo.car_year, cmo.price, cmo.hiredate
     	from car_country cc, car_maker cma, car_model cmo
     	where  (cma.maker = cc.maker and cma.model = cmo.model) and cma.maker='&maker2'
     	order by cmo.price 
     	)
     loop
      j:=j+1;
     arr_car2(j):=temp2; 
     end loop;
     search_cnt2:=j;
     
     for i in 1.. arr_car1.count loop
     	i_cnt := i;
     	arr_num(i) := i_cnt;
     end loop;
     
     for i in 1.. arr_car2.count loop 
     	arr_num(i_cnt+i) := i_cnt+1;
     end loop;	
     
     for i in 1.. arr_car1.count+arr_car2.count loop 
     	if arr_num(i) between 3 and 6 then
     		dbms_output.put_line(rpad(arr_num(i),6,' ')|| rpad(arr_car2(arr_num(i)).country,8,' ')||rpad(arr_car2(arr_num(i)).maker,8,' ')||
     		rpad(arr_car2(arr_num(i)).model,12,' ')||rpad(arr_car2(arr_num(i)).car_year,6,' ')||
     		rpad(to_char(arr_car2(arr_num(i)).price,'9,999'),8,' ')||to_char(arr_car2(arr_num(i)).hiredate,'mm-dd-yyyy')); 
     	end if; 
     end loop;	
     	dbms_output.put_line('---------------------------------------------------');
     	dbms_output.put_line('�˻����'||'&maker1'||' [' ||search_cnt1||']��'||'&maker2'||' [' ||search_cnt2||']��');    
end;
/