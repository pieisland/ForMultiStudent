package kr.or.multi.multiCommunity.dto;

public class ImgData {
	private String imgId;
	private String imgName;
	private String saveImgName;
	private String contentType;
	private long fileLength;
	
	public String getImgId() {
		return imgId;
	}
	
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	
	public String getImgName() {
		return imgName;
	}
	
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	public String getSaveImgName() {
		return saveImgName;
	}
	
	public void setSaveImgName(String saveImgName) {
		this.saveImgName = saveImgName;
	}
	
	public String getContentType() {
		return contentType;
	}
	
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	public long getFileLength() {
		return fileLength;
	}
	
	public void setFileLength(long fileLength) {
		this.fileLength = fileLength;
	}	
}
