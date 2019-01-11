select uc.constraint_name, utc.column_name ,
(select distinct data_type
 from user_tab_columns
 where user_tab_columns.column_name = utc.column_name) data_type
from user_constraints uc, user_cons_columns utc
where (uc.constraint_name = utc.constraint_name ) and utc.table_name = 'EMP';


/*1. �Ʒ��� Dictionary���̺��� ����Ͽ�
user_constraints, user_tab_cols, user_tab_columns
�Էµ����̺� ���� ������׸�, �÷���, ��������
�� ��ȸ�ϴ� �������� �ۼ� .
*/
