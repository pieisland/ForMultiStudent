package kr.or.multi.multiCommunity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.multi.multiCommunity.dto.Locker;
import kr.or.multi.multiCommunity.service.LockerService;

@Controller
public class LockerController {

	@Autowired
	LockerService lockerService;
	
	//사물함 신청 기능.
	@PostMapping(path="/applyLocker")
	public String applyLocker(@ModelAttribute Locker locker, ModelMap model, 
			HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttr) {
		
		//동시에 동일 좌석을 선택하는 오류를 막기 위해 추가해보겠습니다.
		List<Locker> list = lockerService.getLockers();
		
		int nowId = locker.getLockerId();

		for(int i=0;i<list.size();i++)
		{
			int lid = list.get(i).getLockerId();
			if(nowId == lid)
			{
				//지금 내가 신청하려고 하는 아이디 값이 이미 신청이 완료된 경우
				//화면 상에 처음 로드 될 때는 자리가 있었지만 그사이에 누가 신청한 경우임.
				redirectAttr.addFlashAttribute("lockerApplyPos", -1);

				return "redirect:/locker"; //이거는 꼭 redirect를 해야되구나. 그냥 쓰면 오류남.
			}
		}

		redirectAttr.addFlashAttribute("lockerApplyPos", 1);
		lockerService.addLocker(locker);
		return "redirect:/locker";
	}
	
	//200411
	//신청한 사물함 취소하는 기능.
	@PostMapping(path="/cancelLocker")
	public String cancelLocker(@RequestParam(name="lockerid", required =true) int lockerid) {

		lockerService.deleteLocker(lockerid);
		return "redirect:/locker";
	}
}
