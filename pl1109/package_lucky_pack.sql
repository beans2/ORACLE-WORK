
create or replace package lucky_pack
as
	--����� ��1~45 �� �ϳ�  ��� �Լ�
	function lucky_num return number;  
	
	--���ξ�� ���ν���
	procedure lucky_name(name out varchar2);  
	
	--�������, ����,�̸��� �Է¹޾� �ֹι�ȣ�� �����Ͽ� �����ϴ�
	--out paeameter�� �����ϰ� class4_info���̺� 
	--�߰��ϴ�procedure�� �ۼ� 
--	procedure make_ssn(birth varchar2, gender varchar2, 
--	ssn out varchar2); 
	
	procedure create_ssn(birth varchar2, gender varchar2, name varchar2, 
	ssn out varchar2);
	
	function return_tti(birth number) return varchar2; 
	/*2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
   �߰��ϼ���.*/
	procedure return_year(e_deptno number, o_year out varchar2 ); 
	
	procedure return_year1(e_deptno number, o_year out varchar2 );

	
end;
/
