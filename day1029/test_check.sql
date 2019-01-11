--check, not null, default
--check: 컬럼의 값을 유효성 검증된 값으로 추가할 때
--not null: 값을 반드시 입력받아야 할 때
--default: 컬럼이 생략되어  null이 입력될 때 대신 들어갈 기본값.

--이름, 나이, 주소, 입력일을 저장하는 테이블을 생성하시오
-- 단, 이름은 필수입력이고, 나이는 20~30대까지 입력가능하고
--입력일은 생략되면 현재 날짜로 입력되도록 설정하시오/

create table other_constraints(
	name varchar2(30 byte) constraint c_name not null,
	age number(2) constraint c_age check(age between 20 and 39),
	addr varchar2(20byte) null,
	input_date date default sysdate

	);
--user_constraints에서는 제약사항(PK,FK,UK,check, not null)만 확인가능
select * from other_constraints;

--default확인하고 싶으면 select * from user_tab_cols을 확인하기
select * from user_tab_cols
where table_name='OTHER_CONSTRAINTS';


--추가성공
--최초 데이터
insert into other_constraints(name,age,addr,input_date)
values('이재찬',27,'서울시','2018-10-26');
--주소와 입력일 생략
insert into other_constraints(name,age)
values('박영민' , 27 );

--error
--이름이 생략되는 경우(not null조건)
insert into other_constraints(age,addr,input_date)
values(27,'서울시','2018-10-26');

insert into other_constraints(name,age,addr,input_date)
values('',27,'서울시','2018-10-26');

--나이가 20~30이 아닌 경우
insert into other_constraints(name,age,addr,input_date)
values('이재찬',15,'서울시','2018-10-26');

insert into other_constraints(name,age,addr,input_date)
values('이재찬',40,'서울시','2018-10-26');

-------------------------------------------------------
select * from OTHER_CONSTRAINTS;

--not null은 테이블단위 제약상으로 설정할 수 없다.
create table temp(
	name varchar2(10),
	constraint c_name1 not null(name)
	);


--alter
--계정 잠그기: 관리자만 가능
alter user scott account lock;

--계정 열기:
alter user scott account unlock;

--비번 변경
alter user scott identified by 1111;
alter user scott identified by tiger;

--테이블 생성
create table test_atler(
	num number,
	neam varchar2(30),
     addr number
     );

--테이블명변경
alter table test_atler rename to test_alter;

-- 컬럼명 변경
alter table test_alter rename column NEAM to NAME;

--컬럼의 데이터형 변경: 레코드가 없으므로 데이터형까지 변경가능\
--addr 의 number 데이터형을 varchar2(100)
alter table test_alter modify addr varchar2(100) not null;

insert into test_alter(num,name,addr) values(1,'테스트','서울시 강남구');
commit;
--데이터형을 변경할 때에는 레코드가 비어있어야한다.
alter table test_alter modify addr number;
--레코드가 존재할 때에는 동일 데이터형에서 크기만 변경가능
alter table test_alter modify addr varchar2(200);
alter table test_alter modify addr varchar2(10); --==> 변경이 안됨

--컬럼 추가: 추가되는 컬럼은 가장 마지막에 추가된다.
--레코드가 존재하지 않으면 모든 제약사항을 부여할 수 있다.
alter table test_alter add id varchar2(16);
--컬럼삭제
alter table test_alter drop column addr;

--제약사항 추가
--레코드의 구성이 제약사항을 만족하고 있는지 판단.
update test_alter
set    id='test'
where  num=1;

alter table test_alter add constraint pk_test_alter
	primary key(id);

	--> NULL이 있는 곳에 pk를 지정해주면 에러
select * from user_constraints
where table_name= 'TEST_ALTER';

--제약사항 비활성화: 제약조건이 동작하지 않는다.
alter table test_alter disable constraint pk_test_alter;

insert into test_alter(num,name,id) values(2,'이재찬','test');

--제약사항 활성화: 레코드의 구성에 따라 다르다.
delete from test_alter where num=2;
alter table test_alter enable constraint pk_test_alter;

--제약사항 삭제
alter table test_alter drop constraint pk_test_alter;

---------------------------------
select * from TEST_ALTER;
