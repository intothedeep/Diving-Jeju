-- dtail이 날라가야 member테이블이 삭제가능하다
--foreign key부터 날리자
drop table member_detail;

drop table member;
create table member
(
	id varchar2(16),
	name varchar2(24) not null,
	pass varchar2(16) not null,
	email1 varchar2(16),
	email2 varchar2(20) default 'google.com',
	constraint member_id_pk primary key (id)
);

create table member_detail
(
	id varchar2(16),
	tel1 varchar2(3),
	tel2 varchar2(4),
	tel3 varchar2(4),
	zip1 varchar2(3),
	zip2 varchar2(3),
	addr1 varchar2(100),
	addr2 varchar2(50),
	joindate date default sysdate,
	constraint member_detail_id_fk foreign key (id)
	references member (id)
);

insert all 
	into member (id, name, pass, email1, email2) 
	values ('lion', 'Rion', '123', 'lion', 'hanmail.net') 
	into member_detail (id, tel1, tel2, tel3, zip1, zip2, addr1, addr2) 
	values ('lion', '010', '0000', '0000', '999', '999', 'kakao', '7번방') 
select * from dual;

select * 
from member m, member_detail d
where m.id = d.id
--and m.id = 'lion'
order by 1;

drop sequence zipcode_seq;

create sequence zipcode_seq
start with 100
increment by 1;

drop table zipcode;
create table zipcode
(
	zipcode varchar2(7),
	sido varchar2(30),
	gugun varchar2(50),
	dong varchar2(50),
	bunji varchar2(100),
	seq number primary key	
);