package kr.or.multi.multiCommunity.dao;

public class ImgDataDaoSqls {
	
	//200416
	//이미지 정보 업데이트.
	public static final String UPDATE_MT_INFO_IMG = "UPDATE imgdata " 
			+ "SET img_name=:imgName, save_img_name=:saveImgName," + 
			"content_type=:contentType, file_length=:fileLength  WHERE img_id=:imgId";
	
	//이미지 이름 가져오기.
	public static final String SELECT_IMG_NAME_BY_IMG_ID = "select img_name from imgdata where img_id=:imgId";
	//public static final String SELTEST = "select img_name from imgdata where img_id=:imgId";
	public static final String SELECT_ALL = "select * from imgdata";
}