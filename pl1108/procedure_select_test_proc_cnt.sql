--조회: 직무를 입력받아 해당 직무에 일치하는 사원 수 와 연봉합을 
--직무는 사원, 주임, 대리, 과장, 차장, 부장 ,이사, 상무, 전무, 대표이사
--out parameter에 설정하는 procedure

create or replace procedure select_test_proc_cnt
( i_job varchar2,result_msg out varchar2, emp_cnt out number, emp_sal out number)
is
	temp_sal number :=0;

begin 
	
    emp_cnt :=0;
    emp_sal:=0;
	--1.
	if  i_job in('사원', '주임', '대리', '과장', '차장', '부장' ,'이사', '상무', '전무', '대표이사') then
		--집계함수로 처리
		select  count(empno), sum(sal)
		into	emp_cnt, emp_sal
		from 	test_proc
		where job=i_job;

--		for rec_emp in(
--			select  sal
--			from   test_proc
--			where job= i_job)
--		loop
--			--조회가 실행 될 때마다 사원수 증가 
--		 	emp_cnt:=emp_cnt+1;
--		 	emp_sal:= emp_sal + rec_emp.sal;
--		end loop;
		if emp_cnt !=0 then
			result_msg:= i_job||'으로 조회된 결과 있음.';  
		else
		    result_msg:= i_job||'직급의 사원은 존재하지 않습니다.'; 
		    emp_sal:=0; 
		end if;
		
	else
		result_msg:= i_job||'은 없는 직무입니다.';
		
	end if;
end;
   
