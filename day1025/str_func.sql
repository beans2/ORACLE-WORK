--���ڿ� �Լ� ���.
select 'oracle���̴�    '||length('oeacle')||'��' LENGTH,length('�׽�Ʈ')
from dual;

--������̺��� �����, ������� ���ڼ��� ��ȸ
select  ename, length(ename)
from emp;

--������̺��� ������� 4�� �̻��� ����� ������� ��ȸ
select ename
from  emp
where length(ename) >= 4;

-- �빮�� :upper
select  upper('Test'),upper('�׽�ƮAbcdE')
from dual;

--�ҹ��� :lower
select lower('Test')
from dual;

--������̺��� ������� 'scott'�� ����� �����ȣ, �����, �Ի���, ������ ��ȸ�ϼ���.
select EMPNO, ENAME, HIREDATE, SAL
from emp
where ename = upper('scott');
--where lower(ename) = 'scott';

--������̺��� ������� ��� �ҹ��ڷ� ��ȸ
select lower(ENAME)
from emp;

--�ε��� ��� :instr(���ڿ�, ã�� ���ڿ�)
select instr('AbcdeF','A'),instr('AbcdeF','F'),instr('AbcdeF','c'),
	instr('AbcdeF','k')  --k�� �������� �ʱ� ������ 0�� ���
from dual;

create table CLASS4_INFO(
	NUM NUMBER(4),
	NAME VARCHAR2(15),
	SSN CHAR(3),
	AGE NUMBER(3),
	EYE NUMBER(3,2),
	EMAIL VARCHAR2(50),
	GENDER CHAR(3),
	INPUT_DATE DATE
	);

insert into class4_info(num,name,email)
values(6,'�׽�Ʈ','test@kr');

insert into class4_info(num,name,email)
values(7,'�׽�Ʈ1','test.kr');
commit;
select * from CLASS4_INFO  ;

select num,name,email,instr(email,'@'),instr(email,'.')
from class4_info;

--���ڿ� �ڸ��� : substr(���ڿ�, �����ε���, �ڸ����ڼ�)
select  instr('Abcdefg','d')
from dual;

select  substr('Abcdefg',4,3),substr('Abcdefg',2,5),substr('Abcdefg',1)
from dual;

--class4_info���̺��� ��ȣ, �̸�, e-mail�÷��� ���� �ּҸ� ��ȸ
-- test@test.com
-- �������ּҸ��� ��ȸ
select NUM, NAME, substr(EMAIL,1,instr(email,'@')-1) MAILADD,
substr(EMAIL, instr(email,'@')+1) DOMAINADD
from class4_info;

--�յ� ��������: trim, �հ������� : ltrim, �ް������� : rtrim
select '['||trim('   A BC   ')||']' TRIM,
'['||ltrim('   A BC   ')||']' LTRIM,
'['||rtrim('   A BC   ')||']' RTRIM,
trim('a' from 'aaaaaaaaaaaaOracleaaaaaaaaa') "deleting a"
from dual;

--ù���ڸ� �빮�ڷ� ���� : initcap('���ڿ�')
select initcap('oracle java jsp jQuery SCOTT') INITCAP
from dual;

select initcap(ename)
from emp;

--���ڿ� ���̱� : concap('���ڿ�','���Ϲ��ڿ�')
select concat(concat('ABC','DEF'),'GHI'),'ABC'||'DEF'||'GHI' from dual;

--���ڿ� ä���
--�������� ä���: lpad('���ڿ�',���ڸ���,'ä�﹮�ڿ�')
select lpad('ABCDE',7,'$'),lpad('ABCDE',10,0) from dual;

--�����ʤ����� ä���: rpad('���ڿ�',���ڸ���,'ä�﹮�ڿ�')
select rpad('ABCDE',10,'��'),rpad('ABC',10,'#') from dual;












