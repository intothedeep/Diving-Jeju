package com.free.board.all.model;

import com.free.board.admin.model.BoardDto;

public class AlbumDto extends BoardDto {
	private int aseq;
	private int seq;
	private String originalFileName;
	private String storedFileName;
	private String storedPath;
	private String thumbStoredFileName;
	private String thumbStoredPath;
	private int deleted = 0;
	private int type = 0;
	private int isPic = 1;
	private int originalFileAseq; // 리스트 불러 올 때 이것을 기준으로 불러온다. 수정 시 fileSeq가 뒤로 밀리는 것을 잡기 위해서
	private int storeSeq;
	private int titlePic = 0;
	
	public int getTitlePic() {
		return titlePic;
	}
	public void setTitlePic(int titlePic) {
		this.titlePic = titlePic;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public int getOriginalFileAseq() {
		return originalFileAseq;
	}
	public void setOriginalFileAseq(int originalFileAseq) {
		this.originalFileAseq = originalFileAseq;
	}
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public String getStoredPath() {
		return storedPath;
	}
	public void setStoredPath(String storedPath) {
		this.storedPath = storedPath;
	}
	public String getThumbStoredFileName() {
		return thumbStoredFileName;
	}
	public void setThumbStoredFileName(String thumbStoredFileName) {
		this.thumbStoredFileName = thumbStoredFileName;
	}
	public String getThumbStoredPath() {
		return thumbStoredPath;
	}
	public void setThumbStoredPath(String thumbStoredPath) {
		this.thumbStoredPath = thumbStoredPath;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getIsPic() {
		return isPic;
	}
	public void setIsPic(int isPic) {
		this.isPic = isPic;
	}
	
	


}
