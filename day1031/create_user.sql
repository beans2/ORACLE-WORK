--계정생성 : 관리자 계정만 생성가능
--create user 계정명 identified by 비번;

create user test_user identified by 1111;

--접속권한: , 자원사용권한:, 관리자 권한:
grant connect,resource,dba to test;

--테이블 생성x (resource 권한이 부여되면 가능)
create table my_table(num number);
insert into my_table values(1);
commit;
select * from my_table;


select sysdate,'연습' msg from dual;



--관리자 권한 부여 후 일반계정이 관리자의 업무를 수행할 수 있다.
--계정생성, 계정 권한 부여한다.
create view test_view as(select num from my_table);

select * from user_views;
drop view test_view;


--권한 회수 :
--revoke 권한... from 계정명;
revoke  from ;

create user test1 identified by 2222;

--계정삭제: 계정이 접속되어있다면 삭제되지 않는다.

select tname from tab;

--계정 조회(all_users - 계정명,생성일자 , dba_users - 계정의 여러 정보)

select * from dba_users;

