CREATE SEQUENCE album_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE board_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE book_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE book_guest_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE book_social_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE book_tour_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE evaluation_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE guest_social_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE guesthouse_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE memo_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE pay_source_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE payment_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE reboard_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE refund_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE rooms_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE store_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE tour_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE zip_SEQ
START WITH 1 INCREMENT BY 1 NOCACHE;

create sequence social_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

create sequence file_upload_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

create sequence storeFile_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

drop sequence file_upload_seq;
drop sequence album_SEQ;
drop sequence board_SEQ;
drop sequence book_SEQ;
drop sequence book_guest_SEQ;
drop sequence book_social_SEQ;
drop sequence book_tour_SEQ;
drop sequence evaluation_SEQ;
drop sequence guest_social_SEQ;
drop sequence guesthouse_SEQ;
drop sequence memo_SEQ;
drop sequence pay_source_SEQ;
drop sequence payment_SEQ;
drop sequence reboard_SEQ;
drop sequence refund_SEQ;
drop sequence rooms_SEQ;
drop sequence store_SEQ;
drop sequence tour_SEQ;
drop SEQUENCE zip_SEQ;
drop sequence social_seq;
drop sequence storeFile_seq;
