/*도시락 코드를 "L_0000000001"를반환하는 함수*/
create or replace function order_code 
return char
is

begin
 	return concat('OR_',lpad(seq_order.nextval,9,0));
end;
/
