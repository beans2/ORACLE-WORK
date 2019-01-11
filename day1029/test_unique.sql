--unique: 값이 없을 수도 있고 있다면 유일해야 할 때.
--이름, 이메일, 주소 저장하는 테이블 생성

create table column_unique(
	name varchar2(30),
	email varchar2(50)constraint uk_email unique,
	addr varchar2(100)
);


select * from user_constraints;

--추가성공
--최초입력
insert into column_unique(name,email,addr)
values('이재찬','lee@test.com','경기도 수원시 영통구');
commit;

--이메일이 없는(null입력) 경우
insert into column_unique(name,addr)
values('이재찬','경기도 수원시 영통구');
commit;

insert into column_unique(name,email,addr)
values('이재찬','','경기도 수원시 영통구');
commit;

--실패하는 경우
--같은 이메일이 입력되었을 때
insert into column_unique(name,email,addr)
values('박영민','lee@test.com','부산시 ');
commit;

--테이블단위
--번호, 이름, 전화번호, 카드번호를 저장하는 테이블을 생성
--전화번호와 카드번호는 없을 수도 있고 있다면 유일

create table table_unique(
	name varchar2(30),
	num number(5),
	tel varchar2(13),
	constraint uk_tel unique(tel),
	card_num char(4),
	constraint uk_card_num unique(card_num)
);

--추가성공
--최초입력
insert into table_unique(num,name,tel,card_num)
values(1,'김정운','010-8769-6112','1234');
commit;

--전화번호와 카드번호가 다른경우
insert into table_unique(num,name,tel,card_num)
values(2,'이재현운', '010-1111-2222','1235');

--null입력
insert into table_unique(num,name,tel,card_num)
values(2,'이재현운', '','');
commit;

insert into table_unique(num,name)
values(2,'이재현');

--에러
--전화번호든 카드번호든 둘중에 하나라도 같다면 에러
insert into table_unique(num,name,tel,card_num)
values(4,'정택성', '010-1111-2223','1235');

insert into table_unique(num,name,tel,card_num)
values(4,'정택성', '010-1111-2222','9999');

--------------------------------------------
select * from TABLE_UNIQUE;
