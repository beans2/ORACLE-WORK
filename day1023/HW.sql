/*
����
1. �Ʒ��� ���� �����͸� ������ �� �ִ� ���̺��� �����Ѵ�.
 ��ȣ - �����̸� 5�ڸ����� �Է�
 �̸� - �����������̸� �ѱ۷� 10�ڱ��� �Է�.
 ���� - ���������̸� ����� 1�� �Է�.
 �ּ� - �����������̸� �ѱ۷� 120�� �����Է�.
 ���� - �����̸� 3�ڱ��� �Է�
 �Է��� - �����Ͱ� �߰��Ǵ� ���� �Ϸ� �Է�.
*/
CREATE table CLASS4(
num number(5),
name varchar2(30),
gender char(1),
adress varchar2(360),
grade number(3),
input_date date);

/*
2. �� ���̺� �Ʒ��� ���� �����͸� �߰��Ѵ�.
  1, '����ȣ', 'M', '����� ������ ���ﵿ',64,����
  2, '������', 'M', '����� ���α� ������',87,����
  3, '������', 'F', '����� �������� ���ǵ���',97,����
  4, 'Ȳ�缺', 'M', '����� ���۱� �󵵵�',100,����
  5, '���缮', 'M', '��⵵ ������ ���뱸',100,����
*/
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
1, '����ȣ', 'M', '����� ������ ���ﵿ',64,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
2, '������', 'M', '����� ���α� ������',87,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
3, '������', 'F', '����� �������� ���ǵ���',97,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
4, 'Ȳ�缺', 'M', '����� ���۱� �󵵵�',100,sysdate);
INSERT
INTO CLASS4(num, name, gender, adress, grade, input_date)
VALUES(
5, '���缮', 'M', '��⵵ ������ ���뱸',100,sysdate);
commit;

/*
3. �� �Էµ� ������ �� ���� ��ȣ�� 3���̸� ������ 97���� �����
    �̸��� '�׽�Ʈ'�� ������ 'M'���� �����Ѵ�.
*/
UPDATE CLASS4
SET NAME = '�׽�Ʈ', GENDER = 'M'
WHERE NUM = 3 AND GRADE = 97;

commit;

/*
4. ���� �����Ϳ��� �̸��� '���缮'�� ����Ǽ����� 'F'�� �����Ѵ�.
*/
UPDATE CLASS4
SET GENDER = 'F'
WHERE NAME = '���缮';

/*
5. 4���� �۾��� ����Ѵ�.
*/
ROLLBACK;
/*
6. ��ȣ�� 1���̸� �̸��� �������� ����� �����͸� �����Ѵ�.
*/
DELETE FROM CLASS4
WHERE NAME = '������';

commit;

/*
7. ��� �����͸� �����Ѵ�.
*/

TRUNCATE TABLE CLASS4;

/*
8. ���̺��� �����Ѵ�.
*/

DROP TABLE CLASS4;

/*
9. �������� ����.
*/

PURGE RECYCLEBIN;
