--�ó�� ����
select * from user_synonyms;


create synonym tmp for table_multi_primary;
--�ó���� ����Ͽ� dml ����
select * from tmp;
insert into tmp
values('ITEM_0003','�ٳ���','�ڿ� ���� ���̴��� ������ �̲�����');


--�ó�� ����
drop synonym tmp;  


