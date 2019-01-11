--시노님 생성
select * from user_synonyms;


create synonym tmp for table_multi_primary;
--시노님을 사용하여 dml 가능
select * from tmp;
insert into tmp
values('ITEM_0003','바나나','뒤에 오는 라이더가 밟으면 미끄러짐');


--시노님 삭제
drop synonym tmp;  


