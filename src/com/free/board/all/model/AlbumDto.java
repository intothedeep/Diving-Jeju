package com.free.board.all.model;

import com.free.board.admin.model.BoardDto;

public class AlbumDto extends BoardDto {
	private int aseq;
	private int seq;
	private String originPicture;
	private String savePicture;
	private String saveFolder;
	private String thumbORIGINPICTURE;
	private String thumbSAVEPICTURE;
	private String thumbSAVEFOLDER;
	private int type;

	public String getThumbORIGINPICTURE() {
		return thumbORIGINPICTURE;
	}
	public void setThumbORIGINPICTURE(String thumbORIGINPICTURE) {
		this.thumbORIGINPICTURE = thumbORIGINPICTURE;
	}
	public String getThumbSAVEPICTURE() {
		return thumbSAVEPICTURE;
	}
	public void setThumbSAVEPICTURE(String thumbSAVEPICTURE) {
		this.thumbSAVEPICTURE = thumbSAVEPICTURE;
	}
	public String getThumbSAVEFOLDER() {
		return thumbSAVEFOLDER;
	}
	public void setThumbSAVEFOLDER(String thumbSAVEFOLDER) {
		this.thumbSAVEFOLDER = thumbSAVEFOLDER;
	}
	public String getOriginPicture() {
		return originPicture;
	}
	public void setOriginPicture(String originPicture) {
		this.originPicture = originPicture;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
	}
	public String getSavePicture() {
		return savePicture;
	}
	public void setSavePicture(String savePicture) {
		this.savePicture = savePicture;
	}
	public String getSaveFolder() {
		return saveFolder;
	}
	public void setSaveFolder(String saveFolder) {
		this.saveFolder = saveFolder;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
