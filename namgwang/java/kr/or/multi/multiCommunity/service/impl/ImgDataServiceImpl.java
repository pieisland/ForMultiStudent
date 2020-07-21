package kr.or.multi.multiCommunity.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.multi.multiCommunity.dao.ImgDataDao;
import kr.or.multi.multiCommunity.dto.ImgData;
import kr.or.multi.multiCommunity.service.ImgDataService;

@Service
public class ImgDataServiceImpl implements ImgDataService{
	@Autowired
	ImgDataDao imgDataDao;
	
	@Override
	@Transactional
	public int updateMTInfoImg(ImgData imgdata) { //MT이미지 변경.
		int ret = imgDataDao.update(imgdata);
		return ret;
	}
	
	@Override
	@Transactional
	public ImgData getImgName(String imgid) { //MT이미지 이름 가져오기.
		return imgDataDao.getImgName(imgid);
		//ImgData tmp = new ImgData();
		//tmp = imgDataDao.getImgName(imgid);
		//return tmp.getImgName();
		//return imgname;
	}
	
	
	@Override
	@Transactional
	public List<ImgData> getImgDatas(){
		List<ImgData> list = imgDataDao.selectAll();
		return list;
	}
}
