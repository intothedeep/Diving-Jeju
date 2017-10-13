-- member_detail
ALTER TABLE member_detail
	DROP CONSTRAINT FK_member_TO_member_detail; -- member -> member_detail

-- board_list
ALTER TABLE board_list
	DROP CONSTRAINT FK_board_type_TO_board_list; -- board_type -> board_list

-- board
ALTER TABLE board
	DROP CONSTRAINT FK_board_list_TO_board; -- board_list -> board

-- board
ALTER TABLE board
	DROP CONSTRAINT FK_member_TO_board; -- member -> board

-- reboard
ALTER TABLE reboard
	DROP CONSTRAINT FK_board_TO_reboard; -- board -> reboard

-- album
ALTER TABLE album
	DROP CONSTRAINT FK_board_TO_album; -- board -> album

-- memo
ALTER TABLE memo
	DROP CONSTRAINT FK_board_TO_memo; -- board -> memo

-- member
ALTER TABLE member
	DROP CONSTRAINT FK_join_type_TO_member; -- join_type -> member

-- member
ALTER TABLE member
	DROP CONSTRAINT FK_member_type_TO_member; -- member_type -> member

-- member_updown
ALTER TABLE member_updown
	DROP CONSTRAINT FK_member_TO_member_updown; -- member -> member_updown

-- store
ALTER TABLE store
	DROP CONSTRAINT FK_album_TO_store; -- album -> store

-- store
ALTER TABLE store
	DROP CONSTRAINT FK_member_TO_store; -- member -> store

-- store
ALTER TABLE store
	DROP CONSTRAINT FK_store_type_TO_store; -- store_type -> store

-- book_guest
ALTER TABLE book_guest
	DROP CONSTRAINT FK_rooms_TO_book_guest; -- guest_rooms -> book_guest

-- book_guest
ALTER TABLE book_guest
	DROP CONSTRAINT FK_member_TO_book_guest; -- member -> book_guest

-- book_guest
ALTER TABLE book_guest
	DROP CONSTRAINT FK_guesthouse_TO_book_guest; -- guesthouse -> book_guest

-- book_guest
ALTER TABLE book_guest
	DROP CONSTRAINT FK_book_TO_book_guest; -- book -> book_guest

-- evalation
ALTER TABLE evaluation
	DROP CONSTRAINT FK_store_TO_evaluation; -- store -> evalation

-- evalation
ALTER TABLE evaluation
	DROP CONSTRAINT FK_album_TO_evaluation; -- album -> evalation

-- evalation
ALTER TABLE evaluation
	DROP CONSTRAINT FK_book_social_TO_evaluation; -- book_social -> evalation

-- evalation
ALTER TABLE evaluation
	DROP CONSTRAINT FK_book_tour_TO_evaluation; -- book_tour -> evalation

-- evalation
ALTER TABLE evaluation
	DROP CONSTRAINT FK_book_guest_TO_evaluation; -- book_guest -> evalation

-- book
ALTER TABLE book
	DROP CONSTRAINT FK_payment_TO_book; -- payment -> book

-- room_info
ALTER TABLE room_info
	DROP CONSTRAINT FK_room_type_TO_room_info; -- room_type -> room_info

-- room_info
ALTER TABLE room_info
	DROP CONSTRAINT FK_rooms_TO_room_info; -- guest_rooms -> room_info

-- guest_rooms
ALTER TABLE rooms
	DROP CONSTRAINT FK_guesthouse_TO_rooms; -- guesthouse -> guest_rooms

-- breakfast
ALTER TABLE breakfast
	DROP CONSTRAINT FK_guesthouse_TO_breakfast; -- guesthouse -> breakfast

-- tour
ALTER TABLE tour
	DROP CONSTRAINT FK_store_TO_tour; -- store -> tour

-- guesthouse
ALTER TABLE guesthouse
	DROP CONSTRAINT FK_store_TO_guesthouse; -- store -> guesthouse

-- refund
ALTER TABLE refund
	DROP CONSTRAINT FK_payment_TO_refund; -- payment -> refund

-- book_tour
ALTER TABLE book_tour
	DROP CONSTRAINT FK_tour_TO_book_tour; -- tour -> book_tour

-- book_tour
ALTER TABLE book_tour
	DROP CONSTRAINT FK_book_TO_book_tour; -- book -> book_tour

-- guest_social
ALTER TABLE guest_social
	DROP CONSTRAINT FK_guesthouse_TO_guest_social; -- guesthouse -> guest_social

-- payment
ALTER TABLE payment
	DROP CONSTRAINT FK_pay_type_TO_payment; -- pay_type -> payment

-- payment
ALTER TABLE payment
	DROP CONSTRAINT FK_pay_source_TO_payment; -- pay_source -> payment

-- book_social
ALTER TABLE book_social
	DROP CONSTRAINT FK_guest_social_TO_book_social; -- guest_social -> book_social

-- book_social
ALTER TABLE book_social
	DROP CONSTRAINT FK_book_TO_book_social; -- book -> book_social

-- board_type
ALTER TABLE board_type
	DROP CONSTRAINT PK_board_type; -- board_type Primary key

-- board_list
ALTER TABLE board_list
	DROP CONSTRAINT PK_board_list; -- board_list Primary key

-- board
ALTER TABLE board
	DROP CONSTRAINT PK_board; -- board Primary key

-- reboard
ALTER TABLE reboard
	DROP CONSTRAINT PK_reboard; -- reboard Primary key

-- album
ALTER TABLE album
	DROP CONSTRAINT PK_album; -- album Primary key

-- memo
ALTER TABLE memo
	DROP CONSTRAINT PK_memo; -- memo Primary key

-- member
ALTER TABLE member
	DROP CONSTRAINT PK_member; -- member Primary key

-- store
ALTER TABLE store
	DROP CONSTRAINT PK_store; -- store Primary key

-- book_guest
ALTER TABLE book_guest
	DROP CONSTRAINT PK_book_guest; -- book_guest Primary key

-- join_type
ALTER TABLE join_type
	DROP CONSTRAINT PK_join_type; -- join_type Primary key

-- evalation
ALTER TABLE evaluation
	DROP CONSTRAINT PK_evaluation; -- evalation Primary key

-- book
ALTER TABLE book
	DROP CONSTRAINT PK_book; -- book Primary key

-- guest_rooms
ALTER TABLE rooms
	DROP CONSTRAINT PK_rooms; -- guest_rooms Primary key

-- member_type
ALTER TABLE member_type
	DROP CONSTRAINT PK_member_type; -- member_type Primary key

-- room_type
ALTER TABLE room_type
	DROP CONSTRAINT PK_room_type; -- room_type Primary key

-- tour
ALTER TABLE tour
	DROP CONSTRAINT PK_tour; -- tour Primary key

-- guesthouse
ALTER TABLE guesthouse
	DROP CONSTRAINT PK_guesthouse; -- guesthouse Primary key

-- pay_type
ALTER TABLE pay_type
	DROP CONSTRAINT PK_pay_type; -- pay_type Primary key

-- refund
ALTER TABLE refund
	DROP CONSTRAINT PK_refund; -- refund Primary key

-- book_tour
ALTER TABLE book_tour
	DROP CONSTRAINT PK_book_tour; -- book_tour Primary key

-- guest_social
ALTER TABLE guest_social
	DROP CONSTRAINT PK_guest_social; -- guest_social Primary key

-- pay_source
ALTER TABLE pay_source
	DROP CONSTRAINT PK_pay_source; -- pay_source Primary key

-- payment
ALTER TABLE payment
	DROP CONSTRAINT PK_payment; -- payment Primary key2

-- store_type
ALTER TABLE store_type
	DROP CONSTRAINT PK_store_type; -- store_type Primary key

-- book_social
ALTER TABLE book_social
	DROP CONSTRAINT PK_book_social; -- book_social Primary key

-- member_detail
DROP TABLE member_detail 
	CASCADE CONSTRAINTS;
	
-- board_type
DROP TABLE board_type 
	CASCADE CONSTRAINTS;

-- board_list
DROP TABLE board_list 
	CASCADE CONSTRAINTS;

-- board
DROP TABLE board 
	CASCADE CONSTRAINTS;

-- reboard
DROP TABLE reboard 
	CASCADE CONSTRAINTS;

-- album
DROP TABLE album 
	CASCADE CONSTRAINTS;

-- memo
DROP TABLE memo 
	CASCADE CONSTRAINTS;

-- member
DROP TABLE member 
	CASCADE CONSTRAINTS;

-- member_updown
DROP TABLE member_updown 
	CASCADE CONSTRAINTS;

-- store
DROP TABLE store 
	CASCADE CONSTRAINTS;

-- book_guest
DROP TABLE book_guest 
	CASCADE CONSTRAINTS;

-- join_type
DROP TABLE join_type 
	CASCADE CONSTRAINTS;

-- evalation
DROP TABLE evaluation 
	CASCADE CONSTRAINTS;

-- book
DROP TABLE book 
	CASCADE CONSTRAINTS;

-- room_info
DROP TABLE room_info 
	CASCADE CONSTRAINTS;

-- guest_rooms
DROP TABLE rooms 
	CASCADE CONSTRAINTS;

-- member_type
DROP TABLE member_type 
	CASCADE CONSTRAINTS;

-- breakfast
DROP TABLE breakfast 
	CASCADE CONSTRAINTS;

-- room_type
DROP TABLE room_type 
	CASCADE CONSTRAINTS;

-- tour
DROP TABLE tour 
	CASCADE CONSTRAINTS;

-- guesthouse
DROP TABLE guesthouse 
	CASCADE CONSTRAINTS;

-- pay_type
DROP TABLE pay_type 
	CASCADE CONSTRAINTS;

-- refund
DROP TABLE refund 
	CASCADE CONSTRAINTS;

-- book_tour
DROP TABLE book_tour 
	CASCADE CONSTRAINTS;

-- guest_social
DROP TABLE guest_social 
	CASCADE CONSTRAINTS;
-- pay_source
DROP TABLE pay_source 
	CASCADE CONSTRAINTS;

-- payment
DROP TABLE payment 
	CASCADE CONSTRAINTS;

-- store_type
DROP TABLE store_type 
	CASCADE CONSTRAINTS;

-- book_social
DROP TABLE book_social 
	CASCADE CONSTRAINTS;
	
-- file_upload
drop table file_upload
    cascade constraints;