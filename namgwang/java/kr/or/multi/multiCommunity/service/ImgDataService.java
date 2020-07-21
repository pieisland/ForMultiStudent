package kr.or.multi.multiCommunity.service;

import java.util.List;

import kr.or.multi.multiCommunity.dto.ImgData;

public interface ImgDataService {
	public int updateMTInfoImg(ImgData imgdata);
	public ImgData getImgName(String imgid);	
	public List<ImgData> getImgDatas();
}