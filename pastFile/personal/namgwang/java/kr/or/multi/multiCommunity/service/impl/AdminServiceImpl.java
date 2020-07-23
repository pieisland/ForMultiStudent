package kr.or.multi.multiCommunity.service.impl;

import java.sql.Timestamp;

//import java.util.Date;
//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.multi.multiCommunity.dao.AdminDao;
import kr.or.multi.multiCommunity.dto.Admin;
import kr.or.multi.multiCommunity.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDao adminDao;

	@Override
	@Transactional
	public int updateAdmin(Admin admin) { //글 정보 업데이트.
		int ret = adminDao.update(admin);
		return ret;
	}

	@Override
	@Transactional
	public Admin getAdminInfo(String area) { //글 정보를 area에 따라 가져옴.
		return adminDao.getAdminInfo(area);
	}

	@Override
	@Transactional
	public int updateDatetime(String area, Timestamp t1, Timestamp t2) {
		//없애도 된다만 일단 놔둡니다..
		return 1;
	}
}