--상품명, 고객등급, 가격을 입력받아 고객등급이 '특별'이라면 상품가격의 30%할인된
--가격으로 출력하세요. 특별이 아니라면 '일반'
-- xx등급 고객님 정가는 xxx원 입니다. 
--"특별인 경우에는 아래의 메시지 출력"
-- 상품가격 xx원 할인가 xx원
set serveroutput on
set verify off

accept name prompt '상품명  입력 : '
accept rank prompt '고객등급("일반" or "특별")  입력 : '
accept price prompt '가격  입력 : '
declare
	name varchar(60):='&name';
	rank char(6):='&rank';
	price number(7):=&price;
begin

	dbms_output.put_line(rank||' 등급 고객님'||name||' 상품의 정가는'|| price||'원입니다');
	if rank = '특별' then
		dbms_output.put_line(' 상품가격 : '||price||'원 할인가 : '||price*0.7||' 원');
	end if;
end;
/    

