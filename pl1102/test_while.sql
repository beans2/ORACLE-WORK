--�ּ� 0�� ����, �ִ� ���Ǳ��� �ݺ������ϴ� while
set serveroutput on

declare
	i number;
begin
     --1���� 10���� 1�� �����ϴ� ���� ����ϴ� while
     --�ʱⰪ
      
    
     
      /*
     --���ǽ� 
     i :=1;
     while i<=10 loop
     --�ݺ����๮��
     	dbms_output.put_line(i);
     	--������, ���ҽ� - ���ǿ� �����Ͽ� �ݺ��� ���߱� ����
     	i:=i+1;
     end loop;
     */
     
     
     
     
     --0~100 ������ Ȧ���� ����ϴ� while ���� ����ÿ�. 
     i :=1;
     while i<=100 loop
          dbms_output.put_line(i);
		i:=i+2;
	end loop;
	
	
end;
/