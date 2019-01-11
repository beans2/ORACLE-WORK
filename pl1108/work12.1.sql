select uc.constraint_name, utc.column_name ,
(select distinct data_type
 from user_tab_columns
 where user_tab_columns.column_name = utc.column_name) data_type
from user_constraints uc, user_cons_columns utc
where (uc.constraint_name = utc.constraint_name ) and utc.table_name = 'EMP';


/*1. 아래의 Dictionary테이블을 사용하여
user_constraints, user_tab_cols, user_tab_columns
입력된테이블에 대한 제약사항명, 컬럼명, 데이터형
을 조회하는 쿼리문을 작성 .
*/
