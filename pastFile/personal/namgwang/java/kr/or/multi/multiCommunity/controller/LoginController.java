package kr.or.multi.multiCommunity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.multi.multiCommunity.dto.Student;
import kr.or.multi.multiCommunity.service.MTService;
import kr.or.multi.multiCommunity.service.StudentService;

@Controller
public class LoginController {
	@Autowired
	StudentService studentService;

	@Autowired
	MTService mtService;
	
	@GetMapping(path="/loginform")
	public String loginform() {
		return "loginform";
	}
	
	@GetMapping(path="/loginform2")
	public String loginform2() {
		return "loginform2";
	}

	//로그인 정보가 일치하면 세션에 로그인 정보를 저장한다.
	@PostMapping(path="/login")
	//RequestParam에서 받은 passwd를 String passwd에 넣는다.
	public String login(@RequestParam(name="nowpage", required =true) String nowpage,
			@RequestParam(name="studentid", required =true) String studentid, 
			@RequestParam(name="studentname", required =true) String studentname,
			HttpSession session, RedirectAttributes redirectAttr,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		List<Student> list = studentService.getStudents();
	
		//이게 studentid로 받는게 말이 안맞으니 따로 만드는 게 맞는가 싶기도 하고.
		//관리자는 db에 안들어가는게 걸리네요.
		if(studentid.equals("admin") && studentname.equals("관리자")) {
			session.setAttribute("isLogin", "true"); //로그인이 됐다는 것을 저장.
			session.setAttribute("loginedStudentId", "admin"); //로그인한 학생의 아이디 정보.
			session.setAttribute("loginedStudentName", "관리자"); //로그인한 학생의 이름.

			return "redirect:/" + nowpage;
		}
		
		String sid;
		String sname;
		for(int i=0;i<list.size();i++)
		{
			sid = list.get(i).getStudentId();
			sname = list.get(i).getStudentName();
			/*System.out.println(studentid);
			System.out.println(studentname);
			System.out.println(sid);
			System.out.println(sname);*/
			
			if(studentid.equals(sid) && studentname.equals(sname)){
				//일치하는 하생이 있다는 것을 데이터베이스 내에서 확인했습니다.
				session.setAttribute("isLogin", "true"); //로그인이 됐다는 것을 저장.
				session.setAttribute("loginedStudentId", sid); //로그인한 학생의 아이디 정보.
				session.setAttribute("loginedStudentName", sname); //로그인한 학생의 이름.

				//일치하면 저장하고 바로 리턴하면 되겠죠?
				return "redirect:/" + nowpage;
			}
		}
		
		//session.setAttribute("isLogin", "false");
		//바로 리턴되지 않았으면 에러 메시지를 저장해두는걸로 하자.
		redirectAttr.addFlashAttribute("errorMessage", "등록된 사용자 정보가 없습니다.");	
		//그렇구나 모든 경우에 리턴을 해야되니까 그런 거였구나.
		return "redirect:/loginform";
	}
	
	//로그아웃하면 로그인 정보를 삭제한다.
	@GetMapping(path="/logout")
	public String login(HttpSession session) {
		session.removeAttribute("isLogin");
		session.removeAttribute("loginedStudentId");
		session.removeAttribute("loginedStudentName");
		return "redirect:/index";
	}
	
	//팝업창떄문에 테스트해보고있습니다. 안되면 지울거에요.
	@PostMapping(path="/login2")
	public String login2(@RequestParam(name="studentid", required =true) String studentid, 
			@RequestParam(name="studentname", required =true) String studentname,
			HttpSession session, RedirectAttributes redirectAttr,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		List<Student> list = studentService.getStudents();
		String sid;
		String sname;
		for(int i=0;i<list.size();i++)
		{
			sid = list.get(i).getStudentId();
			sname = list.get(i).getStudentName();
			/*System.out.println(studentid);
			System.out.println(studentname);
			System.out.println(sid);
			System.out.println(sname);*/
			
			if(studentid.equals(sid) && studentname.equals(sname)){
				//일치하는 하생이 있다는 것을 데이터베이스 내에서 확인했습니다.
				session.setAttribute("isLogin", "true"); //로그인이 됐다는 것을 저장.
				session.setAttribute("loginedStudentId", sid); //로그인한 학생의 아이디 정보.
				session.setAttribute("loginedStudentName", sname); //로그인한 학생의 이름.
				
				//일치하면 저장하고 바로 리턴하면 되겠죠?
				return "redirect:/locker";
			}
		}
		
		//session.setAttribute("isLogin", "false");
		//바로 리턴되지 않았으면 에러 메시지를 저장해두는걸로 하자.
		redirectAttr.addFlashAttribute("errorMessage", "등록된 사용자 정보가 없습니다.");	
		//그렇구나 모든 경우에 리턴을 해야되니까 그런 거였구나.
		return "redirect:/loginform2";
	}
}
