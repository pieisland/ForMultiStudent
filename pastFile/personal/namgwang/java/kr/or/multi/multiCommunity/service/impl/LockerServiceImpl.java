package kr.or.multi.multiCommunity.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.multi.multiCommunity.dao.LockerDao;
import kr.or.multi.multiCommunity.dto.Locker;
import kr.or.multi.multiCommunity.service.LockerService;

@Service
public class LockerServiceImpl implements LockerService{
	@Autowired
	LockerDao lockerDao;

	//transactional을 붙이면 read only. 아니면 false를 붙여준다.
	@Override
	@Transactional
	public List<Locker> getLockers() { //모든 사물함 정보 가져오기.
		List<Locker> list = lockerDao.selectAll();
		return list;
	}
	
	@Override
	@Transactional
	public Locker addLocker(Locker locker) { //사물함 신청정보 데이터베이스에 넣기.
		lockerDao.insert(locker);
		return locker;
	}

	@Override
	@Transactional
	public int deleteLocker(int lockerid) { //사물함 번호로 데이터베이스에서 삭제하기.
		int ret = lockerDao.deleteById(lockerid);
		return ret;
	}
}
