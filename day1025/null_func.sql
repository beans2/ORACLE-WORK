--null��ȯ
--���ڵ带 �߰��� �� �÷��� ������� ������ null�� �Է�.
--varchar2(�ƴϸ� char) : �÷��� ������� �ʰų�, ''�� ���� NULL�̵ȴ�.
--number, date: �÷��� ������� ���� ���.

--������̺��� �����, ����, ���ʽ��� ��ȸ
--��, ���ʽ��� ���� ������� 100���� �����ٰ�

select ENAME, SAL, comm, nvl(COMM,100) from emp;
--���� ���������� �°� ���ٰ�

--�����ȣ���̺��� �Է��� ���� �����ȣ, �õ�, ����, ��, ������ ��ȸ
--��, ������ ���ٸ� '��������'�� ���
select ZIPCODE, SIDO, GUGUN, DONG, nvl(BUNJI,'**��������') BUNJI from ZIPCODE where dong like '����7��%';

--class4_info���̺��� ��ȣ, �̸�, �Է����� ��ȸ�ϼ���
--��, �Է����� ���ٸ� ���糯¥�� ����ϼ���.

select NUM, NAME, nvl(INPUT_DATE,sysdate) from class4_info; 


