 --사원번호, 사원명, 연봉, 직급를 입력받아 test_proc 테이블에 추가하는 
 --procedure을 작성
 --1.사원번호는 1~9999사이의 값만 입력 되어야한다.
 --2.연봉 2500~8000사이만 입력되어야 한다.
 --2500 이하라면 2500으로 , 8000이상 이라면 8000으로 설정하여 
 -- 추가한다.  
 --3.직급은 사원, 주임, 대리, 과장, 차장, 부장 ,이사가 입력되었을 때만 
 --추가한다.  
 --4.영어로 입력된 이름은 맨 앞글자만 대문자로 처리 
 --중복된 사원번호가 입력되면 예외로 처리한다.
 
create or replace procedure insert_test_proc(
	empno number, ename  varchar2, sal number, 
	job varchar2, msg out varchar2,
	row_cnt out number)
is
	temp_sal number := sal; 
	temp_ename varchar2(10);
begin   
	row_cnt :=0;
	--제약1
	if empno between 1 and 9999 then    
	--제약2
		if temp_sal <2500 then
			temp_sal := 2500;
		end if;
		
		if temp_sal >8000 then
			temp_sal := 8000;
		end if; 
		--제약3
		if job in('사원', '주임', '대리', '과장', '차장', '부장' ,'이사') then
			insert into test_proc(empno, ename , hiredate, sal, job) 
			values(empno, initcap(ename), sysdate, temp_sal, job);
			
			row_cnt:=sql%rowcount;  
			commit;
			
			msg:=empno||'번 사원 정보가 추가되었습니다.';
		
		else 
			msg:= job||'은 입력가능한 직급이 아닙니다.';
		end if;		
	else
		msg:= empno||'사원번호는 1~9999 사이가 아닙니다.';
	end if;
	
	exception 
	when dup_val_on_index then
		msg:=empno||'번 사원번호는 이미 존재합니다.';
	when others then
		if sqlcode=-12899 then
			msg:=ename||'명은 한글 3자 영어 10자를 초과하였습니다';
		end if;
end;
/
