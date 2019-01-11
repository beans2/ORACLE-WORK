select * from user_procedures;
drop function plus;

--�ֹι�ȣ�� ��ȿ�� ����
select	check_ssn('880101-123456'),check_ssn('88010-11234567'),check_ssn('8801011234567'),check_ssn('880101-1234567')
from dual;


select * from CLASS4_INFO ;

update class4_info
set	ssn='880101-123456'
where num=6;

insert into class4_info(num, name, ssn,email)
values(8,'������','88010-11234567','jung@naver.com');

commit;

--class4_info���̺��� ��ȣ, �̸�, �ֹι�ȣ,
--�ֹι�ȣ�� ���� üũ�� �Ͽ� ��� ���ڵ带 ��ȸ

select num, name, ssn, check_ssn(ssn), get_age(ssn)
from class4_info;
--�ֹι�ȣ�� ��ȿ�� �� ���̸� ���ϴ� �Լ� ���
select get_age('880101-123456'),get_age('88010-11234567'),get_age('8801011234567'),
get_age('880101-1234567'),get_age('000101-1234567'),get_age('880101-5234567')
,get_age('990101-9234567')
from dual;

insert into class4_info(num, name, ssn)
values(8,'���ӽ�','890307-5234567');
insert into class4_info(num, name, ssn)
values(9,'����','030307-4234567');
insert into class4_info(num, name, ssn)
values(9,'������','990307-9234567');
commit;
--��ȣ, �̸�, �ֹι�ȣ, ���� ��ȸ
--���̴� �ֹι�ȣ�� ��ȿ���� ���� ���̸� ����ϰ�
--��ȿ���� �ʴٸ� 0�� ����Ѵ�.
select num,name, ssn, get_age(ssn)
from class4_info;

--�̸��� ��ȿ�� ����

select valid_email('@.'),valid_email('a@b.c'),valid_email('aaaaaaaab.c'),valid_email('aaa@aaaaaabc'),valid_email('aaaaa@aaaaab.com')
from dual;


--��ȣ, �̸�, �̸���, �̸����� ��ȿ�� ��ȸ
select num,name,email,valid_email(email)
from class4_info;

--1~9999999���� 1�� �����ϴ� ������ �ۼ�
create sequence seq_item
increment by 1
start with 1
maxvalue 9999999;
cache 10
nocycle;

select seq_item.nextval
from dual;


create table test_func(
	num char(10),
	name varchar2(30),
	input_date date default sysdate,
	constraint pk_test_func primary key(num)
);
--�Լ��� ȣ���Ͽ� ������ ������ ��ȣ�� ���
--�Ű����� ���� �Լ��� ȣ���� ������ ()�� ������ �ʾƵ� �ȴ�.

select item_num
from dual;

--���ڿ������� �����ϴ� ��ȣ�� ����Ͽ� Table�� �߰�
insert into test_func(num,name)
values(item_num,'����ö');

select * from test_func;


select valid_ssn('921111-1351117')from  dual;

select num, name, ssn, valid_ssn1(ssn)
from CLASS4_INFO;



select * from user_procedures
where object_type like 'P%';

var num number;
exec proc_plus(11,11,:num);
print num

var insert_msg varchar2(30);
execute insert_cpemp2(1111,'������',3000,:num,:insert_msg);

print num;
print insert_msg;

