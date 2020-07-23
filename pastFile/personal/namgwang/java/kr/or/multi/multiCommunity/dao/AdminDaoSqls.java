package kr.or.multi.multiCommunity.dao;

public class AdminDaoSqls {
	//content 값을 수정한다. area값이 area인 거에 대해서.
	public static final String UPDATE = "UPDATE admin SET content = :content, title = :title, start_date =:startDate, end_date =:endDate WHERE area = :area";
	
	//원하는 영역의 content 값을 가져옵니다.
	public static final String SELECT_CONTENT_BY_AREA = "select content from admin where area = :area";
	public static final String SELECT_ALL = "select * from admin where area = :area";
}