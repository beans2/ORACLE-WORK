--문자열 함수 사용.
select 'oracle길이는    '||length('oeacle')||'자' LENGTH,length('테스트')
from dual;

--사원테이블엣허 사원명, 사원명의 글자수를 조회
select  ename, length(ename)
from emp;

--사원테이블에서 사원명이 4자 이상인 사원의 사원명을 조회
select ename
from  emp
where length(ename) >= 4;

-- 대문자 :upper
select  upper('Test'),upper('테스트AbcdE')
from dual;

--소문자 :lower
select lower('Test')
from dual;

--사원테이블에서 사원명이 'scott'인 사원의 사원번호, 사원명, 입사일, 연봉을 조회하세요.
select EMPNO, ENAME, HIREDATE, SAL
from emp
where ename = upper('scott');
--where lower(ename) = 'scott';

--사원테이블에서 사원명을 모두 소문자로 조회
select lower(ENAME)
from emp;

--인덱스 얻기 :instr(문자열, 찾을 문자열)
select instr('AbcdeF','A'),instr('AbcdeF','F'),instr('AbcdeF','c'),
	instr('AbcdeF','k')  --k는 존재하지 않기 때문에 0이 출력
from dual;

create table CLASS4_INFO(
	NUM NUMBER(4),
	NAME VARCHAR2(15),
	SSN CHAR(3),
	AGE NUMBER(3),
	EYE NUMBER(3,2),
	EMAIL VARCHAR2(50),
	GENDER CHAR(3),
	INPUT_DATE DATE
	);

insert into class4_info(num,name,email)
values(6,'테스트','test@kr');

insert into class4_info(num,name,email)
values(7,'테스트1','test.kr');
commit;
select * from CLASS4_INFO  ;

select num,name,email,instr(email,'@'),instr(email,'.')
from class4_info;

--문자열 자르기 : substr(문자열, 시작인덱스, 자를글자수)
select  instr('Abcdefg','d')
from dual;

select  substr('Abcdefg',4,3),substr('Abcdefg',2,5),substr('Abcdefg',1)
from dual;

--class4_info태이블에서 번호, 이름, e-mail컬럼의 메일 주소만 조회
-- test@test.com
-- 도메인주소만도 조회
select NUM, NAME, substr(EMAIL,1,instr(email,'@')-1) MAILADD,
substr(EMAIL, instr(email,'@')+1) DOMAINADD
from class4_info;

--앞뒤 공백제거: trim, 앞공백제거 : ltrim, 뒷공백제거 : rtrim
select '['||trim('   A BC   ')||']' TRIM,
'['||ltrim('   A BC   ')||']' LTRIM,
'['||rtrim('   A BC   ')||']' RTRIM,
trim('a' from 'aaaaaaaaaaaaOracleaaaaaaaaa') "deleting a"
from dual;

--첫글자를 대문자로 변경 : initcap('문자열')
select initcap('oracle java jsp jQuery SCOTT') INITCAP
from dual;

select initcap(ename)
from emp;

--문자열 붙이기 : concap('문자열','붙일문자열')
select concat(concat('ABC','DEF'),'GHI'),'ABC'||'DEF'||'GHI' from dual;

--문자열 채우기
--왼쪽으로 채우기: lpad('문자열',총자릿수,'채울문자열')
select lpad('ABCDE',7,'$'),lpad('ABCDE',10,0) from dual;

--오른쪽ㅇ으로 채우기: rpad('문자열',총자릿수,'채울문자열')
select rpad('ABCDE',10,'가'),rpad('ABC',10,'#') from dual;












