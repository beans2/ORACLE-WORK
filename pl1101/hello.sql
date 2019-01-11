set serveroutput on
declare
	--변수선언
begin
	--코드작성
	dbms_output.put_line('안녕 PL/SQL');
     dbms_output.put_line('오늘은 목요일');
     dbms_output.put('내일은 금요일');
     --put으로만 출력이 종료되면 출력내용이 출력되지 않는다.
     dbms_output.put_line('모레는 퇼');
     --dbms_output.put_line('');
end;
/