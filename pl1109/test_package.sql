select * from user_procedures;

--패키지에 포함된 함수 호출
select test_pack.get_name('이재찬')
from dual;

--프로시저호출
var age number;
exec test_pack.get_age(1988,:age);
print age;

--난수(Random number: 컴퓨터가 임의의 수를 생성하여
--반환하는 것.
--dbms_random.value(시작, 난수의 갯수) -숫자를 얻는 함수
--1에서부터 10사이의  난수 얻기
select trunc(dbms_random.value(1,10))
from dual;
--dbms_random.string('형식',난수갯수)- 문자열을 얻는 함수
--형식: u - 영문자 대문자 , ㅣ -영문자 소문자
--a- 대문자,소문자 혼합, x- 대문자와 숫자의 혼합,
--p- 특수문자 혼합
select dbms_random.string('u',10)
from dual;

select dbms_random.string('l',10)
from dual;

select dbms_random.string('a',10)
from dual;

select dbms_random.string('x',10)
from dual;

select dbms_random.string('p',10)
from dual;

select lucky_pack.lucky_num
from dual;

var name varchar2(30);
exec lucky_pack.lucky_name(:name);
print name;

var cur refcursor;
exec test_pack.constraints_search('other_constraints', :cur);

var ssn varchar2(14);

exec lucky_pack.create_ssn('880101','남자','노진경',:ssn);
print ssn;

exec lucky_pack.create_ssn('701111','여자','인순이',:ssn);
print ssn;

select name,ssn,valid_ssn1(ssn) from class4_info
