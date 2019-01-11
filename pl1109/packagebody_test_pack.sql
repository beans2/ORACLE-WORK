create or replace package body test_pack
is 
	--------------get_name function 시작-----------------------
	function get_name(name varchar2) return varchar2	
	is	
	begin
	    return to_char(sysdate,'day')||' 입니다 '||name||'님 안녕하쇼';
	end get_name; 
	--------------get_name function 끝--------------------------
	--------------get_age procedure 시작------------------------
	procedure get_age(birth_year in number, age out number) 
	is
	begin
		age:= to_char(sysdate, 'yyyy')-birth_year+1;
	end get_age;
    --------------get_age procedure 끝--------------------------
	--------------constraints_search 시작------------------------
	procedure constraints_search
		(tname varchar2, tab_info out sys_refcursor)
	is
	begin
			open tab_info for 
			select   utc.constraint_name,   utc. column_name,
          		 (select distinct data_type 
          		  from user_tab_columns
           		  where user_tab_columns.column_name=utc. column_name ) data_type
			from user_constraints uc, user_cons_columns utc
			where (uc.constraint_name=utc.constraint_name 	) and
   			 utc.table_name =upper(tname);
			
			
	end;
	--------------constraints_search 끝---------------------------

end;
/
