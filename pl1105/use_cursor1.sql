--부서번호를 입력받아 해당 부서에 근무하는 사원번호, 사원명, 연봉,입사일을 조회한후 총 사원수와 ,연봉합 조회

set verify off
set serveroutput on
	accept deptno prompt '부서번호: '


declare
     --1. 커서선언
     cursor cur_emp is
     	select empno,ename, sal, to_char(hiredate,'yyyy-mm-dd') hiredate
     	from emp
     	where deptno=&deptno;
     --레코드 변수선언
     type rec_emp is record(empno emp.empno%type, ename emp.ename%type, sal emp.sal%type, hiredate varchar2(10));
     --테이블 생성(데이터처리와 보여지는 부분을 분리하여 만들기 위해)
     type tab_emp is table of rec_emp index by binary_integer;
     
     arr_emp tab_emp;
     
     emp_data rec_emp; --==> 커서 값을 넣어줄 레코드를 만들었다.
     --연봉의 합 저장
     total_sal number:=0;
     i number :=0; 
begin
	--2. 커서 열기
	if cur_emp%isopen then
		close cur_emp;
	end if;
	open cur_emp;

	--3. 인출
	--커서에서 emp_data에 값을 넣고 이 값을 table로 옮겨주는 작업( 값을 출력)
	loop
		fetch cur_emp into emp_data;

		exit when cur_emp%notfound;
		--데이터처리
		i:=i+1;
		arr_emp(i):= emp_data;
	end loop;
	--조회된 값을 출력하는 문   
	if i!=0 then		
		dbms_output.put_line('사원번호  사원명  연봉  입사일');  
		
		for idx in 1..arr_emp.count loop
			dbms_output.put_line(arr_emp(idx).empno||' '||arr_emp(idx).ename||' '||arr_emp(idx).sal||' '||arr_emp(idx).hiredate);
		
			total_sal:= total_sal+arr_emp(idx).sal; 
		end loop;		
	
		dbms_output.put_line(&deptno||'번 부서 사원수'|| cur_emp%rowcount||'명');
		dbms_output.put_line('연봉 합: '||total_sal);
	else
		dbms_output.put_line(&deptno||'번 부서는 사원이 없습니다.');
	end if;
          dbms_output.put_line('사용해 주셔서 감사합니다');
	--4.커서 닫기
		close cur_emp;
end;
/
