--for:���۰� ���� �Ѵ��� �˼� �ְ� 1�� �����ϴ�  �ݺ���
set serveroutput on

declare
 	ssum number(5);
 	msg varchar2(300);
begin  
	ssum := 0;
	/*
	for i in 1 .. 10 loop
		dbms_output.put_line('i='||i);
	end loop;
	--for�� index �� �����ϴ� ������ declare ���� ����� 
	--������ ������� �ʴ´�.
	dbms_output.put_line('for ����'||i);
	*/
	--1~100������ ���� ���Ͽ� ���: 5050
    /* 
 	for i in 1..100 loop
 		ssum := ssum +i;  
 	end loop;
 	dbms_output.put_line(ssum);
     */
	--1~9���� 1�� �����ϴ� for �ۼ��Ͽ� ���.
    	--������(���� for)
    	--�ٱ� for�� �ε����� ���� ����ϱ� ���� ��
    	--���� for�� �ΉH���� �ܿ� �������� ���� ����ϱ� ���� ��
     dbms_output.put_line('----------------������ ����----------------');
     for i in 2..9 loop  
     	dbms_output.put_line(i||'��');
     	
     	for j in 1..9 loop
     		dbms_output.put(i||'*'||j||'='||i*j||' ');
     		dbms_output.put_line('');
     	end loop; 
     	dbms_output.put_line('------------------');
     end loop;
     dbms_output.put_line('--------------������ ��----------------');
     
     
     
     msg:= '������ �ݿ��� �Դϴ�.';
     /*--for�� ����Ͽ� ���� ���ھ� �߶󳻼� ���
     	reverse�� ����ϸ� �ݺ��Ǵ� �ε����� �Ųٷ� ����Ѵ�.
     ��
     ��
     ��
     
     ��
     ��
     ��
     
     ��
     ��
     ��
     */ 
     for i in 1..length(msg) loop
     	dbms_output.put_line(substr(msg,i,1));
     	if mod(i,4)=0 then
     		dbms_output.put_line('.'); 
     	end if;
     end loop;	
    
     
end;
/
