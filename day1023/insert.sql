-- 테이블에 레코드(row) 추가
-- 컬럼명을 생략하는 경우.

insert into class4_info values(1, '정택성', 26 , 1.3, '930101-1234567', 'jung@test.com', '남', sysdate);

commit;

insert into class4_info values(2, '930101-1234567', 26 , 1.3, '택성', 'jung@test.com', '남', sysdate);

commit;

--컬럼을 명시하여 추가


insert into class4_info(num, name, age, vis, ssn, email, gender, input_date) values(3, '이재현', 29 , 1.3, '900101-1234567', 'lee@test.com', '남', sysdate);


--컬럼의 정의 순서는 테이블에 정의된 컬럼의 순서와 다르게 작성 가능


insert into class4_info(gender,name,email,num,age,vis,ssn,input_date) values('남','오영근','oh@test.com',4,28,1.8,'910101-1234567',sysdate);

commit;

--컬럼을 생략하면 null이 입력된다.

insert into class4_info(num, name, age) values(5, '김정운', 25);

commit;


