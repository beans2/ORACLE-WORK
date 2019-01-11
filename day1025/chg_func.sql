--변환함수
--문자열이 아닌 값(숫자, 날짜)을 문자열로 변환
--숫자 -> 지정한 자리에 콤마(,)나 점(.)을 출력

select to_char(20181025,'0,000,000,000'),
to_char(20181025,'9,999,999,999')
from dual;


select to_char(2018.1025,'9999,999.999') from dual;

--사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회
--단, 연봉은 데이터가 있는 것까지만 콤마(,)를 넣어 출력
select EMPNO, ENAME, HIREDATE, to_char(SAL,'999,999,999') from emp;

--to_char로 반환된 값은 문자열이므로 여기에 숫자를 더하니까 연산이 안되서 ERROR난다.
select to_char(sal,'9,999')+100 from emp;


--날짜를 문자열로 변환
select to_char(sysdate,'yyyy-mm-dd am hh12:mi:ss day dy q') from dual;

--pattern에 특수문자가 아닌 문자열 사용 "로 묶는다
select to_char(sysdate,'yyyy"년"mm"월"dd"일"')  from dual;

--pattern을 길게 사용하면 Error
select concat (to_char(sysdate,'yyyy "년" mm " 월" dd " 일 " hh24 " 시 " mi " 분 " ss "초 " ') from dual;

--사원테이블에서 사원번호, 사원명, 입사일을 조회
--단, 입사일은 '년-월-일 요일'의 형식으로 출력
select  empno, ename, hiredate, to_char(hiredate,'yyyy-mm-dd day hh:mi:ss')
from   emp;

--사원테이블에서 입사년도가 '1981'년인 사원들의
--사원번호, 사원명, 입사일, 연봉을 조회하세요.
select EMPNO, ENAME, HIREDATE, SAL
from emp
where to_char(hiredate,'yyyy') = '1981';

select * from CLASS4_INFO ;

--현재날짜가 아닌 날짜를 추가할 때
--날짜 형식의 문자열을 추가하면 된다.
insert into class4_info(num,name,input_date)
values(8,'양세찬',to_date('2018-10-21','yyyy-mm-dd'));
insert into class4_info(num,name,input_date)
values(9,'양세형',to_date('2018-10-22','yyyy-mm-dd'));

select to_char(input_date,'yyyy-mm')
from class4_info;

--to char는 날짜나 숫자를 입력받아야한다. (함수의 값(인자)은
--데이터형을 구분한다.)
select to_char(to_date('2018-10-25'),'mm')
from dual;


--숫자변환 : to_number('숫자형식의 문자열')
select '25'-'10', to_number('25')-to_number('10')
from dual;

---------------------------------------------------------------------------------------------------
--조건함수 : decode(값, 비교값, 출력값, 비교값, 출력값,,,, 비교값이 없을 때 출력값)
---------------------------------------------------------------------------------------------------

--사원테이블에서 사원번호, 사원명, 연봉, 부서명 조회
--단, 부서명은 아래의 표에 해당하는 부서명으로 출력
-- 10-개발부, 20-유지보수부 , 30- 품질보증부 그 외는 탁구부로 출력

select EMPNO, ENAME, SAL, decode(DEPTNO,10,'개발부',20,'유지보수부','탁구부')  DNAME
from emp;

--사원번호, 사원명, 보너스, 인센티브 조회
--인센티브는 부서별로 아래의 표와같이 차등지급합니다
--10-연봉20%, 20- 연봉50%을, 30- 연봉30% 그 외 연봉 10%로 계산하여 출력

select EMPNO, ENAME, COMM, DEPTNO,sal, decode(deptno,10,sal*0.2,20,sal*0.5,30,sal*0.3,sal*0.1)  incentive
from emp;

--case
--사원테이블에서 사원번호, 사원명, 연봉, 부서명 조회
--단, 부서명은 아래의 표에 해당하는 부서명으로 출력
-- 10-개발부, 20-유지보수부 , 30- 품질보증부 그 외는 탁구부로 출력
select EMPNO, ENAME, SAL, DEPTNO,
case deptno when 10 then '개발부'
when 20 then '유지보수부'
when 30 then '품질보증부'
else '탁구부'
end
OUTPUT
from emp;
--case
--사원번호, 사원명, 보너스, 총수령액 조회
--총수령액은 연봉+ 보너스 + 인센으로 구성된다.
--인센티브는 부서별로 아래의 표와같이 차등지급합니다
--10-연봉20%, 20- 연봉50%을, 30- 연봉30% 그 외 연봉 10%로 계산하여 출력

select EMPNO, ENAME, COMM,
case deptno when 10 then sal+ nvl(comm,0)+sal*0.2
when 20 then sal+ nvl(comm,0)+sal*0.5
when 30 then sal+ nvl(comm,0)+sal*0.3
else sal+nvl(comm,0)+sal*0.1
end
"Incentive"
from emp;

--사원테이블에서 사원번호, 사원명, 직무를 조회
--단, 직무의 첫 글자가 'C'-파리목숨 ,'S'-돈벌어다주는사람
--'M'- 감시인, 'A'- 살펴보는 사람, 'P'- 두목님

select empno,ename,job,decode(substr(job,1,1),'C','소모품',
'S','돈 벌어다 주는 사람',
'M','감시인',
'A','설펴보는사람',
'두목님')
from emp;

select decode(to_char(hiredate,'yyyy'),'1987','젊은이','노인')
from emp;


