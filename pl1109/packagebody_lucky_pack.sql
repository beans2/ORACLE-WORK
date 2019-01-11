
create or replace package body lucky_pack
as
--	------------lucky_num 시작-----------------
	function lucky_num return number
	is
	begin
		return trunc(dbms_random.value(1,46));
	end lucky_num;
--	------------lucky_num 끝    -----------------
--	------------lucky_name 시작-----------------
	procedure lucky_name(name out varchar2)
	is
		type name_tab is table of varchar2(30) index by binary_integer;
		name_arr name_tab;
		
		temp_num number;
	begin  
		name_arr(1):='공선의';
		name_arr(2):='이봉현';
		name_arr(3):='백인재';
		name_arr(4):='김정윤';
		name_arr(5):='박소영'; 
		name_arr(6):='최혜원';
		name_arr(7):='이재찬';
		
		temp_num:=trunc(dbms_random.value(1,name_arr.count+1));   
		name := name_arr(temp_num);  
		
		
	end lucky_name;  
	
--	------------lucky_name 끝   -----------------
--	------------make_ssn 시작-------------------- --------------------------------
	procedure make_ssn(birth varchar2, gender varchar2, ssn out varchar2)
	is 
		type tab_ssn is table of varchar2(14) index by binary_integer;
		temp_birth varchar2(6):=birth; 
	   	temp_gender varchar2(1) := 0;  
	   	rand_gender varchar2(1) := 0; 
	   	rand_num varchar2(5) :=0;
	   	valid_num varchar2(1) :=0;
	begin 
		if gender =  '남자' then
			rand_gender := trunc(dbms_random.value(1,10)); 
			if mod(temp_gender,2) = 0 then
				temp_gender := rand_gender+1;
			elsif gender =  '여자' then
				temp_gender := rand_gender;
			end if;
		else
			rand_gender := trunc(dbms_random.value(2,9)); 
			if mod(temp_gender,2) != 0 then
				temp_gender := rand_gender+1;
			else
				temp_gender := rand_gender;
			end if; 		
		end if; 		
		rand_num := trunc(dbms_random.value(0,100000));
		valid_num := trunc(dbms_random.value(0,10));
		ssn := birth||'-'||temp_gender||rand_num||valid_num;
	end make_ssn;   
	procedure create_ssn(birth varchar2, gender varchar2, name varchar2, 
	ssn out varchar2)
	is 
	--주민번호를 저장할 테이블
		type ssn_tab is table of number(1)
			index by binary_integer;
		ssn_arr ssn_tab;
		gender_num number := 2;
		temp_num number :=0;
		flag_num number:= 2; 
		temp_ssn varchar2(5); 
		
		ssn_value varchar2(14);
	begin
		--입력받은 생년월일을 ssn_tab에 추가
		for i in 1 .. length(birth) loop
			ssn_arr(i) := substr(birth,i,1);
		end loop;
		--성별채우기 1900년, 
		if gender='남자' then
			gender_num:=1;	
		end if;	

		    
			ssn_arr(7) := gender_num;
			
			--나머지 번째 방 값을 채운다.
			--880101123456
			for i in 8 .. 12 loop
				ssn_arr(i) := trunc(dbms_random.value(0,10));
			end loop;
			--생성된 주민번호를 가지고 끝자리를 채우기 위한 연산
			for i in 1.. ssn_arr.count loop
				temp_num:= temp_num+ssn_arr(i)*flag_num; 
				
				flag_num := flag_num+1;
				
				if flag_num = 10 then
					flag_num:=2;
				end if;
			 end loop;	
			--채워진 값으로 끝자리 설정
			ssn_arr(13):= mod(11- mod(temp_num ,11),10);
			
			ssn_value := birth||'-'||gender_num||ssn_arr(8)||ssn_arr(9)||ssn_arr(10)||
					ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
					
			--생성된 주민번호를 class4_info에 추가
		insert into class4_info(name, ssn)
		values(name, ssn_value);
		commit;
		ssn := ssn_value;					
	end create_ssn;
	
--	------------make_ssn 끝 ---------------------- 
--	/*1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 
--  함수를 추가하세요.
--  띠 - 태어난해를 12로 나눈 나머지가 
--      11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지,
--      2-개,1-닭,0-원숭이  */
--	------------return_tti 시작 ----------------------   
	function return_tti(birth number) return varchar2
	is
		return_t varchar2(12);
	begin
		if mod(birth,12) =11 then
			return '양띠';
		elsif mod(birth,12) =10 then
			return '말띠';
		elsif mod(birth,12) =9 then
			return '뱀띠';
		elsif mod(birth,12) =8 then
			return '용띠';
		elsif mod(birth,12) =7 then
			return '토끼띠';
		elsif mod(birth,12) =6 then
			return '호랑이띠';
		elsif mod(birth,12) =5 then
			return '소띠';
		elsif mod(birth,12) =4 then
			return '쥐띠';
		elsif mod(birth,12) =3 then
			return '돼지띠';
		elsif mod(birth,12) =2 then
			return '개띠';
		elsif mod(birth,12) =1 then
			return '닭띠';
		elsif mod(birth,12) =0 then
			return '원숭이띠';
		end if;
	
	end return_tti;
	
	------------return_tti 끝 ---------------------- 
	/*2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
   추가하세요.*/
	------------return_year시작 ----------------------    
	 procedure return_year(e_deptno number, o_year out varchar2 )
	 is 
	 	e_hiredate varchar2(14);
	 	--type tab_year is table of number index by binary_integer;
	 begin   

		select trunc(avg(to_char(sysdate,'yyyy')-to_char(hiredate,'yyyy')))
		into o_year 
	 	from emp
	 	where deptno = e_deptno;
	 end;
	 
----------------------------------------------------------------------
     procedure return_year1(e_deptno number, o_year out varchar2 )
	 is 
	 	e_hiredate varchar2(14);
	 	sum_year number := 0;
	 	avg_year number := 0;
	 	type rec_car is record(var number);
	 	type table_year is table of rec_car index by binary_integer;
	 	
	 	tab_year table_year;
	 	temp varchar2(10):=0;
	 	i number:=0;
	 begin
	 	for temp in  (
	 		select to_char(sysdate,'yyyy')-to_char(hiredate,'yyyy')
	 		from emp
	 		where deptno = e_deptno
		 ) 
	 	loop
	 	i := i+1;
	 	tab_year(i) := temp;	
	 	sum_year := sum_year + tab_year(i).var;
	 	end loop; 

	 	avg_year := trunc(sum_year/i);
	 	o_year := avg_year;  
	 end;
--	------------return_year끝 ---------------------- 
end lucky_pack;
/
