/*
���)
 880101-1234567 �� 
    ****** - *******
  234567 892345 �� ���ؼ� ���� ���� �� ���ؼ� 11�� �ٴ� �������� ���ϱ�
���� ����� 11���� ����
�� ���� 10���� ���� ������ ���ϱ� => �ֹι�ȣ�� ���ڸ��� ������ ��, ������ ��ȿ, ���������� ��ȿ
�Է°�: ssn
*/

create or replace function  valid_ssn(ssn varchar2)
return varchar2
is
 	return_result varchar2(6) := '��ȿ';
 	type table_valid is table of number index by binary_integer;  
 	tab_valid table_valid; 
 	tab_num table_valid;
 	sum_num number :=0; 
 	tab_gob table_valid;
 	bigyo number :=0;
 	flag char(1);
begin 
	 if check_ssn(ssn) = 'success' then
		for i in 1.. 6 loop  
	 		tab_valid(i) := substr(ssn,i,1);  
		end loop; 
		for i in 8..14 loop
			 tab_valid(i-1) := substr(ssn,i,1); 
		end loop; 
		--����������-
		flag  := tab_valid(13); 
		for i in 1..12 loop 
			if i>=9 then
	  	  		tab_gob(i) := tab_valid(i) * (i-7); 
	  	  	else
	  	  		tab_gob(i):=tab_valid(i) * (i+1);
	  	  	end if;
	  	  	sum_num :=sum_num+tab_gob(i);
		end loop;  
		bigyo := mod(11-mod(sum_num,11), 10); 
		if flag=bigyo then
			return_result  := '��ȿ';  
		end if;	
		return return_result;
	end if; 
	
end;
/
