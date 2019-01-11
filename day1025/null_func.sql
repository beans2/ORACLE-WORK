--null변환
--레코드를 추가할 때 컬럼을 명시하지 않으면 null이 입력.
--varchar2(아니면 char) : 컬럼을 명시하지 않거나, ''로 쓰면 NULL이된다.
--number, date: 컬럼을 명시하지 않은 경우.

--사원테이블에서 사원명, 연봉, 보너스를 조회
--단, 보너스가 없는 사원들은 100으로 보여줄것

select ENAME, SAL, comm, nvl(COMM,100) from emp;
--주의 데이터형에 맞게 써줄것

--우편번호테이블에서 입력한 동의 우편번호, 시도, 구군, 동, 번지를 조회
--단, 번지가 없다면 '번지없음'을 출력
select ZIPCODE, SIDO, GUGUN, DONG, nvl(BUNJI,'**번지없음') BUNJI from ZIPCODE where dong like '신정7동%';

--class4_info테이블에서 번호, 이름, 입력일을 조회하세요
--단, 입력일이 없다면 현재날짜를 출력하세요.

select NUM, NAME, nvl(INPUT_DATE,sysdate) from class4_info; 


