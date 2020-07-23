<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.Locker" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.MT" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
	</head>
	<body class="is-preload no-sidebar">
	
	<% 
		List<MT> li = (List<MT>)request.getAttribute("mtlist");
		String mtinfo = (String)request.getAttribute("mtinfo");	
		mtinfo = mtinfo.replaceAll("\n", "<br/>");
		
		String mtDay = (String)request.getAttribute("mtDay");	
		mtDay = mtDay.replaceAll("\n", "<br/>");
		
		//200416
		String mtimgpath = (String)request.getAttribute("mtimgpath");
		
		
		//이ㅣ거 안됐던 것 같은데요..ㅋㅋㅋ 오류났던 걸로 기억해.
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
										<a href="#" onclick="popup()">팝업테스트</a>
									</li>
								
									<li>
										<a href="index.html">공지사항</a>
									</li>
									<li class="current">
										<a href="#">신청</a>
										<ul>
											<!-- Mt 신청은 여기서 안한다고 했었나..? ㅠㅠ -->
											<li><a href="locker">사물함 신청</a></li>
											<li><a href="mt">MT 신청</a></li>
											<!--
											<li>
												<a href="#">Phasellus consequat</a>
												<ul>
													<li><a href="#">Lorem ipsum dolor</a></li>
													<li><a href="#">Phasellus consequat</a></li>
													<li><a href="#">Magna phasellus</a></li>
													<li><a href="#">Etiam dolore nisl</a></li>
												</ul>
											</li>
											
											<li><a href="#">Veroeros feugiat</a></li>
											-->
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
										        <a href="loginform">로그인</a>										      
										    </c:otherwise>
										</c:choose>
									
									<!--
									<a href="loginform">로그인</a>
									-->									
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
					<c:if test="${sessionScope.loginedStudentName=='관리자'}">
						<div class="myrow" style="margin:10px 0;">
							<div class="mycol-md-11 mycol-md-offset-1">
								<div style="margin:0 auto">
									<button style="color:white" onclick="updateMTDay()">MT 날짜 수정</button>
								</div>
							</div>
						</div>
					</c:if>				
					
					<div class="myrow notice">
						<br>
				        <div class="mycol-md-10 mycol-md-offset-1 mycol-xs-12">
				      		<div class="mtday">
				      			<%=mtDay%>  
				      		</div>
				        </div>				        
				    </div>

					<c:if test="${sessionScope.loginedStudentName=='관리자'}">
						<div class="myrow" style="margin:10px 0;">
							<div class="mycol-md-2 mycol-md-offset-9">
								<div style="margin:0 auto">
									<button style="color:white" class="updateMT" onclick="updateMT()">MT 정보 수정</button>
								</div>
							</div>
						</div>
					</c:if>

					<div class="myrow"><!-- 이미지와 내용 넣는 부분. -->
						<div class="mycol-md-4 mycol-md-offset-1" style="border:1px solid grey">	
							<div style="height:300px; width:300px; margin:0 auto;">							
								<img src="${mtimgpath}" width=300px; height=300px;>
							</div>				
						</div>
							
						<div class="mycol-md-5 mycol-md-push-1" style="border:1px solid grey">
							<div style="height:300px;">
								<!--여기는 나중에 고치든가 해야겠음.
								style="line-height:50px;"
								-->
								<div id="mtInfo" >
									
									<%=mtinfo %>
									
								</div>
							</div>							
						</div>
					</div>

						<!--<c:if test="${sessionScope.loginedStudentName=='관리자'}">
							<button>수정하기</button>
						</c:if>-->


				  	<c:if test="${sessionScope.loginedStudentName=='관리자'}">
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
							<!-- 도대체가 말이야. input type으로 만든 버튼에 대해서는 텍스트 정렬을 지가 고정으로 해놓은 것 같다고.
							<input type="button" name="priority" value="선발" style="background-color: grey; width:70px; text-align:center;" >
							<input type="button" name="priority" value="후발">
							<br>-->
							<div style="margin:0 auto; width:200px; margin-top:10px;" id="departureTime" >
								<div style="width:80px; height:40px; color:black; cursor: pointer; margin-right:30px; border:1px solid grey; display:inline-block;" class="depTime" id = "advance"><p style="margin-top:10px; margin-bottom:20px; ">선발</p></div>	
								<div style="width:80px; height:40px; color:black; cursor: pointer; border:1px solid grey; display:inline-block;" class="depTime" id = "late"><p style="margin-top:10px">후발</p></div>
							</div>	
						</div>
						
						<div class="mycol-md-3 mycol-sm-4 mycol-xs-12">
							<!-- 
							<div style="margin:0 auto; width:185px; border:1px solid red;">
								<input type="button" value = "신청하기" data-toggle="modal" data-target="#MTapply" style="width:180px;">
							</div>
							-->
							<br>
							<div style="margin:0 auto; width:185px; ">
								<input type="button" value = "신청하기" id= "MTapplyBtn" style="width:180px;" type="submit">
							</div>
						</div>
						</form>
					</div>

					<!--굳이 여기 할 필요없이 정보에 쓰면 될 것 같은데? 그러면 관리도 더 쉬울 듯. -->
					<div class="myrow">
						<div class="mycol-md-10 mycol-md-push-1 mycol-xs-12" style="margin-bottom:20px;">
							<p style="color:red">※주의사항</p>
							신청 후 취소 불가합니다. 취소를 원하는 경우 000에게 연락 바랍니다. 
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
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>

		<!-- 내 함수들-->
			<script>
			
			    var my_id;
				<c:choose>
					<c:when test="${sessionScope.isLogin== 'true'}">
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
				
				//로그인을 해야 신청할 수 있으니까
				if(my_id === "-1"){
					mtbtn.disabled="true";
					mtbtn.style.backgroundColor="grey";
					mtbtn.value ="로그인 필요";//ㅋㅋ 버튼 길이떄문에..ㅋㅋㅋ 짧아야할 듯.
				}
				else if(my_id==="admin"){
					mtbtn.disabled = "true;"
					mtbtn.style.backgroundColor="grey";
					mtbtn.value = "관리자";
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
					//var child = depbtn.childNodes;
					//console.log(child);
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

				//admin계정으로 로그인 했을 때 MT 상세 정보를 수정할 수 있음.
				function updateMT(){
					console.log("값 수정");
					
					//dom tree에서 값을 가져오면 되는거였다.
					var info = document.querySelector("#mtInfo").innerText;
					console.log(info);
					
					var form = '<form action="updatemt" method="post" id="updateform"> <div class="inputWrap"> <input type="hidden" name="area" value="mt">';
					form += '<div> <span> 내용 </span> <textarea cols="10" rows="5" name="content">';
					form += info;
					form += '</textarea><br/></div> </div>';
					form += '<input class="updatebtn" type="submit" value ="수정 완료"> </form>';
				    
				    var target = document.querySelector("#mtInfo");
				    target.innerHTML = form;
				}
				
				//모든 신청 정보를 삭제.
			    function deleteAll(){
			    	var form = document.createElement("form");
			    	form.setAttribute("method", "Post");
			    	form.setAttribute("action", "deleteAllMT");

			    	document.body.appendChild(form);
			    	form.submit();
			    }
				
				//MT 날짜, 신청일 정보를 수정.
			    function updateMTDay(){
					var info = document.querySelector(".mtday").innerText;
					console.log(info);
						
					var form = '<form action="updateMTDay" method="post"> <div class="inputWrap"> <input type="hidden" name="area" value="mtDay">';
					form += '<div> <span> 내용 </span> <textarea cols="15" rows="2" name="content">';
					form += info;
					form += '</textarea><br/></div> </div>';
					form += '<input type="submit" value ="수정 완료"> </form>';	    
					    
				    var target = document.querySelector(".mtday");
				    target.innerHTML = form;
			    }			    
			   			    
			</script>

    	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</body>
</html>
