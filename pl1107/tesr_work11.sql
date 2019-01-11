select * from EMP;

select func_date('2014-11-11'),func_date('1995-11-11')
from dual;

select func_gender('921111-1355557'),func_gender('921111-8355557')
from dual;

select func_born('921111-1014032'),func_born('921111-1091032'),func_born('921111-1131032'),
func_born('921111-1231032'),func_born('921111-1301032'),func_born('921111-1401032'),func_born('921111-1601032'),
func_born('921111-1901032'),func_born('921111-1941032')
from dual;


