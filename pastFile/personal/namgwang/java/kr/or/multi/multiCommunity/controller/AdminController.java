package kr.or.multi.multiCommunity.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.io.File;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.multi.multiCommunity.dto.Admin;
import kr.or.multi.multiCommunity.dto.Locker;
import kr.or.multi.multiCommunity.dto.MT;
import kr.or.multi.multiCommunity.dto.ImgData;
import kr.or.multi.multiCommunity.service.AdminService;
import kr.or.multi.multiCommunity.service.ImgDataService;
import kr.or.multi.multiCommunity.service.LockerService;
import kr.or.multi.multiCommunity.service.MTService;


@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	LockerService lockerService;
	
	@Autowired
	MTService mtService;
	
	@Autowired
	ImgDataService imgDataService;
	
	//200621
	@PostMapping(path="/updatemtdate")
	public String updateMtDate(
			@RequestParam(name="area", required=true) String area,
			@RequestParam(name="title", required=true) String title,
			@RequestParam(name="content", required=true) String content,
			@RequestParam(name="startDate", required=true) String sdate, 
			@RequestParam(name="endDate", required=true) String edate,
			@RequestParam(name="startTime", required=true) String stime,
			@RequestParam(name="endTime", required=true) String etime,
			@RequestParam(name="file") MultipartFile file,
			@RequestParam(name="pastimg", required =true) String pastimg) {

		String startDatetime = sdate + " " + stime + ":00";
		String endDatetime = edate + " " + etime + ":00";
		
		System.out.println(startDatetime);
		System.out.println(endDatetime);

		Timestamp t1 = Timestamp.valueOf(startDatetime);
		Timestamp t2 = Timestamp.valueOf(endDatetime);
		
		Admin myad = adminService.getAdminInfo(area);
		myad.setArea(area);
		myad.setTitle(title);
		myad.setContent(content);
		myad.setStartDate(t1);
		myad.setEndDate(t2);
		
		adminService.updateAdmin(myad);
		
		//200627 이미지 수정 관련
		//이부분.. 나중에 실제로 할 때는 그 위치를 얻어내서 동일하게 해주면 되는걸까?
		String path = "C:/Users/pieis/eclipse-workspace/multiCommunity/src/main/webapp/resources/images/";
		String path2= "C:/Users/pieis/eclipse-workspace/multiCommunity/src/main/webapp/";

		//이미지를 올렸다면
		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="")
		{
			new File(path2 + pastimg).delete();	
					
			System.out.println(path2 + pastimg);

			String id = "mtInfoImg";
			String name = file.getOriginalFilename();
			String savename = path + name; //굳이 쓸 일이 있을지는 모르겠음. 
			String contentType = file.getContentType();
					
					//데이터베이스에서 파일 길이를 int형으로 만들었는데 딱히 오류는 안났다.
			long fileLength = file.getSize();
			ImgData imgdata = new ImgData();
			imgdata.setImgId(id);
			imgdata.setImgName(name);
			imgdata.setSaveImgName(savename);
			imgdata.setContentType(contentType);
			imgdata.setFileLength(fileLength);
			imgDataService.updateMTInfoImg(imgdata);
						
			try(      		
			   		FileOutputStream fos = new FileOutputStream(savename);
			    		InputStream is = file.getInputStream();
			){
				int readCount = 0;
				byte[] buffer = new byte[1024];
				while((readCount = is.read(buffer)) != -1){
			    	fos.write(buffer,0,readCount);
			    }
			}catch(Exception ex){
				throw new RuntimeException("file Save Error");
			}
		}
		
		return "redirect:/mt";
	}
	
	//200623
	@PostMapping(path="/updateLockerInfo")
	public String updateLockerInfo(
			@RequestParam(name="area", required=true) String area,
			@RequestParam(name="title", required=true) String title,
			@RequestParam(name="startDate", required=true) String sdate, 
			@RequestParam(name="endDate", required=true) String edate,
			@RequestParam(name="startTime", required=true) String stime,
			@RequestParam(name="endTime", required=true) String etime) {

		String startDatetime = sdate + " " + stime + ":00";
		String endDatetime = edate + " " + etime + ":00";
		
		Timestamp t1 = Timestamp.valueOf(startDatetime);
		Timestamp t2 = Timestamp.valueOf(endDatetime);

		Admin myad = adminService.getAdminInfo(area);
		myad.setArea(area);
		myad.setTitle(title);
		myad.setStartDate(t1);
		myad.setEndDate(t2);

		adminService.updateAdmin(myad);
		
		return "redirect:/locker";
	}	
	

	//관리자가 모든 등록된 사물함 정보를 삭제.
	@PostMapping(path="/deleteAllLocker")
	public String deleteAllLocker(ModelMap model)
	{
		List<Locker> list = lockerService.getLockers();//모든 locker를 가져온다.

		for(int i=0; i<list.size(); i++)
		{
			int lid = list.get(i).getLockerId();
			lockerService.deleteLocker(lid);
		}
		
		return "redirect:/locker";	
	}
	
	//관리자가 모든 MT 신청 정보를 삭제.
	@PostMapping(path="/deleteAllMT")
	public String deleteAllMT(ModelMap model) {
		
		List<MT> list = mtService.getMTs();//모든 locker를 가져온다.
		
		for(int i=0; i<list.size(); i++)
		{
			String phoneNumber = list.get(i).getPhoneNumber();
			mtService.deleteMT(phoneNumber);
		}
		
		return "redirect:/mt";	
	}
	
	//200416
	//MT이미지를 수정.
	@PostMapping(path="/uploadMTimg")
	public String uploadMTimg(@RequestParam("file") MultipartFile file, 
			HttpServletRequest request, ModelMap model,
			@RequestParam(name="pastimg", required =true) String pastimg) {
		
		//이부분.. 나중에 실제로 할 때는 그 위치를 얻어내서 동일하게 해주면 되는걸까?
		String path = "C:/Users/pieis/eclipse-workspace/multiCommunity/src/main/webapp/resources/images/";
		String path2= "C:/Users/pieis/eclipse-workspace/multiCommunity/src/main/webapp/";

		//이미지를 올렸다면
		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="")
		{
			//먼저 이전에 올린 이미지를 삭제한다. 올릴 때마다 추가되지 않도록 없애는 것이다.
			//request.getAttribute아 안되길래 getParameter도 해봤는데 안되길래 결국 form에서 받아옴....
			//new File(path2 + (String)request.getParameter("mtimgpath")).delete();
			new File(path2 + pastimg).delete();	
			
			System.out.println(path2 + pastimg);

			String id = "mtInfoImg";
			String name = file.getOriginalFilename();
			String savename = path + name; //굳이 쓸 일이 있을지는 모르겠음. 
			String contentType = file.getContentType();
			
			//데이터베이스에서 파일 길이를 int형으로 만들었는데 딱히 오류는 안났다.
			long fileLength = file.getSize();
			ImgData imgdata = new ImgData();
			imgdata.setImgId(id);
			imgdata.setImgName(name);
			imgdata.setSaveImgName(savename);
			imgdata.setContentType(contentType);
			imgdata.setFileLength(fileLength);
			imgDataService.updateMTInfoImg(imgdata);
			
			//System.out.println("파일 이름 : " + file.getOriginalFilename());
			//System.out.println("파일 크기 : " + file.getSize());
			
	        try(
	                // 맥일 경우 
	                //FileOutputStream fos = new FileOutputStream("/tmp/" + file.getOriginalFilename());
	                // 윈도우일 경우        		
	        		FileOutputStream fos = new FileOutputStream(savename);
	        		//FileOutputStream fos = new FileOutputStream("c:/tmp/" + file.getOriginalFilename());
	        		//FileOutputStream fos = new FileOutputStream(path + file.getOriginalFilename());
	        		//FileOutputStream fos = new FileOutputStream(path + "mtimg.jpg");
	        		InputStream is = file.getInputStream();
	        ){
	        	    int readCount = 0;
	        	    byte[] buffer = new byte[1024];
	            while((readCount = is.read(buffer)) != -1){
	                fos.write(buffer,0,readCount);
	            }
	        }catch(Exception ex){
	            throw new RuntimeException("file Save Error");
	        }
		}
		
		return "redirect:/mt";	
	}
	
	
	/////////////////////////////////////////
	/////////////////////////////////////////
	//사용하지 않지만 일단 남겨뒀습니다. 그냥 지울까..? 하하.
	
	//사실 안씁니다. getmapping으로 넘어가기 떄문에.
	@PostMapping(path="/modifyMT")
	public String modifyMT(@RequestParam(name="area", required=true) String area) {
		return "redirect:/modifyMT";
	}
	
	//200416
	//MT 날짜관련 수정하는 부분.
	//이제 이거 안써요. 한꺼번에 하기 때문에.
	@PostMapping(path="/updateMTDay")
	public String updateMTDay(@ModelAttribute Admin admin) {
		int ret = adminService.updateAdmin(admin);
		
		System.out.println(ret);
		
		return "redirect:/mt";
	}
	
	//사물함 신청 날짜 수정.
	//얘도 안 씁니다.
	@PostMapping(path="/updateLockerDay")
	public String updateLockerDay(@ModelAttribute Admin admin) {
		adminService.updateAdmin(admin);
		
		return "redirect:/locker";
	}
	
	//200414 
	//MT 내용 수정
	//얘도 안씀.
	@PostMapping(path="/updatemt")
	public String updateMT(@ModelAttribute Admin admin) {
		adminService.updateAdmin(admin);

		return "redirect:/mt";
	}
		
}