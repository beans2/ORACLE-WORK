
create or replace package body lucky_pack
as
--	------------lucky_num ����-----------------
	function lucky_num return number
	is
	begin
		return trunc(dbms_random.value(1,46));
	end lucky_num;
--	------------lucky_num ��    -----------------
--	------------lucky_name ����-----------------
	procedure lucky_name(name out varchar2)
	is
		type name_tab is table of varchar2(30) index by binary_integer;
		name_arr name_tab;
		
		temp_num number;
	begin  
		name_arr(1):='������';
		name_arr(2):='�̺���';
		name_arr(3):='������';
		name_arr(4):='������';
		name_arr(5):='�ڼҿ�'; 
		name_arr(6):='������';
		name_arr(7):='������';
		
		temp_num:=trunc(dbms_random.value(1,name_arr.count+1));   
		name := name_arr(temp_num);  
		
		
	end lucky_name;  
	
--	------------lucky_name ��   -----------------
--	------------make_ssn ����-------------------- --------------------------------
	procedure make_ssn(birth varchar2, gender varchar2, ssn out varchar2)
	is 
		type tab_ssn is table of varchar2(14) index by binary_integer;
		temp_birth varchar2(6):=birth; 
	   	temp_gender varchar2(1) := 0;  
	   	rand_gender varchar2(1) := 0; 
	   	rand_num varchar2(5) :=0;
	   	valid_num varchar2(1) :=0;
	begin 
		if gender =  '����' then
			rand_gender := trunc(dbms_random.value(1,10)); 
			if mod(temp_gender,2) = 0 then
				temp_gender := rand_gender+1;
			elsif gender =  '����' then
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
	--�ֹι�ȣ�� ������ ���̺�
		type ssn_tab is table of number(1)
			index by binary_integer;
		ssn_arr ssn_tab;
		gender_num number := 2;
		temp_num number :=0;
		flag_num number:= 2; 
		temp_ssn varchar2(5); 
		
		ssn_value varchar2(14);
	begin
		--�Է¹��� ��������� ssn_tab�� �߰�
		for i in 1 .. length(birth) loop
			ssn_arr(i) := substr(birth,i,1);
		end loop;
		--����ä��� 1900��, 
		if gender='����' then
			gender_num:=1;	
		end if;	

		    
			ssn_arr(7) := gender_num;
			
			--������ ��° �� ���� ä���.
			--880101123456
			for i in 8 .. 12 loop
				ssn_arr(i) := trunc(dbms_random.value(0,10));
			end loop;
			--������ �ֹι�ȣ�� ������ ���ڸ��� ä��� ���� ����
			for i in 1.. ssn_arr.count loop
				temp_num:= temp_num+ssn_arr(i)*flag_num; 
				
				flag_num := flag_num+1;
				
				if flag_num = 10 then
					flag_num:=2;
				end if;
			 end loop;	
			--ä���� ������ ���ڸ� ����
			ssn_arr(13):= mod(11- mod(temp_num ,11),10);
			
			ssn_value := birth||'-'||gender_num||ssn_arr(8)||ssn_arr(9)||ssn_arr(10)||
					ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
					
			--������ �ֹι�ȣ�� class4_info�� �߰�
		insert into class4_info(name, ssn)
		values(name, ssn_value);
		commit;
		ssn := ssn_value;					
	end create_ssn;
	
--	------------make_ssn �� ---------------------- 
--	/*1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� 
--  �Լ��� �߰��ϼ���.
--  �� - �¾�ظ� 12�� ���� �������� 
--      11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����,
--      2-��,1-��,0-������  */
--	------------return_tti ���� ----------------------   
	function return_tti(birth number) return varchar2
	is
		return_t varchar2(12);
	begin
		if mod(birth,12) =11 then
			return '���';
		elsif mod(birth,12) =10 then
			return '����';
		elsif mod(birth,12) =9 then
			return '���';
		elsif mod(birth,12) =8 then
			return '���';
		elsif mod(birth,12) =7 then
			return '�䳢��';
		elsif mod(birth,12) =6 then
			return 'ȣ���̶�';
		elsif mod(birth,12) =5 then
			return '�Ҷ�';
		elsif mod(birth,12) =4 then
			return '���';
		elsif mod(birth,12) =3 then
			return '������';
		elsif mod(birth,12) =2 then
			return '����';
		elsif mod(birth,12) =1 then
			return '�߶�';
		elsif mod(birth,12) =0 then
			return '�����̶�';
		end if;
	
	end return_tti;
	
	------------return_tti �� ---------------------- 
	/*2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
   �߰��ϼ���.*/
	------------return_year���� ----------------------    
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
--	------------return_year�� ---------------------- 
end lucky_pack;
/
