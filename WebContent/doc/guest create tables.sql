--테이블에서 컬럼 삭제
--alter table store drop(aseq);

--storeFile
create table storeFile(
	storeFileSeq number,
	storeSeq number,
	originalFileName varchar2(255),
	storedFileName varchar2(255),
	storedPath varchar2(255),
	thumbStoredFileName varchar2(255),
	thumbStoredPath varchar2(255),
	deleted number default 0,
	type number default 0,
	isPic number default 0,
	originalStoreFileSeq number,
	isTitle number default 0
)

-- member_detail
CREATE TABLE member_detail (
	tel     varchar2(100)  NULL, -- 폰 첫 자리
	addr1    varchar2(200) NULL, -- 기본주소
	addr2    varchar2(50)  NULL, -- 상세주소
	zipcode  varchar2(20)  NULL, -- 우편번호
	birth    varchar2(30)  null, -- 생일
	joindate DATE          DEFAULT sysdate, -- 가입일
	email    varchar2(50)  NULL,  -- 이메일
	GENDER   varchar2(3)   null   -- 성별
);

-- board_type
CREATE TABLE board_type (
	btype      number        NOT NULL, -- 게시판형식번호
	btype_name varchar2(100) NOT NULL  -- 게시판형식이름
);

-- board_type
ALTER TABLE board_type
	ADD
		CONSTRAINT PK_board_type -- board_type Primary key
		PRIMARY KEY (
			btype -- 게시판형식번호
		);

-- board_list
CREATE TABLE board_list (
	bcode number        NOT NULL, -- 게시판번호
	btype number        NOT NULL, -- 게시판형식번호
	bname varchar2(100) NOT NULL  -- 게시판이름
);

-- board_list
ALTER TABLE board_list
	ADD
		CONSTRAINT PK_board_list -- board_list Primary key
		PRIMARY KEY (
			bcode -- 게시판번호
		);

-- board
CREATE TABLE board (
	seq     number        NOT NULL, -- 글번호
	email   varchar2(100)  NOT NULL, -- 이메일
	bcode   number        NOT NULL, -- 게시판번호
	name    varchar2(100)  NULL,     -- 작성자
	id      varchar2(100)  NULL,     -- 아이디
	subject varchar2(200) NULL,     -- 제목
	content CLOB          NULL,     -- 내용
	hit     number        DEFAULT 0, -- 조회수
	logtime DATE          DEFAULT sysdate, -- 작성시간
	up      number        DEFAULT 0, -- 추천
	down    number        DEFAULT 0 -- 비추천
);

-- board
ALTER TABLE board
	ADD
		CONSTRAINT PK_board -- board Primary key
		PRIMARY KEY (
			seq -- 글번호
		);

-- reboard
CREATE TABLE reboard (
	rseq  number NOT NULL, -- rseq
	seq   number NOT NULL, -- 글번호
	ref   Number NULL,     -- 그룹번호
	lev   Number NULL,     -- 들여쓰기
	step  Number NULL,     -- 답변정렬
	pseq  Number NULL,     -- 원글번호
	reply number NULL      -- 답변갯수
);

-- reboard
ALTER TABLE reboard
	ADD
		CONSTRAINT PK_reboard -- reboard Primary key
		PRIMARY KEY (
			rseq -- rseq
		);

-- album
CREATE TABLE album (
	aseq         number              NOT NULL, -- 사진게시판 글번호
	seq          number              NOT NULL, -- 글번호
	originPicture varchar2(100)      NULL,     -- 사진원본이름
	savePicture  varchar2(100)       NULL,     -- 사진저장이름
	saveFolder   varchar2(30)        NULL,     -- 저장장소
	ThumbORIGINPICTURE varchar2(100) null,     -- 썸네일원본이름
	ThumbSAVEFOLDER varchar2(30)     null,     -- 썸네일저장폴더
	type         number(1)           NULL      -- 사진가로0세로1
);

-- album
ALTER TABLE album
	ADD
		CONSTRAINT PK_album -- album Primary key
		PRIMARY KEY (
			aseq -- 사진게시판 글번호
		);

-- 프라이머리 키 포린키 등록해야 함 //drop시 자세도 해야함
-- 이건 새로만든 테이블
-- file_upload
create table file_test (
    fileSeq number not null primary key,
    originalfilename varchar2(255),
    storedfilename varchar2(255),
    filesize number,
    uploaddate date default sysdate,
    deleted number(1) default 0,
    email varchar2(50),
    bcode number default 4,
    storedPath varchar2(255),
    thumbStoredFileName varchar2(255),
	thumbStoredPath varchar2(255)
);

-- memo
CREATE TABLE memo (
	mseq     Number        NOT NULL, -- mseq
	seq      number        NULL,     -- 글번호
	id       varchar2(100)  NULL,     -- 아이디
	name     varchar2(100)  NULL,     -- 이름
	mcontent varchar2(500) NULL,     -- 메모내용
	mtime    DATE          DEFAULT sysdate, -- 메모작성시간
	ref      Number        NULL,     -- 그룹번호
	lev      Number        NULL,     -- 들여쓰기
	step     Number        NULL,     -- 답변정렬
	pseq     Number        NULL,     -- 원글번호
	reply    number        NULL,      -- 답변갯수
	mup      number        null,     --메모 추천
);

-- memo
ALTER TABLE memo
	ADD
		CONSTRAINT PK_memo -- memo Primary key
		PRIMARY KEY (
			mseq -- mseq
		);

-- member
CREATE TABLE member (
	email      varchar2(50) NOT NULL, -- 이메일
	name       varchar2(100) NULL,     -- 이름
	pass       varchar2(100) NOT NULL, -- 비밀번호
	id         varchar2(100) NULL,     -- 아이디
	jointype   number(1)    NOT NULL, -- 가입소스번호
	membertype number(1)    NOT NULL,  -- 회원구분번호
	emailConfirm number(1)  NULL  default 0 -- 이메일 인증 여부
);

-- email_auth
create table email_auth (
    email varchar2(50) not null, -- 이메일
    token varchar2(255) not null -- 인증토큰
);

-- member
ALTER TABLE member
	ADD
		CONSTRAINT PK_member -- member Primary key
		PRIMARY KEY (
			email -- 이메일
		);

-- member_updown
CREATE TABLE member_updown (
	checkup   number(1)    DEFAULT 5, -- 남은추천
	checkdown number(1)    DEFAULT 5, -- 남은비추천
	email     varchar2(50) NOT NULL  -- 이메일
);

-- store
CREATE TABLE store (
	storeseq        number        NOT NULL, -- 스토어 등록번호
	loc             varchar2(500) NULL,     -- 스토어좌표
	name            varchar2(100)  NOT NULL, -- 스토어 이름
	accountnum      varchar2(50)  NULL,     -- 통장번호
	biz_license_num varchar2(100) NULL,     -- 사업자등록번호
	email           varchar2(50)  NOT NULL, -- 이메일
	storetypeseq    number(1)     NOT NULL,  -- 스토어구분번호
	evaluation      number(2,1)     not null, -- 가게 평점
	aseq			number    	  not null	-- 앨번 게시판 등록번호
	
);

-- store
ALTER TABLE store
	ADD
		CONSTRAINT PK_store -- store Primary key
		PRIMARY KEY (
			storeseq -- 스토어 등록번호
		);

-- book_guest
CREATE TABLE book_guest (
	bookguesthouseseq number       NOT NULL, -- 게스트하우스 예약번호
	startbookdate     DATE         NULL,     -- 투숙시작날짜
	endbookdate       DATE         NULL,     -- 투숙마지막날짜
	roomseq           number       NOT NULL, -- 객실등록번호
	email             varchar2(50) NOT NULL, -- 이메일
	guestseq          number       NOT NULL, -- 게스트하우스 등록번호
	bookseq           number       NOT NULL  -- 예약번호
);

-- book_guest
ALTER TABLE book_guest
	ADD
		CONSTRAINT PK_book_guest -- book_guest Primary key
		PRIMARY KEY (
			bookguesthouseseq -- 게스트하우스 예약번호
		);

-- join_type
CREATE TABLE join_type (
	jointype       number(1)     NOT NULL, -- 가입소스번호
	joinSourceName varchar2(100) NOT NULL  -- 가입소스명
);

-- join_type
ALTER TABLE join_type
	ADD
		CONSTRAINT PK_join_type -- join_type Primary key
		PRIMARY KEY (
			jointype -- 가입소스번호
		);

-- evalation
CREATE TABLE evaluation (
	eseq              number    NOT NULL, -- 후기번호
	storeseq          number    NOT NULL, -- 스토어 등록번호
	bookguesthouseseq number    NOT NULL, -- 게스트하우스 예약번호
	score             number(1) DEFAULT 5, -- 후기점수
	aseq              number    NULL,     -- 사진게시판 글번호
	booksocialseq     number    NULL,     -- 소셜예약번호
	booktourseq       number    NULL      -- 투어예약번호
);

-- evalation
ALTER TABLE evaluation
	ADD
		CONSTRAINT PK_evaluation -- evalation Primary key
		PRIMARY KEY (
			eseq -- 후기번호
		);

-- book
CREATE TABLE book (
	bookseq     number NOT NULL, -- 예약번호
	whenbook    DATE   DEFAULT sysdate, -- 예약한날짜
	numofpeople number NULL,     -- 예약인원
	payseq      number NOT NULL  -- 결제번호
);

-- book
ALTER TABLE book
	ADD
		CONSTRAINT PK_book -- book Primary key
		PRIMARY KEY (
			bookseq -- 예약번호
		);

-- room_info
CREATE TABLE room_info (
	roomname         varchar2(100) NULL,     -- 객실명
	roomnum          varchar2(100) NULL,     -- 객실번호
	howmanyroom      number        NULL,     -- 방 갯수
	howmanypeople    number        NULL,     -- 수용인원
	roomFloor        number(2)     NULL,     -- 객실층
	roomprice        number        NULL,     -- 객실가격
	roomcontent      CLOB          NULL,     -- 객실설명
	restroomloc      varchar2(30)  NULL,     -- 화장실위치
	roomtype         number        NOT NULL, -- 객실타입
	roomseq          number        NOT NULL  -- 객실등록번호
);

-- rooms
CREATE TABLE rooms (
	roomseq  number    NOT NULL, -- 객실등록번호
	bookable number(1) NULL,     -- 예약가능여부
	guestseq number    NOT NULL  -- 게스트하우스 등록번호
);

-- guest_rooms
ALTER TABLE rooms
	ADD
		CONSTRAINT PK_rooms -- guest_rooms Primary key
		PRIMARY KEY (
			roomseq -- 객실등록번호
		);

-- member_type
CREATE TABLE member_type (
	membertype     number(1)    NOT NULL, -- 회원구분번호
	membertypename varchar2(100) NOT NULL  -- 회원구분명
);

-- member_type
ALTER TABLE member_type
	ADD
		CONSTRAINT PK_member_type -- member_type Primary key
		PRIMARY KEY (
			membertype -- 회원구분번호
		);

-- breakfast
CREATE TABLE breakfast (
	breakfastprice     number        DEFAULT 0, -- 아침가격
	breakfast          number(1)     NULL, -- 아침제공여부
	startBreakfastTime varchar2(100) NULL, -- 아침시작시간
	endBreakfastTime   varchar2(100) NULL, -- 아침끝나는시간
	guestseq           number        NULL  -- 게스트하우스 등록번호
);

-- room_type
CREATE TABLE room_type (
	roomtype     number        NOT NULL, -- 객실타입
	roomTypename varchar2(255) NULL,     -- 객실타입명
	more         varchar2(255) NULL      -- 객실보충설명
);

-- room_type
ALTER TABLE room_type
	ADD
		CONSTRAINT PK_room_type -- room_type Primary key
		PRIMARY KEY (
			roomtype -- 객실타입
		);

-- tour
CREATE TABLE tour (
	tourseq  number        NOT NULL,    -- 투어번호
	tourname    varchar2(100) NULL,     -- 투어명
	tourloc     varchar2(100) NULL,     -- 투어장소
	tourcontent CLOB          NULL,     -- 투어정보
	starttourtime   DATE          NULL,     -- 투어시작시간
	endtourtime     DATE          NULL,     -- 투어끝나는시간
	tourprice   number        NULL,     -- 투어참가비
	more        varchar2(500) NULL,     -- 기타
	storeseq    number        NOT NULL  -- 스토어 등록번호
);

-- tour
ALTER TABLE tour
	ADD
		CONSTRAINT PK_tour -- tour Primary key
		PRIMARY KEY (
			tourseq -- 투어번호
		);

-- guesthouse
CREATE TABLE guesthouse (
	guestseq      number        NOT NULL, -- 게스트하우스 등록번호
	wifi          number(1)     NULL,     -- 인터넷
	cafe          number(1)     NULL,     -- 카페
	eat           number(1)     NULL,     -- 식사
	sleeptime     varchar2(100) NULL,     -- 취침시간
	checkin       varchar2(100) NULL,     -- 체크인
	checkout      varchar2(100) NULL,     -- 체크아웃
	laundryserved number(1)     NULL,     -- 세탁서비스유무
	more          varchar2(500) NULL,     -- 기타
	storeseq      number        NOT NULL  -- 스토어 등록번호
);

-- guesthouse
ALTER TABLE guesthouse
	ADD
		CONSTRAINT PK_guesthouse -- guesthouse Primary key
		PRIMARY KEY (
			guestseq -- 게스트하우스 등록번호
		);

-- pay_type
CREATE TABLE pay_type (
	payType     number(1)    NOT NULL, -- 결제방식
	payTypeName varchar2(100) NOT NULL  -- 결제뱡식명
);

-- pay_type
ALTER TABLE pay_type
	ADD
		CONSTRAINT PK_pay_type -- pay_type Primary key
		PRIMARY KEY (
			payType -- 결제방식
		);

-- refund
CREATE TABLE refund (
	refundseq   number NOT NULL, -- 환불번호
	refundmoney number NOT NULL, -- 환불액
	payseq      number NOT NULL  -- 결제번호
);

-- refund
ALTER TABLE refund
	ADD
		CONSTRAINT PK_refund -- refund Primary key
		PRIMARY KEY (
			refundseq -- 환불번호
		);

-- book_tour
CREATE TABLE book_tour (
	booktourseq number NOT NULL, -- 투어예약번호
	tourseq  number NOT NULL, -- 투어번호
	bookseq     number NOT NULL  -- 예약번호
);

-- book_tour
ALTER TABLE book_tour
	ADD
		CONSTRAINT PK_book_tour -- book_tour Primary key
		PRIMARY KEY (
			booktourseq -- 투어예약번호
		);

-- guest_social
CREATE TABLE guest_social (
	socialseq       number        NOT NULL, -- 소셜번호
	socialname      varchar2(100) NULL,     -- 소셜명
	startSocialTime varchar2(100) NULL,     -- 소셜시작시간
	endSocialTime   varchar2(100) NULL,     -- 소셜끝나는시간
	socialprice     number        NULL,     -- 소셜참가비
	socialloc       varchar2(200) NULL,     -- 소셜장소
	guestseq        number        NOT NULL  -- 게스트하우스 등록번호
);

-- guest_social
ALTER TABLE guest_social
	ADD
		CONSTRAINT PK_guest_social -- guest_social Primary key
		PRIMARY KEY (
			socialseq -- 소셜번호
		);

-- pay_source
CREATE TABLE pay_source (
	paysourceseq  number        NOT NULL, -- 결제소스번호
	paysourcename varchar2(100) NOT NULL  -- 결제소스명
);

-- pay_source
ALTER TABLE pay_source
	ADD
		CONSTRAINT PK_pay_source -- pay_source Primary key
		PRIMARY KEY (
			paysourceseq -- 결제소스번호
		);

-- payment
CREATE TABLE payment (
	payseq       number       NOT NULL, -- 결제번호
	paycontent   varchar(500) NULL,     -- 결제내역
	totalprice   number       NULL,     -- 총결제금액
	payreceived  number       NULL,     -- 받은금액
	payleft      number       NULL,     -- 남은금액
	payType      number(1)    NOT NULL, -- 결제방식
	paysourceseq number       NOT NULL  -- 결제소스번호
);

-- payment
ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment -- payment Primary key2
		PRIMARY KEY (
			payseq -- 결제번호
		);

-- store_type
CREATE TABLE store_type (
	storetypeseq  number(1)    NOT NULL, -- 스토어구분번호
	storetypename varchar2(100) NOT NULL  -- 스토어타입명
);

-- store_type
ALTER TABLE store_type
	ADD
		CONSTRAINT PK_store_type -- store_type Primary key
		PRIMARY KEY (
			storetypeseq -- 스토어구분번호
		);

-- book_social
CREATE TABLE book_social (
	booksocialseq number NOT NULL, -- 소셜예약번호
	socialseq     number NOT NULL, -- 소셜번호
	bookseq       number NOT NULL  -- 예약번호
);

-- book_social
ALTER TABLE book_social
	ADD
		CONSTRAINT PK_book_social -- book_social Primary key
		PRIMARY KEY (
			booksocialseq -- 소셜예약번호
		);

-- member_detail
ALTER TABLE member_detail
	ADD
		CONSTRAINT FK_member_TO_member_detail -- member -> member_detail
		FOREIGN KEY (
			email -- 이메일
		)
		REFERENCES member ( -- member
			email -- 이메일
		);

-- board_list
ALTER TABLE board_list
	ADD
		CONSTRAINT FK_board_type_TO_board_list -- board_type -> board_list
		FOREIGN KEY (
			btype -- 게시판형식번호
		)
		REFERENCES board_type ( -- board_type
			btype -- 게시판형식번호
		);

-- board
ALTER TABLE board
	ADD
		CONSTRAINT FK_board_list_TO_board -- board_list -> board
		FOREIGN KEY (
			bcode -- 게시판번호
		)
		REFERENCES board_list ( -- board_list
			bcode -- 게시판번호
		);

-- board
ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board -- member -> board
		FOREIGN KEY (
			email -- 이메일
		)
		REFERENCES member ( -- member
			email -- 이메일
		);

-- reboard
ALTER TABLE reboard
	ADD
		CONSTRAINT FK_board_TO_reboard -- board -> reboard
		FOREIGN KEY (
			seq -- 글번호
		)
		REFERENCES board ( -- board
			seq -- 글번호
		);

-- album
ALTER TABLE album
	ADD
		CONSTRAINT FK_board_TO_album -- board -> album
		FOREIGN KEY (
			seq -- 글번호
		)
		REFERENCES board ( -- board
			seq -- 글번호
		);

-- memo
ALTER TABLE memo
	ADD
		CONSTRAINT FK_board_TO_memo -- board -> memo
		FOREIGN KEY (
			seq -- 글번호
		)
		REFERENCES board ( -- board
			seq -- 글번호
		);

-- member
ALTER TABLE member
	ADD
		CONSTRAINT FK_join_type_TO_member -- join_type -> member
		FOREIGN KEY (
			jointype -- 가입소스번호
		)
		REFERENCES join_type ( -- join_type
			jointype -- 가입소스번호
		);

-- member
ALTER TABLE member
	ADD
		CONSTRAINT FK_member_type_TO_member -- member_type -> member
		FOREIGN KEY (
			membertype -- 회원구분번호
		)
		REFERENCES member_type ( -- member_type
			membertype -- 회원구분번호
		);

-- member_updown
ALTER TABLE member_updown
	ADD
		CONSTRAINT FK_member_TO_member_updown -- member -> member_updown
		FOREIGN KEY (
			email -- 이메일
		)
		REFERENCES member ( -- member
			email -- 이메일
		);

-- store
ALTER TABLE store
	ADD
		CONSTRAINT FK_member_TO_store -- member -> store
		FOREIGN KEY (
			email -- 이메일
		)
		REFERENCES member ( -- member
			email -- 이메일
		);

-- store
ALTER TABLE store
	ADD
		CONSTRAINT FK_store_type_TO_store -- store_type -> store
		FOREIGN KEY (
			storetypeseq -- 스토어구분번호
		)
		REFERENCES store_type ( -- store_type
			storetypeseq -- 스토어구분번호
		);

-- book_guest
ALTER TABLE book_guest
	ADD
		CONSTRAINT FK_rooms_TO_book_guest -- guest_rooms -> book_guest
		FOREIGN KEY (
			roomseq -- 객실등록번호
		)
		REFERENCES rooms ( -- guest_rooms
			roomseq -- 객실등록번호
		);

-- book_guest
ALTER TABLE book_guest
	ADD
		CONSTRAINT FK_member_TO_book_guest -- member -> book_guest
		FOREIGN KEY (
			email -- 이메일
		)
		REFERENCES member ( -- member
			email -- 이메일
		);

-- book_guest
ALTER TABLE book_guest
	ADD
		CONSTRAINT FK_guesthouse_TO_book_guest -- guesthouse -> book_guest
		FOREIGN KEY (
			guestseq -- 게스트하우스 등록번호
		)
		REFERENCES guesthouse ( -- guesthouse
			guestseq -- 게스트하우스 등록번호
		);

-- book_guest
ALTER TABLE book_guest
	ADD
		CONSTRAINT FK_book_TO_book_guest -- book -> book_guest
		FOREIGN KEY (
			bookseq -- 예약번호
		)
		REFERENCES book ( -- book
			bookseq -- 예약번호
		);

-- evalation
ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_store_TO_evaluation -- store -> evalation
		FOREIGN KEY (
			storeseq -- 스토어 등록번호
		)
		REFERENCES store ( -- store
			storeseq -- 스토어 등록번호
		);

-- evalation
ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_album_TO_evaluation -- album -> evalation
		FOREIGN KEY (
			aseq -- 사진게시판 글번호
		)
		REFERENCES album ( -- album
			aseq -- 사진게시판 글번호
		);

-- evalation
ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_book_social_TO_evaluation -- book_social -> evalation
		FOREIGN KEY (
			booksocialseq -- 소셜예약번호
		)
		REFERENCES book_social ( -- book_social
			booksocialseq -- 소셜예약번호
		);

-- evalation
ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_book_tour_TO_evaluation -- book_tour -> evalation
		FOREIGN KEY (
			booktourseq -- 투어예약번호
		)
		REFERENCES book_tour ( -- book_tour
			booktourseq -- 투어예약번호
		);

-- evalation
ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_book_guest_TO_evaluation -- book_guest -> evalation
		FOREIGN KEY (
			bookguesthouseseq -- 게스트하우스 예약번호
		)
		REFERENCES book_guest ( -- book_guest
			bookguesthouseseq -- 게스트하우스 예약번호
		);

-- book
ALTER TABLE book
	ADD
		CONSTRAINT FK_payment_TO_book -- payment -> book
		FOREIGN KEY (
			payseq -- 결제번호
		)
		REFERENCES payment ( -- payment
			payseq -- 결제번호
		);

-- room_info
ALTER TABLE room_info
	ADD
		CONSTRAINT FK_room_type_TO_room_info -- room_type -> room_info
		FOREIGN KEY (
			roomtype -- 객실타입
		)
		REFERENCES room_type ( -- room_type
			roomtype -- 객실타입
		);

-- room_info
ALTER TABLE room_info
	ADD
		CONSTRAINT FK_rooms_TO_room_info -- rooms -> room_info
		FOREIGN KEY (
			roomseq -- 객실등록번호
		)
		REFERENCES rooms ( -- rooms
			roomseq -- 객실등록번호
		);

-- rooms
ALTER TABLE rooms
	ADD
		CONSTRAINT FK_guesthouse_TO_rooms -- guesthouse -> rooms
		FOREIGN KEY (
			guestseq -- 게스트하우스 등록번호
		)
		REFERENCES guesthouse ( -- guesthouse
			guestseq -- 게스트하우스 등록번호
		);

-- breakfast
ALTER TABLE breakfast
	ADD
		CONSTRAINT FK_guesthouse_TO_breakfast -- guesthouse -> breakfast
		FOREIGN KEY (
			guestseq -- 게스트하우스 등록번호
		)
		REFERENCES guesthouse ( -- guesthouse
			guestseq -- 게스트하우스 등록번호
		);

-- tour
ALTER TABLE tour
	ADD
		CONSTRAINT FK_store_TO_tour -- store -> tour
		FOREIGN KEY (
			storeseq -- 스토어 등록번호
		)
		REFERENCES store ( -- store
			storeseq -- 스토어 등록번호
		);

-- guesthouse
ALTER TABLE guesthouse
	ADD
		CONSTRAINT FK_store_TO_guesthouse -- store -> guesthouse
		FOREIGN KEY (
			storeseq -- 스토어 등록번호
		)
		REFERENCES store ( -- store
			storeseq -- 스토어 등록번호
		);

-- refund
ALTER TABLE refund
	ADD
		CONSTRAINT FK_payment_TO_refund -- payment -> refund
		FOREIGN KEY (
			payseq -- 결제번호
		)
		REFERENCES payment ( -- payment
			payseq -- 결제번호
		);

-- book_tour
ALTER TABLE book_tour
	ADD
		CONSTRAINT FK_tour_TO_book_tour -- tour -> book_tour
		FOREIGN KEY (
			tourseq -- 투어번호
		)
		REFERENCES tour ( -- tour
			tourseq -- 투어번호
		);

-- book_tour
ALTER TABLE book_tour
	ADD
		CONSTRAINT FK_book_TO_book_tour -- book -> book_tour
		FOREIGN KEY (
			bookseq -- 예약번호
		)
		REFERENCES book ( -- book
			bookseq -- 예약번호
		);

-- guest_social
ALTER TABLE guest_social
	ADD
		CONSTRAINT FK_guesthouse_TO_guest_social -- guesthouse -> guest_social
		FOREIGN KEY (
			guestseq -- 게스트하우스 등록번호
		)
		REFERENCES guesthouse ( -- guesthouse
			guestseq -- 게스트하우스 등록번호
		);

-- payment
ALTER TABLE payment
	ADD
		CONSTRAINT FK_pay_type_TO_payment -- pay_type -> payment
		FOREIGN KEY (
			payType -- 결제방식
		)
		REFERENCES pay_type ( -- pay_type
			payType -- 결제방식
		);

-- payment
ALTER TABLE payment
	ADD
		CONSTRAINT FK_pay_source_TO_payment -- pay_source -> payment
		FOREIGN KEY (
			paysourceseq -- 결제소스번호
		)
		REFERENCES pay_source ( -- pay_source
			paysourceseq -- 결제소스번호
		);

-- book_social
ALTER TABLE book_social
	ADD
		CONSTRAINT FK_guest_social_TO_book_social -- guest_social -> book_social
		FOREIGN KEY (
			socialseq -- 소셜번호
		)
		REFERENCES guest_social ( -- guest_social
			socialseq -- 소셜번호
		);

-- book_social
ALTER TABLE book_social
	ADD
		CONSTRAINT FK_book_TO_book_social -- book -> book_social
		FOREIGN KEY (
			bookseq -- 예약번호
		)
		REFERENCES book ( -- book
			bookseq -- 예약번호
		);
		
-- store
alter table store
    add
        constraint FK_album_to_store -- store --> album
        foreign key (
            aseq    -- 사진게시판 등록번호
        )
        references album (    -- guest_social
            aseq    -- 사진게시판 등록번호
        );