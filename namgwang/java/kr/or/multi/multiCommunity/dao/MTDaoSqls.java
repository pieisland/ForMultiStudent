package kr.or.multi.multiCommunity.dao;

public class MTDaoSqls {
	public static final String SELECT_ALL = "SELECT * FROM mt";
	
	//200415
	//primary key가 phone number인 건 이상하긴 하지만.. 나중에 고친다고 생각하고 일단 만들어 둠.
	public static final String DELETE_BY_PHONE_NUMBER = "DELETE FROM mt WHERE phone_number=:phoneNumber";
}
