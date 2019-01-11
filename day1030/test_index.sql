--인덱스조회
select * from user_indexes;


create table cp_zipcode as(select * from zipcode);

select count(*)from cp_zipcode;
select count(*)from zipcode;;

--cp_zipcode테이블의 seq컬럼에 unique index설정
create unique index idx_zipcode on cp_zipcode(seq);
drop index idx_zipcode;

select*from user_indexes;


--인덱스를 사용하지 않는 조회
select zipcode, sido, gugun, bunji, seq
from zipcode
where seq=49000;

--인덱스를 사용한 조회
select /*+ordered index(idx_zipcode)*/zipcode, sido, gugun, bunji, seq
from cp_zipcode
where seq=49000;

--우편번호는 중복되지만 독특한 형태를 가진다.
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;
--인덱스를 사용하지 않은 조회
select zipcode,sido, gugun, bunji, seq
from zipcode
where zipcode='402-866';
--인덱스를 사용한 조회
select /*+ordered index(idx_zipcode)*/zipcode, sido, gugun, bunji, seq
from cp_zipcode
where zipcode='402-866';

select * from user_indexes;

--인덱스는 실제 테이블이 변경되면 변경사항을 적용하지 않는다. ==> rebuild 해줘야한다.
--테이블과 인덱스를 동일하게 맞추는 쿼리
alter index idx_zipcode rebuild;


--group by having 절
--having 그룹으로 묶일 조건
-- 사원수가 4명 이상인 부서의 부서번호, 사원수, 연봉합, 최고연봉을 조회하세요

select deptno, count(deptno), sum(sal),max(sal)
from emp
group by deptno having count(deptno)>=4;


--replace : 값을 치환
select replace('오늘은 목요일 입니다','오늘은','내일은')
from dual;


select replace('정택성, 이재현,이재찬,김희철','이재찬','인천시의 자랑이재찬')
from dual;


select * from user_objects;


drop table zipcode;
drop table cp_zipcode;
purge recyclebin ;

select * from ZIPCODE;

drop table zipcode;
drop table cp_zipcode;
drop table emp;

