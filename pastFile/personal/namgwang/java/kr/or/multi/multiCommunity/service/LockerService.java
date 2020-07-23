package kr.or.multi.multiCommunity.service;

import java.util.List;
import kr.or.multi.multiCommunity.dto.Locker;

public interface LockerService {
	public List<Locker> getLockers();
	public Locker addLocker(Locker locker);
	public int deleteLocker(int lockerid);
}