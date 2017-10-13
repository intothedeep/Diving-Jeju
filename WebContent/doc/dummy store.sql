-- 나중에 등록할 때 geolocation을 이용해서 좌표를 같이 넣어주는 쿼리문을 만들어야 한다.

----- 달빛에 물들다 
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('dalmul@gmail.com', '달에 물들다', '123', 'dalmul', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('010-1111-3300', '제주특별자치도 제주시 구좌읍 월정1길 79-13', '넙빌레', '63358', sysdate, sysdate, 'dalmul@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '달에 물들다', 'dalmul', 'dalmul@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'dalmul@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '달과 가장 가까운', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '달과 함께', '19:30', '22:00', 15000, '달빛방', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);



-----달 파란 게스트하우스
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('wimidalparan@gmail.com', '달 파란 게스트하우스', '123', 'wimidalparan', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('064-764-4933', '제주특별자치도 서귀포시 남원읍 태위로360번길', '201', '63610', sysdate, sysdate, 'wimidalparan@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '달 파란 게스트하우스', 'wimidalparan', 'wimidalparan@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'wimidalparan@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '달 빛에 물들고 싶은 분이 오세요!', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '달 파란 게스트하우스', '19:30', '22:00', 15000, '파란 달빛이 오는', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);



----- 비앤비틈하우스
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('bnb@gmail.com', '비앤비 틈 게스트하우스', '123', 'bnb', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('010-5555-5555', '제주특별자치도 제주시 구좌읍 행원로7길', '30-4', '63358', sysdate, sysdate, 'bnb@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '달 파란 게스트하우스', 'bnb', 'bnb@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'bnb@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '베스트 오브 베스트 입니다!', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '비앤비 틈 게스트하우스', '19:30', '22:00', 15000, 'bnb룸', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);


------ 악당 토끼 게스트하우스
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('badrabbit@gmail.com', '악당 토끼 게스트하우스', '123', 'badrabbit', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('064-782-3623', '제주특별자치도 제주시 구좌읍 해맞이해안로', '1900', '63363', sysdate, sysdate, 'badrabbit@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '악당토끼 게스트하우스', 'badrabbit', 'badrabbit@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'badrabbit@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '착한 토끼는 안 받음 악당 토끼 환영', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '악당토끼를 잡는다!', '19:30', '22:00', 15000, 'badrabbit룸', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);
    
----- 엘 마르 게스트 하우스
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('elmar@gmail.com', '엘 마르 게스트하우스', '123', 'elmar', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('064-782-3623', '제주특별자치도 서귀포시 표선면 표선당포로', '17', '63629', sysdate, sysdate, 'elmar@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '엘 마르 게스트하우스', 'elmar', 'elmar@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'elmar@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '오오오올!!! 엘 마르!! 와우!', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '엘 마르 언덕에서 꺽어보자!', '19:30', '22:00', 15000, 'el mar 언덕', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);


-------- 올레 벗 게스트하우스
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('olle-friends@gmail.com', '올레 벗 게스트하우스', '123', 'olle-friends', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('010-5555-4555', '제주특별자치도 서귀포시 안덕면 소기왓로', '11', '63533', sysdate, sysdate, 'olle-friends@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '올레 벗 게스트하우스', 'olle-friends', 'olle-friends@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'olle-friends@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '벗이 오는 곳 뜻이 오는 곳', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '뜻이 통하겠지?', '19:30', '22:00', 15000, '벗벗벗벗벗', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);
    
    
----- 티벳 풍경 게스트하우스
select board_seq.nextval from dual;
select album_seq.nextval from dual;
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('tibet@gmail.com', '티벳 풍경 게스트하우스', '123', 'tibet', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email, gender)
    values ('070-4234-5836', '제주특별자치도 서귀포시 안덕면 난드르로21번길', '10', '63533', sysdate, sysdate, 'tibet@gmail.com', '남')
select * from dual;

insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '티벳 풍경 게스트하우스', 'tibet', 'tibet@gmail.com', '여기 좋아용!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 4, 0, 0)
    
    into album (aseq, seq, savepicture, savefolder, type, originpicture, thumboriginpicture, thumbsavepicture, thumbsavefolder)
    values (album_seq.currval, board_seq.currval, 'savepicture', 'savefolder', '1', 'originpicture', 'thumboriginpicture', 'thumbsavepicture', 'thumbsavefolder')

    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, evaluation, aseq)
    values (store_seq.currval, '','123-123123-123', '1-111111-111', 'tibet@gmail.com', 1, 5, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '조용하지 않아 여긴!', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '고승이 되어보자', '19:30', '22:00', 15000, '히말라야', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);
================================================================================================
delete from member_detail
where email = 'nubville@gmail.com';
delete from rooms
where guestseq = 11;
delete from guest_social
where guestseq = 7;
delete from guesthouse
where storeseq = 11;
delete from store
where email = 'nubville@gmail.com';
delete from member
where id = 'nub';

TRUNCATE TABLE room_info;
Truncate table rooms;
Truncate table guest_social;
Truncate table breakfast;
Truncate table guesthouse;
Truncate table store;




-----------------------------------------------------------------------------------------------
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('이메일', '이름', '비번', '아이디', 1, 2)
    
    into member_detail (tel1, tel2, tel3, addr1, addr2, zipcode, birth, joindate, email)
    values ('010', '1234', '1234', '주소', '상세주소', '63611', '2017/05/09', sysdate, 'email')
    
    into store (storeseq, loc, name, accountnum, biz_license_num, email, storetypeseq)
    values (store_seq.currval, '좌표', '가게이름', '통장번호', '사업자번호', '이메일', 스토어구분번호)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '체크인', '체크아웃', 세탁여부, '기타', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (5000, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '소셜명', '19:30', '22:00', 15000, '하우스 카페', guesthouse_seq.currval)
select * from dual;

insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guest_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('객실명', '8', 1, 인원수, 층수, 가격, '상세설명', '화장실위치', 객실타입, rooms_seq.currval);
 
 
 ------------------------------------------------------
 
update member_detail
set tel = '010-9000-9300'
where email = 'nubville@gmail.com';



----------------------------------------------------------------------------------------------
select store_seq.nextval from dual;
select guesthouse_seq.nextval from dual;
select social_seq.nextval from dual;
select album_seq.nextval from dual;

insert all
    into member(email, name, pass, id, jointype, membertype)
    values ('dalmul@gmail.com', '달에 물들다', '123', 'dalmul', 1, 2)
    
    into member_detail (tel, addr1, addr2, zipcode, birth, joindate, email)
    values ('010-1111-3300', '제주특별자치도 제주시 구좌읍 월정1길 79-13', '넙빌레', '63358', sysdate, sysdate, 'dalmul@gmail.com')
    
    into store (storeseq, loc, accountnum, biz_license_num, email, storetypeseq, aseq)
    values (store_seq.currval, '123-123123-123', '1-111111-111', 'moon@gmail.com', 1, album_seq.currval)
    
    into guesthouse (guestseq, wifi, cafe, eat, sleeptime, checkin, checkout, laundryserved, more, storeseq)
    values (guesthouse_seq.currval, 1, 1, 1, '22:00', '15:00', '10:00', 1, '달과 가장 가까운', store_seq.currval)
    
    into breakfast (breakfastprice, breakfast, startbreakfasttime, endbreakfasttime, guestseq)
    values (0, 1, '8:00', '10:00', guesthouse_seq.currval)
    
    into guest_social (socialseq, socialname, startsocialtime, endsocialtime, socialprice, socialloc, guestseq)
    values (social_seq.currval, '달과 함께', '19:30', '22:00', 15000, '달빛방', guesthouse_seq.currval)
select * from dual;

insert
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert   
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('도미토리 8인', '8', 1, 1, 1, 20000, '리모델링', '방 내 공용', 5, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert    
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('아기가 생겨요', '1', 2, 2, 2, 100000, '연인 룸', '방내', 2, rooms_seq.currval);
    
insert    
    into rooms (roomseq, bookable, guestseq)
    values (rooms_seq.nextval, 1, guesthouse_seq.currval);
insert 
    into room_info (roomname, roomnum, howmanyroom, howmanypeople, roomfloor, roomprice, roomcontent, restroomloc, roomtype, roomseq)
    values ('가족과 함께', '3', 2, 4, 3, 150000, '가족룸', '화장실 2개', 3, rooms_seq.currval);
    