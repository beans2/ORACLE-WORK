--사원번호, 직급, 연봉을 입력받아 	test_proc 테이블에서 
--변경하는 procedure

--1.직급은 사원, 주임, 대리, 과장, 차장, 부장 ,이사, 상무, 전무, 대표이사가 입력되었을 때만 
 --변경한다.
 
 --2.연봉이 현재 연봉보다 작다면 현대 연봉보다 5%인상액으로 변경.
 
 create or replace procedure update_test_proc
 		(i_empno number, i_job varchar2, sal number, 
 		row_cnt out number, result_msg out varchar2)
 is
 	temp_sal number;	
 begin
 	row_cnt :=0;
 	--1
 	if i_job in( '사원', '주임', '대리', '과장', '차장', '부장' ,'이사', '상무', '전무', '대표이사') then
 		--2.
 		select sal
 		into temp_sal
 		from	test_proc
 		where empno =i_empno;   
 		
 		if sal <temp_sal  then
 			temp_sal := trunc(temp_sal*1.05,0);
 		else
 			temp_sal := sal;
 		end if;
 		
 		update test_proc
 		set		job = i_job ,sal = temp_sal
 		where	 empno=i_empno;		
 		
 		row_cnt := sql%rowcount;
 		
 		commit;
 		
 		result_msg :=i_empno||'번 사원의 정보가 변경되었습니다. 제시연봉: '||sal ||'확정연봉: '||temp_sal;
 		
 		
 		
 	else
 		result_msg :=i_job||'은 사내 직무가 아닙니다.';
 	
 	end if; 
 	
 	exception 
 	when no_data_found then
 		result_msg :=i_empno||'번 사원은 존재하지 않습니다';
 	when others then
 	    result_msg := sqlerrm;
 
 end;
 