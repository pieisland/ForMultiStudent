package kr.or.multi.multiCommunity.dao;

public class LockerDaoSqls {
	public static final String SELECT_LOCKER_ID =  "SELECT locker_id FROM locker";
	
	//''를 쓰는건지 안쓰는건지는 모르겠어요..
	//public static final String SELECT_UNAVAILABLE_LOCKER_ID = "SELECT locker_id FROM locker WHERE locker_available='false'";
	
	public static final String SELECT_ALL = "SELECT * FROM locker";
	
	//200411
	public static final String DELETE_BY_LOCKER_ID = "DELETE FROM locker WHERE locker_id=:lockerId";
}