package kr.or.multi.multiCommunity.service;

import kr.or.multi.multiCommunity.dto.Admin;
import java.sql.Timestamp;

public interface AdminService {
	//리턴타입이나 매개변수나 뭘 써야될 지 잘 모르겠어서 그냥 따라하고있음..
	public int updateAdmin(Admin admin);
	public Admin getAdminInfo(String area);
	public int updateDatetime(String area, Timestamp t1, Timestamp t2);
}