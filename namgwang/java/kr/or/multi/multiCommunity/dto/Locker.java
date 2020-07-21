package kr.or.multi.multiCommunity.dto;

public class Locker
{	
	private Integer lockerId;
	private String studentId;
	private String lockerAvailable;
	private String lockerSecondStudentId;
	
	public Integer getLockerId() {
		return lockerId;
	}

	public void setLockerId(Integer lockerId) {
		this.lockerId = lockerId;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getLockerAvailable() {
		return lockerAvailable;
	}

	public void setLockerAvailable(String lockerAvailable) {
		this.lockerAvailable = lockerAvailable;
	}

	public String getLockerSecondStudentId() {
		return lockerSecondStudentId;
	}

	public void setLockerSecondStudentId(String lockerSecondStudentId) {
		this.lockerSecondStudentId = lockerSecondStudentId;
	}

	@Override
	public String toString() {
		return "Locker [locker_id=" + lockerId + ", student_id=" + studentId + ", locker_available="
				+ lockerAvailable + ", locker_second_student_id=" + lockerSecondStudentId + "]";
	}
}