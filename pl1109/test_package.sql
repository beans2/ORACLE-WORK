select * from user_procedures;

--��Ű���� ���Ե� �Լ� ȣ��
select test_pack.get_name('������')
from dual;

--���ν���ȣ��
var age number;
exec test_pack.get_age(1988,:age);
print age;

--����(Random number: ��ǻ�Ͱ� ������ ���� �����Ͽ�
--��ȯ�ϴ� ��.
--dbms_random.value(����, ������ ����) -���ڸ� ��� �Լ�
--1�������� 10������  ���� ���
select trunc(dbms_random.value(1,10))
from dual;
--dbms_random.string('����',��������)- ���ڿ��� ��� �Լ�
--����: u - ������ �빮�� , �� -������ �ҹ���
--a- �빮��,�ҹ��� ȥ��, x- �빮�ڿ� ������ ȥ��,
--p- Ư������ ȥ��
select dbms_random.string('u',10)
from dual;

select dbms_random.string('l',10)
from dual;

select dbms_random.string('a',10)
from dual;

select dbms_random.string('x',10)
from dual;

select dbms_random.string('p',10)
from dual;

select lucky_pack.lucky_num
from dual;

var name varchar2(30);
exec lucky_pack.lucky_name(:name);
print name;

var cur refcursor;
exec test_pack.constraints_search('other_constraints', :cur);

var ssn varchar2(14);

exec lucky_pack.create_ssn('880101','����','������',:ssn);
print ssn;

exec lucky_pack.create_ssn('701111','����','�μ���',:ssn);
print ssn;

select name,ssn,valid_ssn1(ssn) from class4_info
