-- ���ϴ� Ư�� ���̺��� ���ϴ� �÷��� ��� ���ڵ带 ��ȸ

-- class4_info ���̺��� �̸�, ��ȣ, ���� ��ȸ


--select name, num, age from class4_info;

-- ��� �÷��� ��ȸ

-- select * from class4_info;

--�÷� ũ�� ����.
--0 : �����Ͱ� ���ٸ� 0�� ä�� ���
--9 : �����Ͱ� ���� �ϴ� �͸� ���
--���ڿ��� "a���ڼ��� ����"

column num format 0000
column name format a6
col ssn format a7
col age format 999
col vis format 0.000
col email format a10

select * from class4_info;


--�÷��� alias �ο�
SELECT NUM,NAME,INPUT_DATE i_date1,INPUT_DATE i_date2
FROM CLASS4_INFO;






