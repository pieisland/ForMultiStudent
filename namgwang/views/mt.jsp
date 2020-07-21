<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.Locker" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.MT" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>MT 신청</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<link rel="stylesheet" href="resources/assets/css/myboot.css"/>
		<link rel="stylesheet" href="resources/assets/css/mt_namgwang.css"/>
		<!--
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		-->
		
		<!-- 200721 jquery 관련 -->			
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>			
	</head>
	
	<body class="is-preload no-sidebar">
	
	<% 
		List<MT> li = (List<MT>)request.getAttribute("mtlist");
		
		//200416
		String mtimgpath = (String)request.getAttribute("mtimgpath");
		
		String val = (String)session.getAttribute("loginedStudentId");
		String sid = "";
		String isApplyed = "-1";
		
		for(int i=0;i<li.size();i++){
			sid = li.get(i).getStudentId();
			if(sid.equals(val)){
				isApplyed = "1";
				break;
			}
		}		
	%>

	<% 
		String area = (String)request.getAttribute("area");
		String mtTitle = (String)request.getAttribute("mtTitle");
		String mtContent = (String)request.getAttribute("mtContent");
		mtContent = mtContent.replaceAll("\n", "<br/>");
		
		String msg=" ";
		Timestamp stamp = new Timestamp(System.currentTimeMillis());
		Timestamp st = (Timestamp)request.getAttribute("applyStart");
		Timestamp et = (Timestamp)request.getAttribute("applyEnd");
		SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String startStr = (String)sdf.format(st);
		String endStr = (String)sdf.format(et);
		
		System.out.println(st);
		System.out.println(et);
		
		long now = stamp.getTime();
		long startTime = st.getTime();
		long endTime = et.getTime();

		int dateCheck;
		if( startTime <= now && now <= endTime)
		{
			msg = "※신청 기간입니다.";
			dateCheck=1;
		}
		else {
			msg = "※신청 기간이 아닙니다.";
			dateCheck=0;
		}
	%>

		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
						<div id="logo">
							<a href="index.html">
								<img src="resources/images/logo.png" alt="My Image" width="350" height="100">
							</a>
						</div>

						<!-- Nav -->
						<nav id="nav">
							<ul>							
								<li>
									<a href="index.html">공지사항</a>
								</li>
								<li class="current">
									<a href="#">신청</a>
									<ul>											
										<li><a href="locker">사물함 신청</a></li>
										<li><a href="mt">MT 신청</a></li>											
									</ul>
								</li>
								<li><a href="left-sidebar.html">건의사항</a></li>
								<li><a href="right-sidebar.html">자유게시판</a></li>
								<!-- class="current" 이면 검은색으로 되는 것 같은데. 
									하면서 느끼는건데 이거.. 되게 바꾸면서 난리 엄청 날 것 같음 ㅋㅋㅋ..
								-->
								<li class="login">								
									<c:choose>
									    <c:when test="${sessionScope.isLogin== 'true'}">
											<a href="#">${sessionScope.loginedStudentName}</a>
											<ul>
												<li><a href="mypage">마이페이지</a></li>
												<li><a href="logout">로그아웃</a></li>
											</ul>																							
										</c:when>
									    <c:otherwise>
									    	<button type="button" class="btn btn-primary" style="background: #3A3A3A; border-color: #3A3A3A;" data-toggle="modal" data-target="#myModal">
 												Login
											</button>													
									        <!-- <a href="loginform">로그인</a> -->								      
									    </c:otherwise>
									</c:choose>							
								</li>
							</ul>
						</nav>
					</header>
				</div>

				<!-- Main -->	
				<div class="mycontainer" style ="background-color: white; margin-bottom:30px;">
					<div class = "myrow">
						<!-- 딱 붙이고싶으면 mycol-xs-12만 남기고 지우면 됩니다. -->
						<div class = "mycol-md-10 mycol-md-offset-1 mycol-xs-12">
							<h2>MT 신청</h2>
						</div>
					</div>
				</div>

				<div class="mycontainer" style ="background-color: white">	
					<div class="myrow notice">
						<br>
				        <div class="mycol-md-10 mycol-md-offset-1 mycol-xs-12">
				      		<div> 				      		
				      			<h3><%=mtTitle%><br></h3>
				      			신청 일시: <%=startStr%> ~ <%=endStr%><br>
				      			<p style="color:red"><%=msg%></p>
				      		</div>
				        </div>				        
				    </div>

					<div class="myrow"><!-- 이미지와 내용 넣는 부분. -->
						<div class="mycol-md-4 mycol-md-offset-1" style="border:1px solid grey">	
							<div style="height:430px; width:300px; margin:0 auto;">							
								<img id="mtimg" src="${mtimgpath}" width=300px; height=430px; style="cursor:pointer;">
							</div>				
						</div>
							
						<div class="mycol-md-5 mycol-md-push-1" style="border:1px solid grey">
							<div style="height:430px; width:300px">
								<!--여기는 나중에 고치든가 해야겠음.
								style="line-height:50px;"
								-->
								<div id="mtInfo" >
									<%=mtContent%>
								</div>
							</div>							
						</div>
					</div>

					<!-- 200621 일단 작동은 안되구요. 경로 얻는 것 때문에 다음에 확인할 일이 있어서 지우지는 않을게요. -->
				  	<c:if test="${sessionScope.loginedStudentName=='관리자2'}">
						<div class="myrow" style="margin-top:10px">
							<div class="mycol-md-11 mycol-md-offset-1">
								 <form method="post" action="uploadMTimg" enctype="multipart/form-data">
								   <input type="file" name="file" id="gdsImg"><br>
								   <div class="select_img"><img src="" /></div>							   
		 							<input type="hidden" name="pastimg" value="${mtimgpath}"> 
		 					       <input type="submit" value="선택한 사진으로 변경">
		 					       
		 					     <script>
		 					     	var target = document.querySelector("#gdsImg");
									target.addEventListener("change", function(){
										if(this.files && this.files[0]) {
										    var reader = new FileReader;
										    reader.onload = function(data) {
										     $(".select_img img").attr("src", data.target.result).width(200);        
										    }
										    reader.readAsDataURL(this.files[0]);
										   }
									}) ; 
		 					     	/*$("#gdsImg").change(function(){
									   if(this.files && this.files[0]) {
									    var reader = new FileReader;
									    reader.onload = function(data) {
									     $(".select_img img").attr("src", data.target.result).width(500);        
									    }
									    reader.readAsDataURL(this.files[0]);
									   }
									  });*/ 					       
								</script>		       
		 					       <br>
		 					       <%=request.getRealPath("/") %>
		 					       
		 						</form>
 							</div>
 						</div>    
					</c:if>

					<!-- form 작성 부분 -->
					<div class="myrow" style="margin:30px 0;">
						<form>
						<div class="mycol-md-3 mycol-sm-4 mycol-md-offset-1 mycol-xs-12" style="text-align:center; margin-bottom:20px;" id="phoneNumber">
							<span class="fontBold">전화번호</span>
							<div style="margin:0 auto; width:185px; margin-top:10px;">
								<input type="text" id="who" placeholder="예) 010-1234-5678" style="width:180px; border:1px solid grey;">
							</div>
						</div>

						<div class="mycol-md-4 mycol-sm-4 mycol-xs-12" style="text-align:center; margin-bottom:20px;">
							<span class="fontBold">선후발 선택</span><br>
							<div style="margin:0 auto; width:200px; margin-top:10px;" id="departureTime" >
								<div style="width:80px; height:40px; color:black; cursor: pointer; margin-right:30px; border:1px solid grey; display:inline-block;" class="depTime" id = "advance"><p style="margin-top:10px; margin-bottom:20px; ">선발</p></div>	
								<div style="width:80px; height:40px; color:black; cursor: pointer; border:1px solid grey; display:inline-block;" class="depTime" id = "late"><p style="margin-top:10px">후발</p></div>
							</div>	
						</div>
						
						<div class="mycol-md-3 mycol-sm-4 mycol-xs-12">
							<br>
							<div style="margin:0 auto; width:185px; ">
								<input type="button" value = "신청하기" id= "MTapplyBtn" style="width:180px;" type="submit">
							</div>
						</div>
						</form>
					</div>

					<!--굳이 여기 할 필요없이 정보에 쓰면 될 것 같은데? 그러면 관리도 더 쉬울 듯. 하지만 그냥 둬도 될 것 같음. -->
					<div class="myrow">
						<div class="mycol-md-10 mycol-md-push-1 mycol-xs-12" style="margin-bottom:20px;">
							<p style="color:red">※주의사항</p>
							신청 후 취소 불가합니다. 취소를 원하는 경우 학생회장에게 연락 바랍니다. 
						</div>
					</div>
							<!-- 모달이 필요하면 하겠는데.. 굳이 필요가 없는 것 같아서 일단 x.
				            <div class="modal fade" id="MTapply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				               <div class="modal-dialog">
				                 <div class="modal-content">
				                   <div class="modal-header">
				                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                     <h4 class="modal-title" id="myModalLabel">MT 신청</h4>
				                   </div>
				                   <div class="modal-body">
				            			MT 신청을 완료하시겠습니까?
				                   </div>
				                   <div class="modal-footer">
				                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="mtAlert()">예</button>
				                    <button type="button" class="btn btn-primary" data-dismiss="modal">아니요</button>
				                   </div>
				                 </div>
				               </div>
				             </div>			
				             -->
					<!-- 정보 아래에 있었는데 옮김. -->
				  	<c:if test="${sessionScope.loginedStudentName=='관리자'}">
						<div class="myrow" style="margin:10px 0;">
							<div class="mycol-md-2 mycol-md-offset-10">
								<div style="margin:0 auto">
									<button style="color:white" onclick="deleteAll()">신청자 삭제</button>
								</div>
							</div>
						</div>
					</c:if>    
					
					<!-- 200621 수정할 페이지로 이동함. -->
					<c:if test="${sessionScope.loginedStudentName=='관리자'}">
						<div class="myrow" style="margin:10px 0;">
							<div class="mycol-md-2 mycol-md-offset-10">
								<div style="margin:0 auto">
									<button style="color:white" onclick="location.href='modifyMT?area=<%=area%>'">정보 수정</button>
								</div>
							</div>
						</div>
					</c:if>  
					
					<!-- 로그인 모달 두 개. 하나는 일반적으로 쓰는 걸로 했고 하나는 제이쿼리로 했는데 동작 받식이 다르기 때문에 같이 생겼지만 두 개 쓰기로 함. -->
					<!-- 위에 로그인 모달. -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">로그인 </h4>
					      </div>
					      <div class="modal-body">
					        <!-- 되나 보자. -->
							 <div class="formWrap">	
								<form action="login" method="post" id="myform">
								<!--  나중에 action값을 홈으로 바꿔야겠죠..?  근데 일단 내 페이지로 해둘게용.. 흑.-->
							        <input type="hidden" name="nowpage" value="mt">
							        <div class="inputWrap">
							            <div class="email">
							                <span> 학번 </span> <input type="text" name="studentid"><br/>
							            </div>
							            <div class="password">
							                <span> 이름 </span> <input type="text" name="studentname"><br/>
							            </div>
							        </div>
							        <!-- <input class="sendbtn" type="submit" value ="로그인"> -->
							        <button type="submit" style="color:white">Login</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							    </form>
							 </div>
					      </div>
					      <!-- 
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					       -->
					    </div>
					  </div>
					</div>				            
								
					<!--  제이쿼리 로그인 모달. 작은화면에서 나오는거. -->
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body"> 
				                <!-- 제이쿼리 모달에도 폼을 넣어봅니다. -->         
									 <div class="formWrap">	
										<form action="login" method="post" id="myform">
										<!--  나중에 action값을 홈으로 바꿔야겠죠..?  근데 일단 내 페이지로 해둘게용.. 흑.-->
									        <input type="hidden" name="nowpage" value="mt">
									        <div class="inputWrap">
									            <div class="email">
									                <span> 학번 </span> <input type="text" name="studentid"><br/>
									            </div>
									            <div class="password">
									                <span> 이름 </span> <input type="text" name="studentname"><br/>
									            </div>
									        </div>
									        <!-- <input class="sendbtn" type="submit" value ="로그인"> -->
									        <button type="submit" style="color:white">Login</button>
						        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									    </form>
									 </div>			                   
				                </div>
				                <!-- <div class="modal-footer">
				                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				                    <button type="button" class="btn btn-primary">Save changes</button>
				                    <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button>
				                </div>
				                 -->
				            </div>
				        </div>
				    </div>
			</div>
			
			<!-- Footer -->
            <div id="footer-wrapper" style="text-align: center">
               <footer id="footer" class="container">
                  <div class="row">             
                     <div class="col-12">
                        <div class="hr-sect"><img src="resources/images/ele.svg"></div><br>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4 col-6-medium col-12-small">
                        <!-- Links -->
                           <section class="widget links">
                              <h3>학과 Info.</h3>
                              <ul class="style2">
                                 <li><a href="#">번호 : 02-2260-8760</a></li>
                                 <li><a href="#">주소 : (변경예정)</a></li>
                              </ul>
                           </section>
                     </div>
                     
                     <div class="col-4 col-6-medium col-12-small">
                        <!-- Links -->
                           <section class="widget links">
                              <h3>학생회 Info.</h3>
                              <ul class="style2">
                                 <li><a href="#">학생회장 : 010-9215-5644</a></li>
                                 <li><a href="#">부학생회장 : 010-5620-2869</a></li>
                                 <li><a href="#">과실 위치 : 원흥관 2층 E267</a></li>
                              </ul>
                           </section>
                     </div>
                     <div class="col-4 col-6-medium col-12-small">

                        <!-- Links -->
                           <section class="widget links">
                              <h3>SNS</h3>
                              <ul class="style2">
                                 <li><a href="https://ko-kr.facebook.com/people/%EB%8F%99%EA%B5%AD%EB%A9%80%ED%8B%B0/100006257864438">facebook</a></li>
                                 <li><a href="https://cafe.naver.com/dgumulti">naver cafe</a></li>
                                 <li><a href="https://pf.kakao.com/_HQVud">kakao</a></li>
                              </ul>
                           </section>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <div id="copyright">
                           <ul class="menu">
                              <li>&copy; Untitled. All rights reserved</li>
                              <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                              <li>Font : <a href="https://noonnu.cc/font_page/407">tt투게더</a></li>
                              <li>Develop: 류남광, 박은희, 최정선, 최희수</li>
                              <li>Thanks to : 백민주</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </footer>
            </div>   
		</div><!-- 맨 처음입니다.-->

		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js?ver=123"></script>
			<script src="resources/assets/js/main.js"></script>
			
		<!-- 내 함수들-->
			<script>
			
			    var my_id;
				<c:choose>
					<c:when test="${sessionScope.isLogin == 'true'}">
						my_id = "${sessionScope.loginedStudentId}";
					</c:when>
	
					<c:otherwise>
						my_id = "-1";
					</c:otherwise>
				</c:choose>
				console.log("my_id : " + my_id);
				
				var isApplyed="<%=isApplyed%>";
				var depval = "선발";
				var depbtn = document.querySelector("#departureTime");
				var phone = document.querySelector("[name='phoneNumber']");
				var mtbtn = document.querySelector("#MTapplyBtn");
				//사실 이제 필요없긴 하다.
				var area = "<%=area%>";
				var dt = <%=dateCheck%>;
				
				//로그인을 해야 신청할 수 있으니까
				if(my_id === "-1"){
					mtbtn.disabled="true";
					mtbtn.style.backgroundColor="grey";
					mtbtn.value ="로그인 필요";
				}
				else if(my_id==="admin"){
					mtbtn.disabled = "true;"
					mtbtn.style.backgroundColor="grey";
					mtbtn.value = "관리자";
				}
				else{
					//로그인 한 학생인데 신청일이 아닐 때.
					if(dt === 0){
						mtbtn.disabled = "true;"
						mtbtn.style.backgroundColor="grey";
						mtbtn.value = "신청일 아님";
					}
				}
				
				//신청 시에 막는건 데이터베이스에서 값을 가져와서 처리하는 걸로 함.
				if(isApplyed === "1"){
					mtbtn.disabled="true";
					mtbtn.style.backgroundColor="grey";
					mtbtn.value = "신청 완료";
				}
				
				//선발이나 후발 클릭한 것에 따라 색을 변경한다.
				function depbtnColorChange(val){
					console.log("함수호출");
					var ad = document.querySelector("#advance");
					var la = document.querySelector("#late");
		
					if(val==="선발"){
						//이전 값을 먼저 복원한 후에 바꿈.
						la.style.backgroundColor="white";
						//la.style.color="black";
						ad.style.backgroundColor="#FFDE00";
						//ad.style.color="white";
					}
					else if(val==="후발"){
						ad.style.backgroundColor="white";
						//ad.style.color="black";
						la.style.backgroundColor="#FFDE00";
						//la.style.color="white";
					}
				}
		
				//선발이나 후발이나 버튼을 클맀했을 때, eventBubbling으로 처리.
				depbtn.addEventListener("click", function(evt){
					var target = evt.target;
					if(target.tagName ==="DIV" || target.tagName==="P"){
						if(target.innerText ==="선발")
						{
							depval ="선발";
						}
						else if(target.innerText==="후발"){
							depval = "후발";
						}
					}
					depbtnColorChange(depval);
				});
		
				//postmapping으로 mt 신청 결과를 보낸다.
				function applyMT(phoneNumber, departureTime, studentId){
					//순서를 좀 바꿔야할 수도 있어요.
					console.log(phoneNumber);
					console.log(departureTime);
					console.log(studentId);

					//name에 적는 값은 dto에서 정의했던 것과 대문자도 동일하게 작성해야한다.
					//그러면 알아서 대문자는 _들어가서 바뀜.
					var form = document.createElement("form");
					form.setAttribute("method", "Post");
					form.setAttribute("action", "applyMT");
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("name", "phoneNumber");
					hiddenField.setAttribute("value", phoneNumber);
					form.appendChild(hiddenField);
										    	  
					hiddenField = document.createElement("input");
					hiddenField.setAttribute("name", "departureTime");
					hiddenField.setAttribute("value", departureTime);
					form.appendChild(hiddenField);							  
					
					hiddenField = document.createElement("input");
					hiddenField.setAttribute("name", "studentId");
					hiddenField.setAttribute("value", studentId);				  
					form.appendChild(hiddenField);
					
					document.body.appendChild(form);
					form.submit();
				}
				
				//신청하기 버튼을 클릭했을 때 서버로 넘기기 전에 형식이 맞는지 먼저 확인한다.
				mtbtn.addEventListener("click", function(evt){
					evt.preventDefault();
					console.log(phone.value);
					var bValid = (/01[01789]-\d{3,4}-\d{4}/).test(phone.value);
					if(!bValid){
						alert("전화번호 형식이 알맞지 않습니다.");
					}
					else
					{
						alert("신청이 완료되었습니다.");
						applyMT(phone.value, depval, my_id);
					}
				});
		
				depbtnColorChange(depval);

				//모든 신청 정보를 삭제.
			    function deleteAll(){
			    	var form = document.createElement("form");
			    	form.setAttribute("method", "Post");
			    	form.setAttribute("action", "deleteAllMT");

			    	document.body.appendChild(form);
			    	form.submit();
			    }				
			
				//200628. 이미지 클릭 시 원본 크기로 보기.
				var img = document.getElementById("mtimg");
				img.onclick = function() {window.open(this.src)};
				/*for (var x = 0; x < img.length; x++) {
					img.item(x).onclick=function() {window.open(this.src)}; 
				}*/
			</script>

			<!-- 제이쿼리로 모달 열기. -->
		    <script>
		        $(document).ready(function() {
		            $("#modal_show").click(function() {
		                $("#exampleModal").modal("show");
		            });
		 
		            $("#close_modal").click(function() {
		                $("#exampleModal").modal("hide");
		            });
		        });
		    </script>
	
	    	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	    	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	   		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</body>
</html>
