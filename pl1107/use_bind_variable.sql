--bind ������ ���
--1. bind���� ����: var[variable] ������ ��������(ũ��)
variable age number;
var name varchar2(30);


set serveroutput on
--2. bind ������ �� �Ҵ�  :������
declare
	name varchar2(30);
begin
	name :='�׽�Ʈ';  
	--3. ���ε庯���� �� �Ҵ�
	:name := name||'�� �ȳ�';
	:age := 20;

	dbms_output.put_line(name || ' '||:name|| ' '|| :age);
end;
/ 


--  4.���ε庯���� �� ���
	print name age
	
