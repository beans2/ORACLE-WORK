--제약사항을 확인: user_constraints
select *
from user_constraints;

-- 번호, 이름, 전화번호, 주민번호, 이메일을 저장하는 테이블을 생성.
-- 주민번호는 NULL을 허용하지 않으면서 유일해야한다.
create table column_primary(
	num number,
	name varchar2(30),
	tel varchar2(13),
	ssn char(14) constraint pk_column_primary primary key,
	email varchar2(50)
);

/*drop table column_primary;
purge recyclebin;*/

insert into column_primary(num, name,ssn)values(1,'test','880101-1234567');

insert into dept(deptno, dname, loc) values(10,'t','t');


--컬럼하나로 pk가 구성되는 경우
--추가성공
--최초 레코드 삽입
insert into column_primary(num,name,tel,ssn,email)
values(1,'이재찬','010-1234-5678','880101_1234567','lee@test.com');
select * from COLUMN_PRIMARY;
commit;

--주민번호가 다른 경우
insert into column_primary(num,name,tel,ssn,email)
values(2,'이재현','010-1234-6432','890101_1234567','lee@test.com');

--추가실패
--주민번호에 같은 주민번호가 입력되는 경우
insert into column_primary(num,name,tel,ssn,email)
values(3,'정택성','010-7281-1279','880101_1234567','jung@test.com');

--null이 입력되는 경우
--숫자, 날짜는 컬럼이 생략되면 null이 입력되고
--문자열(고정길이, 가변길이)는 컬럼이 생략되는 경우와 "(empty)
--로 데이터가 추가되는 경우에 null 입력된다.
--컬럼이 생략되어 insert 되는 경우
insert into column_primary(num,name,tel,email)
values(3,'정택성','010-7281-1279','jung@test.com');
--컬럼은 정의되어있으나 ''가 입력되는 경우
insert into column_primary(num,name,tel,ssn,email)
values(3,'정택성','010-7281-1279','','jung@test.com');

--table level constraint
--이름, 아이디, 비밀번호를 저장하는 테이블을 생성
--아이디는 null을 허용하지않으면서 값은 유일해야한다.

create table table_primary(
	name varchar2(30),
	id varchar2(20),
	passwd varchar2(30),
	constraint pk_table_primary primary key(id)
);

--추가설공
insert into table_primary(name,id, passwd)
values('김희철','kim','1234');
insert into table_primary(name,id, passwd)
values('김희철','test','1234');
commit;
select * from TABLE_PRIMARY;
--추가실패
insert into table_primary(name,passwd)
values('김희철','1234');
insert into table_primary(name,id,passwd)
values('김희철','','123455');



--가장 마지막 사원번호보다 1증가한 값으로
--EMMP_00007899 의 형식을 가진 값을 조회
--내가 한거
select 'EMP_'||lpad(empno+1,8,'0')
from (select rownum r ,empno from emp order by empno)
where r =14;

--강사님이 하신거
select concat('EMP_',lpad(max(empno)+1,8,0))
from emp;

select * from EMP order by empno  ;


--여러개의 컬럼이 pk로 구성되는 경우.
--table 단위 제약사항으로만 설정가능

--아이템명, 아이템 번호, 설명
--아이템 번호는 레코드가 추가될때 순차적으로
--증가하며 'ITEM_0001'의 형식을 가진다.
--아이템 번호와 아이템명은 같을 수 없다.

create table table_multi_primary(
	item_num char(9),
	item varchar2(60),
	item_info varchar2(4000),
	constraint pk_table_multi_primary primary key(item_num, item)
);
select * from user_constraints;

--'ITEM_0001' 조회
select 'ITEM_'||lpad(nvl(max(item_num),0)+1,4,0) from table_multi_primary ;

insert into  table_multi_primary;

--여러개의 컬럼이 하나의 PK로 구성되는 경우
--추가성공: 최초데이터 입력
insert into table_multi_primary(item_num, item, item_info)
values((select 'ITEM_'||lpad(nvl(max(item_num),0)+1,4,0) from table_multi_primary ),'물파리','바로 앞 라이더에게 날려 라이더를 잠시 뛰울 수 있다.');
-- 두 컬럼의 값이 모두 다른 경우 : 성공
insert into table_multi_primary(item_num,item, item_info)
values((select 'ITEM_'|| lpad(max(substr(item_num,instr(item_num,'_')+1,4))+1,4,0) from table_multi_primary ),'물폭탄 ','일정거리 앞 라이더에게 날려 라이더를 잠시 뛰울 수 있다.');

select * from TABLE_MULTI_PRIMARY;
commit;

--두 컬럼 중 하나의 컬럼만 다른경우
insert into table_multi_primary(item_num,item, item_info)
values('ITEM_0002','물폭탄','일정거리 앞 라이더에게 날려 라이더를 잠시 뛰울 수 있다.');
--두 컬럼 모두 같은 값을 가질 때
insert into table_multi_primary(item_num, item, item_info)
values('ITEM_0002','물파리','당하면 짜증남.');

--둘중 하나라도 null이 추가될 때
insert into table_multi_primary(item_num, item, item_info)
values('ITEM_0002','','당하면 짜증남.');

insert into table_multi_primary(item_num,item_info)
values('ITEM_0003','특정 라이더를 조준 미사일 발사.');

delete from dept
where deptno = 30;
rollback;





