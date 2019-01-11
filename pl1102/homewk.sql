/* 8.1��
--1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
--   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������
--   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� ��4Ű�θ���
--  100���� ��� ���ΰ��ȴ�.
--  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
--  1, ������, ����� ������ ���ﵿ, 5Ű��, ����
--  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
--  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
--  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
--  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ����
--���
--   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, �⺻���, �ѿ��
*/
set serveroutput on

declare
	type class4_record is record(num number , name varchar2(20), addr varchar2(200), km number, sudan varchar2(10));
	type class4_table is table of class4_record index by binary_integer;
	class4_tab class4_table;
	price number :=0;
	sumprice number :=0;
begin
	class4_tab(1).num := 1;
	class4_tab(1).name := '������';
	class4_tab(1).addr := '����� ������ ���ﵿ';
	class4_tab(1).km := 5;
	class4_tab(1).sudan := '����';

	class4_tab(2).num := 2;
	class4_tab(2).name := '����ö';
	class4_tab(2).addr := '��õ�� ������ ������';
	class4_tab(2).km := 20;
	class4_tab(2).sudan := '����ö';

	class4_tab(3).num := 3;
	class4_tab(3).name := '������';
	class4_tab(3).addr := '��õ�� ���� ����';
	class4_tab(3).km := 16;
	class4_tab(3).sudan := '����ö';

	class4_tab(4).num := 4;
	class4_tab(4).name := '�ڿ���';
	class4_tab(4).addr := '����� ���Ǳ� ��õ��';
	class4_tab(4).km := 10;
	class4_tab(4).sudan := '����ö';

	class4_tab(5).num := 5;
	class4_tab(5).name := '���ü�';
	class4_tab(5).addr := '����� ���빮�� ���빮��';
	class4_tab(5).km := 8;
	class4_tab(5).sudan := '����';
	dbms_output.put_line('----------------------------------work8_1-------------------------------');
	dbms_output.put_line('��ȣ, �̸�,         �ּ�,             �Ÿ�,     �������,   �⺻���,   �ѿ��');
	for i in 1 .. class4_tab.count loop
		if class4_tab(i).sudan = '����' then
			price:=1200;
		else
			price:=1250;
		end if;
		sumprice:=price;

		if class4_tab(i).km > 13 then
			sumprice := price + ceil((class4_tab(i).km-10)/4)*100;
		end if;
		dbms_output.put_line(class4_tab(i).num||'     '||class4_tab(i).name||'  '||rpad(class4_tab(i).addr,24,' ')||'  '||
		rpad(class4_tab(i).km,3,' ')||'      '||rpad(class4_tab(i).sudan,12,' ')||'   '||price||'    '||sumprice);
	end loop;
	dbms_output.put_line('-------------------------------------------------------------------------');
end;
/


/*
-- ���� 2.
--  �л����� ������ ó���ϴ� PL/SQL�ۼ�.
--   ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� �� ������ ���ִ� record��
--  ����� �Ʒ��� �����͸� �Է��� ��
--  �ݺ����� ����Ͽ�  ����,����� ó���ϴ� PL/SQL �ۼ�
-- 1, ������, 80,81
--  2, ����ö, 94,80
--  3, ������, 97,96
--  4, �ڿ���, 86,92
--  5, ���ü�, 76,99
--
-- ���
--   ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,���
--  .
--  .
--  .
--  �ڹ��ְ����� [xx] ����Ŭ �ְ����� [xxx]


set serveroutput on

declare
	type score_record is record(num number, name varchar2(20), oracle_score number, java_score number);
	type score_table is table of score_record index by binary_integer;
	score_tab score_table;
	score_sum number:=0;
	java_score_max number :=0;
	oracle_score_max number:=0;
begin
    score_tab(1).num := 1;
    score_tab(1).name := '������';
    score_tab(1).oracle_score := 80;
    score_tab(1).java_score := 81;

    score_tab(2).num := 2;
    score_tab(2).name := '����ö';
    score_tab(2).oracle_score := 94;
    score_tab(2).java_score := 80;

    score_tab(3).num := 3;
    score_tab(3).name := '������';
    score_tab(3).oracle_score := 97;
    score_tab(3).java_score := 96;

    score_tab(4).num := 4;
    score_tab(4).name := '�ڿ���';
    score_tab(4).oracle_score := 86;
    score_tab(4).java_score := 92;

    score_tab(5).num := 5;
    score_tab(5).name := '���ü�';
    score_tab(5).oracle_score := 76;
    score_tab(5).java_score := 99;

    dbms_output.put_line(' ��ȣ,   �̸�,    ����Ŭ����,   �ڹ�����  ,  ����  ,  ��� ');

    for i in 1.. score_tab.count loop
    	score_sum := score_tab(i).oracle_score+ score_tab(i).java_score;
    	dbms_output.put_line(score_tab(i).num ||'     '||score_tab(i).name||'       '|| score_tab(i).oracle_score||'           '
    						||score_tab(i).java_score||'          '||score_sum|| '       '||score_sum/2);
    	if oracle_score_max < score_tab(i).oracle_score then
    	     oracle_score_max := score_tab(i).oracle_score;
    	elsif java_score_max < score_tab(i).java_score then
    	     java_score_max := score_tab(i).java_score;	
    	end if;
    end loop;
        dbms_output.put_line('�ڹ� �ְ�����: ['||java_score_max||'] ����Ŭ �ְ� ���� ['||oracle_score_max||']');
end;
/
*/

/*
3. �Ʒ��� �����͸� ó���ϴ�  PL/SQL�ۼ�
    "�̸�, �ֹι�ȣ, ����, ����"�� ������ �� �ִ� ���̺���
    �����ϰ� �Ʒ��� �����͸� ä���.
   ������, 880101-1234567  
   ����ö, 890101-1234567  
   ������, 011231-3234567   
   �ڿ���, 920101-2234567    
   ���ü�, 020420-4234567   
   ���� �����͸� ����Ͽ� 
   ��ȣ,�ֹι�ȣ,����, ������ �����ִ�  PL/SQL�� �ۼ��ϼ���.

set serveroutput on

declare
	type person_record is record(name varchar2(20), personnum varchar(15));
	type person_table is table of person_record index by binary_integer;
	person_tab person_table;
	age number := 0;
	gender varchar2(6);
	
begin
	person_tab(1).name:='����ö';
	person_tab(1).personnum:='890101-1234567';   

    person_tab(2).name:='������';
	person_tab(2).personnum:='011231-3234567';   
	
	person_tab(3).name:='�ڿ���';
	person_tab(3).personnum:='920101-2234567';   
	
	person_tab(4).name:='���ü�';
	person_tab(4).personnum:='020420-4234567'; 
	
	dbms_output.put_line(' ��ȣ,   �ֹι�ȣ,	     ����,	  ���� ');
	for i in 1..person_tab.count loop
		if substr(person_tab(i).personnum,instr(person_tab(i).personnum,'-')+1,1) in('1','2') then
			age := to_char(sysdate,'yy')-substr(person_tab(i).personnum,1,2)+100+1;
		else 
			age := to_char(sysdate,'yy')-substr(person_tab(i).personnum,1,2);		
		end if;
		if substr(person_tab(i).personnum,instr(person_tab(i).personnum,'-')+1,1) in('1','3') then
			gender := '����';
		else
			gender := '����';
		end if;	
		dbms_output.put_line(person_tab(i).name||'    '||person_tab(i).personnum||'       '||age||'         '||gender);	
	end loop; 

end;
/
*/


