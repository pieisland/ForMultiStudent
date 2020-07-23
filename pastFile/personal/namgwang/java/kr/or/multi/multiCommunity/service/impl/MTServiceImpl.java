package kr.or.multi.multiCommunity.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.multi.multiCommunity.dao.MTDao;
import kr.or.multi.multiCommunity.dto.MT;
import kr.or.multi.multiCommunity.service.MTService;

@Service
public class MTServiceImpl implements MTService{
	@Autowired
	MTDao mtDao;

	@Override
	@Transactional
	public MT addMT(MT mt) { //MT 신청정보 데이터베이스에 넣기.
		mtDao.insert(mt);
		return mt;
	}
	
	@Override
	@Transactional
	public List<MT> getMTs() { //모든 MT 정보 가져오기.
		List<MT> list = mtDao.selectAll();
		return list;
	}
	
	@Override
	@Transactional
	public int deleteMT(String phoneNumber) { //MT 신청 정보 삭제하기.
		int ret = mtDao.deleteByPhoneNumber(phoneNumber);
		return ret;
	}
}
