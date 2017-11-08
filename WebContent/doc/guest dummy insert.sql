--게시판 형식 
insert into board_type (btype, btype_name) values (1, '답변게시판');
insert into board_type (btype, btype_name) values (2, '앨범게시판');

--게시판 종류
insert into board_list (bcode, btype, bname) values (0, 1,'공지사항');
insert into board_list (bcode, btype, bname) values (1, 1,'자유게시판');
insert into board_list (bcode, btype, bname) values (2, 1,'게스트하우스후기');
insert into board_list (bcode, btype, bname) values (3, 1,'투어후기');

--회원 가입 소스
	/*
	 * 회원이 가입을 어떻게 했는지
	 * 0. 기타
	 * 1. 내 싸이트 회원가입
	 * 2. gmail
	 * 3. facebook
	 * 4. twitter
	 * 5. kakao
	*/
insert into join_type (jointype, joinsourcename) values (0, '기타');
insert into join_type (jointype, joinsourcename) values (1, '내 싸이트 회원');
insert into join_type (jointype, joinsourcename) values (2, 'gmail');
insert into join_type (jointype, joinsourcename) values (3, 'facebook');
insert into join_type (jointype, joinsourcename) values (4, 'twitter');
insert into join_type (jointype, joinsourcename) values (5, 'kakao');

-- 스토어 가입 타입
	/*
	 * 0. 기타
	 * 1. 게스트하우스
	 * 2. 레저
	 * 3. 둘다
	 * 4. ...
	*/
insert into store_type (storetypeseq, storetypename) values (0, '기타');
insert into store_type (storetypeseq, storetypename) values (1, '게스트하우스');
insert into store_type (storetypeseq, storetypename) values (2, '투어');
insert into store_type (storetypeseq, storetypename) values (3, '둘다');

-- 룸 타입
	/*
	 * 0. 기타
	 * 1. 싱글
	 * 2. 더블
	 * 3. 패밀리
	 * 4. 모임
	 * 5. 도미토리
	 * 
	*/
insert into room_type (roomtype, roomtypename, more)
values (0, '기타', '기타');
insert into room_type (roomtype, roomtypename, more)
values (1, '싱글', '기타');
insert into room_type (roomtype, roomtypename, more)
values (2, '더블', '기타');
insert into room_type (roomtype, roomtypename, more)
values (3, '패밀리', '기타');
insert into room_type (roomtype, roomtypename, more)
values (4, '모임', '기타');
insert into room_type (roomtype, roomtypename, more)
values (5, '도미토리', '기타');


-- 결제 방식
	/*
	 * 0. 기타
	 * 1. 현금
	 * 2. 카드
	 * 3. 무통장
	 */
insert into pay_type (paytype, paytypename) values (0, '기타');
insert into pay_type (paytype, paytypename) values (1, '현금');
insert into pay_type (paytype, paytypename) values (2, '카드');
insert into pay_type (paytype, paytypename) values (3, '무통장');

-- 결제 소스
	/*
	 * 0. 기타
	 * 1. 방예약
	 * 2. 소셜예약
	 * 3. 투어예약
	 * 4. 아침예약
	 * 5. ...
	*/
insert into pay_source (paysourceseq, paysourcename) values (0, '기타');
insert into pay_source (paysourceseq, paysourcename) values (1, '방예약');
insert into pay_source (paysourceseq, paysourcename) values (2, '소셜예약');
insert into pay_source (paysourceseq, paysourcename) values (3, '투어예약');
insert into pay_source (paysourceseq, paysourcename) values (4, '아침예약');
insert into pay_source (paysourceseq, paysourcename) values (5, '픽업');

-- 사용자 분류 회원가입 타입
	/*
	 * 0. 기타
	 * 1. 관리자
	 * 2. 사업자
	 * 3. 회원
	 */
insert into member_type (membertype, membertypename) values (0, '기타');
insert into member_type (membertype, membertypename) values (1, '관리자');
insert into member_type (membertype, membertypename) values (2, '사업자');
insert into member_type (membertype, membertypename) values (3, '회원');



-- pay_type
insert into pay_type values(0, '기타');
insert into pay_type values(1, '현금');
insert into pay_type values(2, '카드');
insert into pay_type values(3, '무통장');
insert into pay_type values(4, '카카오페이');

/*=================================================================*/
-- 여기서부터는 실제 데이터를 입력






