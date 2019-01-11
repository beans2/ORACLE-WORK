-- 원하는 특정 테이블의 원하는 컬럼의 모든 레코드를 조회

-- class4_info 테이블에서 이름, 번호, 나이 조회


--select name, num, age from class4_info;

-- 모든 컬럼을 조회

-- select * from class4_info;

--컬럼 크기 변경.
--0 : 데이터가 없다면 0을 채워 출력
--9 : 데이터가 존재 하는 것만 출력
--문자열은 "a글자수를 설정"

column num format 0000
column name format a6
col ssn format a7
col age format 999
col vis format 0.000
col email format a10

select * from class4_info;


--컬럼명에 alias 부여
SELECT NUM,NAME,INPUT_DATE i_date1,INPUT_DATE i_date2
FROM CLASS4_INFO;






