/*
숙제
1. 아래와 같은 데이터를 저장할 수 있는 테이블을 생성한다.
 번호 - 숫자이며 5자리까지 입력
 이름 - 가변길이형이며 한글로 10자까지 입력.
 성별 - 고정길이이며 영어로 1자 입력.
 주소 - 가변길이형이며 한글로 120자 까지입력.
 점수 - 숫자이며 3자까지 입력
 입력일 - 데이터가 추가되는 현재 일로 입력.
*/
CREATE table CLASS4(
num number(5),
name varchar2(30),
gender char(1),
adress varchar2(360),
grade number(3),
input_date date);

/*
2. 위 테이블에 아래와 같은 데이터를 추가한다.
  1, '김준호', 'M', '서울시 강남구 역삼동',64,오늘
  2, '김준현', 'M', '서울시 구로구 개봉동',87,오늘
  3, '오나미', 'F', '서울시 영등포구 여의도동',97,오늘
  4, '황재성', 'M', '서울시 동작구 상도동',100,오늘
  5, '유재석', 'M', '경기도 수원시 영통구',100,오늘
*/
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
1, '김준호', 'M', '서울시 강남구 역삼동',64,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
2, '김준현', 'M', '서울시 구로구 개봉동',87,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
3, '오나미', 'F', '서울시 영등포구 여의도동',97,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
4, '황재성', 'M', '서울시 동작구 상도동',100,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
5, '유재석', 'M', '경기도 수원시 영통구',100,sysdate);
commit;

/*
3. 위 입력된 데이터 중 에서 번호가 3번이며 점수가 97점인 사람의
    이름을 '테스트'로 성별을 'M'으로 변경한다.
*/
UPDATE CLASS4
SET NAME = '테스트', GENDER = 'M'
WHERE NUM = 3 AND GRADE = 97;

commit;

/*
4. 위의 데이터에서 이름이 '유재석'인 사람의성별을 'F'로 변경한다.
*/
UPDATE CLASS4
SET GENDER = 'F'
WHERE NAME = '유재석';

/*
5. 4번의 작업을 취소한다.
*/
ROLLBACK;
/*
6. 번호가 1번이며 이름이 김준현인 사람의 데이터를 삭제한다.
*/
DELETE FROM CLASS4
WHERE NAME = '김준현';

commit;

/*
7. 모든 데이터를 절삭한다.
*/

TRUNCATE TABLE CLASS4;

/*
8. 테이블을 삭제한다.
*/

DROP TABLE CLASS4;

/*
9. 휴지통을 비운다.
*/

PURGE RECYCLEBIN;
