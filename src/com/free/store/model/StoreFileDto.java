package com.free.store.model;

public class StoreFileDto extends StoreDto {
	private int storeFileSeq;
	private String originalFileName;
	private String storedFileName;
	private String storedPath;
	private String thumbStoredFileName;
	private String thumbStoredPath;
	private int deleted = 0;
	private int type = 0;
	private int isPic = 1;
	private int originalStoreFileSeq; // 리스트 불러 올 때 이것을 기준으로 불러온다. 수정 시 fileSeq가 뒤로 밀리는 것을 잡기 위해서
	private int isTitle = 0;
	
	public int getStoreFileSeq() {
		return storeFileSeq;
	}
	public void setStoreFileSeq(int storeFileSeq) {
		this.storeFileSeq = storeFileSeq;
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
	public int getIsTitle() {
		return isTitle;
	}
	public void setIsTitle(int isTitle) {
		this.isTitle = isTitle;
	}
	public int getOriginalStoreFileSeq() {
		return originalStoreFileSeq;
	}
	public void setOriginalStoreFileSeq(int originalStoreFileSeq) {
		this.originalStoreFileSeq = originalStoreFileSeq;
	}

	
	
	
}
