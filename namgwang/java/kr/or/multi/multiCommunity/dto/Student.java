package kr.or.multi.multiCommunity.dto;

public class Student {
	//student_id VARCHAR(20) NOT NULL PRIMARY KEY,
	//student_name VARCHAR(20),
	//student_join_date DATETIME
	//joindate는 무슨.. 자료형인지 모르겠어요 ㅠㅠ
	
	private String studentId;
	private String studentName;
	//private studentJoinDate; 얘는 도대체 뭐지.. 어떤.. 거를써야되는거지??
	
	public String getStudentId() {
		return studentId;
	}
	
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	public String getStudentName() {
		return studentName;
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
		
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentName=" + studentName + "]";
	}
}
