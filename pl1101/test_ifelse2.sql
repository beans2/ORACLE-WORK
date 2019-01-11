--고객등급, 상품명, 가격을 입력받아 처리하는 PL/SQL을 작성
--출력은 고객등급이 '특별 또는 일반'인 경우에만 프로그램이 실행되어 연산을 수행합니다
--특별고객은 상품할인을 상품가의 50%, 일반고객은 상품할인을 
--상품가의 30%로 계산하여 출력


set serveroutput on
set verify off

accept rank prompt '고객등급을 입력: '
accept name prompt '상품이름을 입력: '
accept price prompt '가격을 입력: '

declare
	rank varchar(40):= '&rank';
	name varchar(40):= '&name';
	price number:= &price;
	sale number :=0.3;
	
begin
	if rank in('특별','일반') then
		if rank = '특별' then
			sale:=0.5;
		end if;
		dbms_output.put_line('고객님의 등급은:  '|| rank || '이고'||name||' 상품의 가격은'|| (price-(price*sale))||'입니다');
	end if;
	dbms_output.put_line('고객등급을 특별 이나 일반으로 선택해주세요');
	
end;
/


