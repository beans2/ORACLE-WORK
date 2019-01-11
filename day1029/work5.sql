/* 아래의 조건에 맞는 테이블을 생성하고 적절한 제약사항을 부여한 후 모든 제약조건에 성공하는
경우와 각각의 경우에 따라 실패하는 모든 쿼리문을 작성하세요.
 부서번호, 사원명, 연봉, 이메일, 전화번호,성별,  주소, 입사일, 사원번호를 저장하는 테이블을 생성.
 -제약사항
 	-부서번호는 dept 테이블의 deptno만 입력할 수 있다.  => 외랴ㅐ키
 	-사원명은 가변길이형이고 한글로 10글자 까지 입력가능하며,  => check
 	-연봉은 숫자이고 억단위의 입력이 가능하다. 입력가능 연봉은 2500~8000까지 입력가능  => check
 	-이메일, 전화번호는 없을 수도 있지만 있다면 유일하다 ==> primary key이용,
 	-성별은 남자또는 여자만 입력가능하다.   ==>    check
 	-주소는 없을 수도 있다. ==>  unique
 	-입사일은 날짜형식이며, 추가할 때 입사일이 null이라면 현재 날짜가 입력되어야 한다. ==>default
 	-사원번호는 숫자 4자리이며 null을 허용하지 않고 중복데이터를 저장할 수 없다. ==>primary key
 	-모든 에러상황과 성공상황에 대해 쿼리문을 작성한 후 foreign key에 해당하는 제약사항을
 	  비활성화 시킨 후 삭제까지.

*/

create table work5(
	deptno number(2) constraint fk_ddeptno references DEPT(deptno),
	ename varchar2(30),
	sal number(9) constraint c_sal check(sal between 2500 and 8000),
	email varchar2(50) constraint uk_kemail unique , --유니크
	tel varchar2(13)constraint uk_ktel unique, --유니크
	gender char(6) constraint c_gender check(gender= '남자' or gender = '여자'),
	addr varchar2(100) NULL,
	hiredate date default sysdate,
	empno  number(4)constraint pk_empno primary key  --기본키 empno
	);

commit;
select * from work5;

insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(40,'공쓰',2700,'','','남자','','',1234);
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(20,'선쓰',10000,'','','남자','','',3333);
insert into work5(deptno,ename,sal,email,tel,gender,addr,empno)
values(30,'으쓰',6000,'','','남자','',1236);

select * from user_constraints;
drop table work5;
purge recyclebin;


/*-부서번호는 dept 테이블의 deptno만 입력할 수 있다.  => 외랴ㅐ키
 	-사원명은 가변길이형이고 한글로 10글자 까지 입력가능하며,  => check
 	-연봉은 숫자이고 억단위의 입력이 가능하다. 입력가능 연봉은 2500~8000까지 입력가능  => check
 	-이메일, 전화번호는 없을 수도 있지만 있다면 유일하다 ==> primary key이용,
 	-성별은 남자또는 여자만 입력가능하다.   ==>    check
 	-주소는 없을 수도 있다. ==>  unique
 	-입사일은 날짜형식이며, 추가할 때 입사일이 null이라면 현재 날짜가 입력되어야 한다. ==>default
 	-사원번호는 숫자 4자리이며 null을 허용하지 않고 중복데이터를 저장할 수 없다. ==>primary key
 	-모든 에러상황과 성공상황에 대해 쿼리문을 작성한 후 foreign key에 해당하는 제약사항을
 	  비활성화 시킨 후 삭제까지. */
------------------------------------------------------------------------
--부서번호는 dept 테이블의 deptno만 입력할 수 있다.
--성공
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰',2700,'ggg@naver.com','010-3333-3333','남자','서울시 양천구','',1100);
--실패
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(60,'공쓰',2700,'ggg@naver.com','010-3333-3333','남자','서울시 양천구','',1100);
-------------------------------------------------------------------------
--사원명은 가변길이형이고 한글로 10글자 까지 입력가능하며
--성공
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰',2700,'ggk@naver.com','010-3333-3213','남자','서울시 양천구','',1101);
--실패
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(60,'공쓰공쓰공쓰공쓰공쓰공쓰',2700,'ggo@naver.com','010-3333-3213','남자','서울시 양천구','',1102);
--------------------------------------------------------------------------
--연봉은 숫자이고 억단위의 입력이 가능하다. 입력가능 연봉은 2500~8000까지 입력가능
--성공
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰',2800,'ggo@naver.com','010-3333-1222','남자','서울시 양천구','',1102);

--실패
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰공',10000,'ggl@naver.com','010-3333-1229','남자','서울시 양천구','',1103);
---------------------------------------------------------------------------
--이메일, 전화번호는 없을 수도 있지만 있다면 유일하다
--성공
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰공',10000,'ggr@naver.com','010-3333-7844','남자','서울시 양천구','',1103);

--실패
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰',2800,'ggk@naver.com','010-3333-9523','남자','서울시 양천구','',1103);

---------------------------------------------------------------------------
--성별은 남자또는 여자만 입력가능하다.
--성공
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰공',2800,'ggt@naver.com','010-3333-3338','남자','서울시 양천구','',1105);
--실패
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'공쓰공',2800,'gut@naver.com','010-3333-3339','중성','서울시 양천구','',1106);
---------------------------------------------------------------------------
--입사일은 날짜형식이며, 추가할 때 입사일이 null이라면 현재 날짜가 입력되어야 한다.
--입사일이 NULL일 때
insert into work5(deptno,ename,sal,email,tel,gender,addr,empno)
values(30,'공쓰공',2800,'gut@naver.com','010-3333-3339','여자','서울시 양천구',1106);
--일사일이 입력되었을 때\
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate, empno)
values(30,'공쓰공',2800,'gqt@naver.com','010-3333-3320','남자','서울시 양천구','2018-11-11',1107);
---------------------------------------------------------------------------
--사원번호는 숫자 4자리이며 null을 허용하지 않고 중복데이터를 저장할 수 없다.
--성공
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate, empno)
values(30,'공쓰공',2800,'gqh@naver.com','010-3333-3321','남자','서울시 양천구','2018-11-11',1110);
--실패
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate, empno)
values(30,'공쓰공',2800,'gqh@naver.com','010-3333-3321','남자','서울시 양천구','2018-11-11',1110);
------------------------------------------------------------------------
--foreign key에 해당하는 제약사항을 비활성화.
alter table work5 disable constraint fk_ddeptno;

--제약사항 삭제
alter table work5 drop constraint fk_ddeptno;


