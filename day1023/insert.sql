-- ���̺� ���ڵ�(row) �߰�
-- �÷����� �����ϴ� ���.

insert into class4_info values(1, '���ü�', 26 , 1.3, '930101-1234567', 'jung@test.com', '��', sysdate);

commit;

insert into class4_info values(2, '930101-1234567', 26 , 1.3, '�ü�', 'jung@test.com', '��', sysdate);

commit;

--�÷��� ����Ͽ� �߰�


insert into class4_info(num, name, age, vis, ssn, email, gender, input_date) values(3, '������', 29 , 1.3, '900101-1234567', 'lee@test.com', '��', sysdate);


--�÷��� ���� ������ ���̺� ���ǵ� �÷��� ������ �ٸ��� �ۼ� ����


insert into class4_info(gender,name,email,num,age,vis,ssn,input_date) values('��','������','oh@test.com',4,28,1.8,'910101-1234567',sysdate);

commit;

--�÷��� �����ϸ� null�� �Էµȴ�.

insert into class4_info(num, name, age) values(5, '������', 25);

commit;


