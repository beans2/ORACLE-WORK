/*1. 아래의 Dictionary테이블을 사용하여
user_constraints, user_tab_cols, user_tab_columns
입력된테이블에 대한 제약사항명, 컬럼명, 데이터형
을 조회하는 쿼리문을 작성 .
*/

--select * from user_constraints;   -- user_tab_cols 와 table_name
--select * from user_tab_cols; -- user_tab_columns와 data_type 일치
--select * from user_tab_columns;
set serveroutput on
set verify off
	accept table_name prompt '테이블명: '
declare
	type rec_con is record(constraint_name user_constraints.constraint_name%type,
		column_name user_tab_cols.column_name%type , data_type user_tab_columns.data_type%type );
	type table_con is table of rec_con index by binary_integer;
	
	arr_con table_con;
	i number :=0;
begin
	for temp in (
		select uc.CONSTRAINT_NAME, uclm.column_name, uclm.data_type
		from user_constraints uc, user_tab_columns uclm
		where (uc.table_name = uclm.table_name) and uc.table_name = '%table_name'
	  )	
	loop
        i:=i+1;
        arr_con(i):= temp;
     end loop;
     dbms_output.put_line('---------------------------------------------------');
	for i in 1.. arr_con.count loop
		dbms_output.put_line(arr_con(i).constraint_name || ' '|| arr_con(i).column_name||' '||arr_con(i).data_type);
	end loop;
end;
/
