
create or replace package lucky_pack
as
	--행운의 수1~45 중 하나  얻는 함수
	function lucky_num return number;  
	
	--귀인얻기 프로시저
	procedure lucky_name(name out varchar2);  
	
	--생년월일, 성별,이름을 입력받아 주민번호를 생성하여 설정하는
	--out paeameter에 설정하고 class4_info테이블에 
	--추가하는procedure을 작성 
--	procedure make_ssn(birth varchar2, gender varchar2, 
--	ssn out varchar2); 
	
	procedure create_ssn(birth varchar2, gender varchar2, name varchar2, 
	ssn out varchar2);
	
	function return_tti(birth number) return varchar2; 
	/*2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
   추가하세요.*/
	procedure return_year(e_deptno number, o_year out varchar2 ); 
	
	procedure return_year1(e_deptno number, o_year out varchar2 );

	
end;
/
