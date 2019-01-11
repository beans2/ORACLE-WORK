select * from user_procedures;
--외부변수선언
var cnt number;
var msg varchar2(300);
--프로시저 실행
execute update_test_proc(1112,'주임',3000,:cnt, :msg);
--처리결과 출력
print msg;
print cnt;

-- 직급:사원, 주임, 대리, 과장, 차장, 부장 ,이사, 상무, 전무, 대표이사
execute update_test_proc(1112,'선임',3100,:cnt, :msg);
--처리결과 출력
print msg;
print cnt;

--연봉계산
execute update_test_proc(1114,'주임',2490,:cnt, :msg);
--처리결과 출력
print msg;
print cnt;

select * from test_proc;


--삭제: 존재하는 사원번호로 삭제, 존재하지 않는 사원번호로 삭제
exec delete_test_proc(1111,:msg,:cnt);
print msg;
print cnt;

var sal number;

exec select_test_proc_cnt('김대리',:msg,:cnt,:sal);
print msg;
print cnt;
print sal;

select * from test_proc;

var address varchar2(300);
var cnt number;
select * from zipcode where dong like '%신정7동%';

--동 이름으로 우편번호 검색
exec search_zipcode('신정7동',:msg,:cnt);
print msg;
print cnt;

--sys_refcursor의 사용
var cur_dept refcursor;

--sys_refcursor를 저장
exec	select_all_dept(:cur_dept);

--출력
print cur_dept;
--부서번호 입력하여 부서별 사원 정보 조회
var cur_emp refcursor;

exec select_emp(15,:cur_emp);
print select_emp;

select * from DEPT;
select * from EMP;
