/*1. 입사년도를 입력받아 근속년수가 10년 이상이면 '장기근속'
  그렇지 않으면 '단기근속'이라는 메세지를 반환하는 함수 작성.
*/
--create or replace function  func_date(hiredate date)return varchar2
--is
--	c_result varchar2(12) := '단기근속'; 
--	c_sysdate varchar2(4):= to_char(sysdate,'yyyy');
--	c_hiredate varchar2(4) := to_char(hiredate,'yyyy');
--begin
--   if c_sysdate-c_hiredate >=10 then
--    	c_result := '장기근속'; 
--   end if; 
--   return c_result;
--end;
--/

/*
2.  주민번호를 입력받아 성별을 반환하는 함수 작성     (남자면 홀수, 여자면 짝수)
*/
--create or replace function  func_gender(ssn varchar2)
--return varchar2
--is
--	g_result varchar2(6); 
--	ssn_8 char(1);
--begin
--		  ssn_8 := substr (ssn,8,1);
--          if check_ssn(ssn) = 'success' then
--          		if ssn_8  in( 1,3,5,7,9)  then
--          			g_result := '남자';
--          		else
--          			g_result :='여자';
--          		end if;
--          end if;
--
--   return g_result;
--end;
--/


/*
3. 주민번호를 입력받아 출생지역을 반환하는 함수 작성
   출생지역은  880101-1xx1111 에서 xx 두자리 이고      
   아래의 표와 같다. 
  	서울시 : 00~08
	부산시 : 09~12
	인천시 : 13~15
	경기도 : 16~25
	강원도 : 26~34
	충청도 : 35~47
	전라도 : 48~66
	경상도 : 67~92
	제주도 : 93~95
 */
create or replace function  func_born(ssn varchar2)
return varchar2
is
	b_result char(9); 
	ssn_910 char(2);
begin
    ssn_910 := substr (ssn,9,2);
          if check_ssn(ssn) = 'success' then
          		if ssn_910  between 0 and 08  then
          			b_result := '서울시';
         		elsif ssn_910 between 9 and 12 then
         			b_result := '부산시'; 
         		elsif ssn_910 between 13 and 15 then
         			b_result := '인천시'; 
         		elsif ssn_910 between 16 and 25 then
         			b_result := '경기도';
         		elsif ssn_910 between 26 and 34 then
         			b_result := '강원도'; 
         		elsif ssn_910 between 35 and 47 then
         			b_result := '충청도';  
         		elsif ssn_910 between 48 and 66 then
         			b_result := '전라도'; 
         		elsif ssn_910 between 67 and 92 then
         			b_result := '경상도';
         		elsif ssn_910 between 93 and 95 then
         			b_result := '제주도';  			
          		end if;
         end if;

   return b_result;
end;
/
   

 
