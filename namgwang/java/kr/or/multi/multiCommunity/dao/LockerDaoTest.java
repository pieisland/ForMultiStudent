package kr.or.multi.multiCommunity.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

import kr.or.multi.multiCommunity.config.ApplicationConfig;
import kr.or.multi.multiCommunity.dto.Locker;

//테스트 한거라서 실제로 사용하지는 않아요.
public class LockerDaoTest {

	public static void main(String args[]) {
		//데이터 입력하는 예제
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class); 
		LockerDao lockerDao = ac.getBean(LockerDao.class);
		Locker locker = new Locker();
		locker.setLockerId(26);
		locker.setStudentId("2015112612");
		locker.setLockerAvailable("false"); //이제 넣을거니까..
		locker.setLockerSecondStudentId("x");
		int cnt = lockerDao.insert(locker);
		System.out.println(cnt);
		
		
		//모든 데이터 출력하는 예제.
		/*
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
		LockerDao lockerDao =ac.getBean(LockerDao.class);

		List<Locker> list = lockerDao.selectAll();
		
		for(Locker locker: list) {
			System.out.println(locker);
		}*/
		
	}
}
