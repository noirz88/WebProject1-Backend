
insert into testnotice values(seq.NEXTVAL, '아아메2', '화장2', '메이크ㄹ업2', sysdate, 0 )

select * from testnotice


CREATE SQUENCE testnotice START WITH 1 INCREMENT BY 1

 SELECT seq.CURRVAL FROM DUAL;
 
 create sequence seq increment by 1 start with 1;
﻿ALTER TABLE testnotice MODIFY COLUMN seq INT auto_increment﻿


delete from testnotice where nname='유리'

select * from testproduct
select * from m_member
select * from testmember

drop table testmember

create table testmember (
m_id varchar2(60) primary key,
m_pw varchar2(100) not null,
m_name varchar2(20) not null,
m_phone varchar2(100),
zipcode varchar2(100),
address1 varchar2(100),
address2 varchar2(100),
job varchar2(100),
regdate date)

insert into testmember values ('admin', '1234', '관리자', '010-9862-9982', '4532', '경기도 고양시', '덕양구', '학생', sysdate)

