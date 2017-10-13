alter table member_detail add(birth varchar2(30));


alter table album add(	
	ORIGINPICTURE varchar2(100),
	ThumbORIGINPICTURE varchar2(100),
	ThumbSAVEPICTURE varchar2(100),
	ThumbSAVEFOLDER varchar2(30)
);

alter table album drop(
	originpicture
);

alter table modify(
    originpicture clob
);
