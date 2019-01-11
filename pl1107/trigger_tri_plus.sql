--cp_emp테이블에 레코드가 추가되면
--cp_emp3 테이블에 사원번호, 사원명,부서번호,직무, 연봉을 추가하는 트리거를 작성
--부서번호는 emp테이블의 사원번호가 7788인 사원과 동일한 번호로 추가
--연봉이 2000이하가 추가되면 cp_emp3테이블에는 연봉에 500을 
--더하여 추가하는 trigger 작성

create or replace trigger tri_plus
after insert on  cp_emp
for each row 
declare 

	sal number(4); 
	deptno_7788 number(4);
begin 

	select deptno
	into deptno_7788
	from  emp
	where empno='7788';
	
	
	if (:new.sal <2000) then
		sal := :new.sal+500;
	else
		sal := :new.sal;
	end if; 
	
	insert into cp_emp3(empno,ename,deptno,job,sal)
	values(:new.empno,:new.ename, deptno_7788, '사원' , sal);

end;
/
