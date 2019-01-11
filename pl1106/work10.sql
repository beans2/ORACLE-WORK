--숙제1.
--제조사를 두개 입력받아 제조사에 해당하는 모든 차량의
-- 제조국, 제조사,모델명,년식,가격,옵션을 조회 하세요.
-- 출력은 가격의 오름차순으로 조회하였을 때 조회된 결과에 
--   3~6번째 레코드만  출력하세요.
--
--현대, 기아를 입력하였을 때
-- 출력 예
-------------------------------------------------------------------
--번호 제조국  제조사  모델명  년식  가격   입력일 
-------------------------------------------------------------------
--1     국산     현대    아반테  2001  3,500 mm-dd-yyyy
--
--
-------------------------------------------------------------------
--검색 결과 현대 [x]대, 기아 [x]대
--  

       
set serveroutput on
set verify off
	accept maker1 prompt '제조사1: ' 
	accept maker2 prompt '제조사2: '
	
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
     dbms_output.put_line('번호  제조국  제조사   모델명     년식   가격    입력일');
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
     	dbms_output.put_line('검색결과'||'&maker1'||' [' ||search_cnt1||']대'||'&maker2'||' [' ||search_cnt2||']대');    
end;
/