drop table survey cascade constraints;
drop sequence survey_seq;

create table "SURVEY" 
    ("ID" number primary key,
    "COUNTRY" varchar2(255) not null,
    "COUNT" number default 0 );
    
create sequence "SURVEY_SEQ" start with 1 increment by 1 maxvalue 99999 noorder nocycle nocache;

insert into "SURVEY"("ID","COUNTRY") values (survey_seq.nextval, '일본');
insert into "SURVEY"("ID","COUNTRY") values (survey_seq.nextval, '미국');
insert into "SURVEY"("ID","COUNTRY") values (survey_seq.nextval, '영국');
insert into "SURVEY"("ID","COUNTRY") values (survey_seq.nextval, '스페인');
commit;

select * from "SURVEY";