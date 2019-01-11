select * from user_procedures;
drop function plus;

--주민번호의 유효성 검증
select	check_ssn('880101-123456'),check_ssn('88010-11234567'),check_ssn('8801011234567'),check_ssn('880101-1234567')
from dual;


select * from CLASS4_INFO ;

update class4_info
set	ssn='880101-123456'
where num=6;

insert into class4_info(num, name, ssn,email)
values(8,'김정은','88010-11234567','jung@naver.com');

commit;

--class4_info테이블에서 번호, 이름, 주민번호,
--주민번호의 형식 체크를 하여 모든 레코드를 조회

select num, name, ssn, check_ssn(ssn), get_age(ssn)
from class4_info;
--주민번호가 유효할 때 나이를 구하는 함수 사용
select get_age('880101-123456'),get_age('88010-11234567'),get_age('8801011234567'),
get_age('880101-1234567'),get_age('000101-1234567'),get_age('880101-5234567')
,get_age('990101-9234567')
from dual;

insert into class4_info(num, name, ssn)
values(8,'제임스','890307-5234567');
insert into class4_info(num, name, ssn)
values(9,'혜리','030307-4234567');
insert into class4_info(num, name, ssn)
values(9,'오영군','990307-9234567');
commit;
--번호, 이름, 주민번호, 나이 조회
--나이는 주민번호가 유효했을 때는 나이를 출력하고
--유효하지 않다면 0을 출력한다.
select num,name, ssn, get_age(ssn)
from class4_info;

--이메일 유효성 검증

select valid_email('@.'),valid_email('a@b.c'),valid_email('aaaaaaaab.c'),valid_email('aaa@aaaaaabc'),valid_email('aaaaa@aaaaab.com')
from dual;


--번호, 이름, 이메일, 이메일의 유효성 조회
select num,name,email,valid_email(email)
from class4_info;

--1~9999999까지 1씩 증가하는 시퀀스 작성
create sequence seq_item
increment by 1
start with 1
maxvalue 9999999;
cache 10
nocycle;

select seq_item.nextval
from dual;


create table test_func(
	num char(10),
	name varchar2(30),
	input_date date default sysdate,
	constraint pk_test_func primary key(num)
);
--함수를 호출하여 지정된 형식의 번호를 얻기
--매개변수 없는 함수를 호출할 때에는 ()를 붙이지 않아도 된다.

select item_num
from dual;

--문자열형식의 증가하는 번호를 사용하여 Table에 추가
insert into test_func(num,name)
values(item_num,'김희철');

select * from test_func;


select valid_ssn('921111-1351117')from  dual;

select num, name, ssn, valid_ssn1(ssn)
from CLASS4_INFO;



select * from user_procedures
where object_type like 'P%';

var num number;
exec proc_plus(11,11,:num);
print num

var insert_msg varchar2(30);
execute insert_cpemp2(1111,'김정윤',3000,:num,:insert_msg);

print num;
print insert_msg;

