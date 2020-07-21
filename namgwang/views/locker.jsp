<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.Locker" %>
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
		<title>사물함 신청</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<link rel="stylesheet" href="resources/assets/css/myboot.css"/>
		<link rel="stylesheet" href="resources/assets/css/locker_namgwang.css"/>	
<!--
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


		<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/animate.min.css" />
		<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/jquery.modal.css" />
-->
	
	</head>
	<body class="is-preload no-sidebar">
	<%
		//남은 좌석 수를 표시하기 위해 위에 선언했다. 원래는 밑에 뒀었는데..
		List<Locker> li= (List<Locker>)request.getAttribute("list");
		int val;
		int remainedLocker = 150 - li.size();
		String sid = "";
		String lid = "";
		int arr[] ={1, 2, 3};
		for(int i=0;i<li.size();i++){
			val = li.get(i).getLockerId();
			sid += li.get(i).getStudentId();
			lid += Integer.toString(val);
			
			if(i!=li.size()-1){
				sid +=" ";
				lid +=" ";
			}
		}
	%>

	<% 
		//신청일인지 아닌지를 판단하기.
		/*Date nowDate = new Date();
		Date applyStart = (Date)request.getAttribute("applyStart");	
		Date applyEnd = (Date)request.getAttribute("applyEnd");	
	
		String msg;
		//진짜 이렇게 하면 되겠찌?
		if(applyStart.getTime()<= nowDate.getTime() && nowDate.getTime()<=applyEnd.getTime()){
			msg = "신청기간이에요.";
		}
		else msg = "신청 기간이 아니에요.";*/
		String area = (String)request.getAttribute("area");
		String title = (String)request.getAttribute("title");
		//String mtContent = (String)request.getAttribute("mtContent");
		//mtContent = mtContent.replaceAll("\n", "<br/>");
		
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
		/*Date applyStart = new Date(st.getTime());
		Date applyEnd = new Date(et.getTime());
		Date nowDate = new Date();
		
		//진짜 이렇게 하면 되겠찌?
		if(applyStart.getTime()<= nowDate.getTime() && nowDate.getTime()<=applyEnd.getTime()){
			msg = "신청 가능합니다.";
		}
		else
			msg = "신청 불가해요...";	*/
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
									
									
									<!-- 은희가 한 부분 조금 번경한거고. -->
									<li class="login">
										<!-- <a href="#myModal" role="button" class="btn btn-default" data-toggle="modal" >로그인</a> -->
										<c:choose>
										    <c:when test="${sessionScope.isLogin== 'true'}">
												<a href="#">${sessionScope.loginedStudentName}</a>
												<ul>
													<li><a href="mypage">마이페이지</a></li>
													<li><a href="logout">로그아웃</a></li>
												</ul>																							
											</c:when>

										    <c:otherwise>
										    	<!--  <a href="loginform">로그인</a> -->			
										        <button type="button" class="btn btn-primary" style="background: #3A3A3A; border-color: #3A3A3A;" data-toggle="modal" data-target="#myModal">
	 												Login
												</button>	
												
								
												<!-- <button type="button" class="btn btn-primary" id="modal_show">로그인1</button> -->
																      
										    </c:otherwise>
										</c:choose>	
										
										
										<!--  <p> <a href="#" data-toggle="modal" data-target="#log"> test modal open </a> </p>	-->														
									</li>									
								</ul>
							</nav>	
				</div>

			<!-- Main -->	
	
				<div class="mycontainer" style ="background-color: white; margin-bottom:30px;">
					<div class = "myrow">
						<div class = "mycol-md-10 mycol-md-offset-1 mycol-xs-12">
							<h2>사물함 신청</h2>
						</div>
					</div>
				</div>					
			
				<div class="mycontainer" style ="background-color: white">				
					<div class="myrow notice">
						<br>
				        <div class="mycol-md-10 mycol-md-offset-1 mycol-xs-12">				        	
				        	<!-- 200623
				      		사물함 신청일.
				      		-->
				      		<div> 				      		
				      			<h3><%=title%><br></h3>
				      			신청 일시: <%=startStr%> ~ <%=endStr%><br>
				      			<p style="color:red"><%=msg%></p>
				      		</div>
				        </div>				        
				    </div>

				      <div class="myrow">
				        <!-- 작은 모니터 사이즈 이상에서만 두 개로 보입니다. -->
				        <!-- 사물함배치도 -->
				          <div class="mycol-md-4 mycol-md-push-7 frame">
				            <div class="myrow bg-info">
				              <div class="text-center" style="height:40px; margin:20px 0px;  font-size:2em;"> 
				                사물함 배치도
				              </div>
				            </div>
				            <br>
				            <div class="myrow locker-preview">
				                <div class="mycol-xs-12">
				                  <div class="myrow">
				                    <br>
				                    <br>
				                    <br>
				                  </div>
      
				                  <div class="myrow"><!--두번쨰 줄이에요. -->
				                    <div style="margin:0 auto; width:260px"><!-- 중간에 두려고 이거 놔둔거에용.-->
				                      <div class="locker" id="locker0" style="width:30px; height:60px; display:inline-block; cursor: pointer;" onclick="showLocker(0)">1</div>
				                      <div class="locker" id="locker1" style="width:30px; height:60px; display:inline-block; cursor: pointer;" onclick="showLocker(1)">2</div>
				                      <div class="locker" style="width:44px; height:60px; display:inline-block; background-color: #8FC8ED; color:black"><p>4105</p></div>
				                      <div class="locker" id="locker2" style="width:50px; height:60px; display:inline-block; cursor: pointer;" onclick="showLocker(2)">3</div>                      
				                      <div class="locker" id="locker3" style="width:40px; height:60px; display:inline-block; cursor: pointer;" onclick="showLocker(3)">4</div>
				                    </div>
				                  </div>
				                </div>
				            </div>

				            <div class="myrow" style="margin-top:30px; margin-left:10px; margin-right:10px;">
				              <div class="mycol-xs-4">
				                <button type = "button" data-toggle="modal" class="btn btn-danger btn-block" href="#" role="button" data-target="#attention">주의사항</button>
				              </div>
				              <div class="mycol-xs-8">
				                <button type = "button" data-toggle="modal" class="btn btn-primary btn-block" type="submit" data-target="#applyLocker" id="applyBtn">사물함 신청하기</button>
				              </div>
								        
								<!-- 
						        	왜 얘만 나오지
						        	얘는 버튼이랑 a랑 같이 있어도 문제 없는데..
						        	위에걸 버튼으로 한다해도 네비게이션에서 아무것도 안되니까 문제지.
						        <a data-toggle="modal" href="#log">a modal</a>
				         		-->
				         		
				     										
				   			         		
				         		
				            </div>

				              <!--주의사항 모달-->
				            <div class="modal fade" id="attention" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				               <div class="modal-dialog">
				                 <div class="modal-content">
				                   <div class="modal-header">
				                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                     <h4 class="modal-title" id="myModalLabel">주의사항</h4>
				                   </div>
				                   <div class="modal-body">
				                      <!--날짜 정보가 들어가야합니다. 음...-->
				                      [사물함 신청 안내 및 주의사항]<br>
				                      -학생회비 납부자에 한해 무료입니다.<br>
				                      	휴학생과 학생회비 비납부자에게는  사물함 배정을 하지 않습니다.<br><br>

				                      -연장을 원하는 경우, <br>
				                      	동일 좌석을 선택하시면 됩니다.<br><br>
				                   </div>
				                   <div class="modal-footer">
				                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				                   </div>
				                 </div>
				               </div>
				             </div>

				              <!--..아 모달이 필요한가 생각해보니까.. 그냥 알러트 하면 되는 거 아님? 암튼 일단은 신청 모달임.-->
				            <div class="modal fade" id="applyLocker" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				              <div class="modal-dialog">
				                <div class="modal-content">
				                  <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                    <h4 class="modal-title" id="myModalLabel">사물함 신청</h4>
				                  </div>
				                  <div class="modal-body modal-ask">
				                        	사물함을 신청하시겠습니까?
				                  </div>
				                  <div class="modal-footer">
				                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="myAlert()">예</button>
				                    <button type="button" class="btn btn-primary" data-dismiss="modal">아니요</button>
				                  </div>
				                </div>
				              </div>
				            </div>
				            
				            <!-- 200715 모달.. 로그인 하려고 하는데 잘 안되는데 이유가 뭐임..? -->
				            <div class="modal fade" id="log" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				              <div class="modal-dialog">
				                <div class="modal-content">
				                  <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                    <h4 class="modal-title" id="myModalLabel">사물함 신청</h4>
				                  </div>
				                  <div class="modal-body modal-ask">
				                        	복이가 많이 귀엽나요?
				                  </div>
				                  <div class="modal-footer">
				                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="myAlert()">예</button>
				                    <button type="button" class="btn btn-primary" data-dismiss="modal">아니요</button>
				                  </div>
				                </div>
				              </div>
				            </div>
				            
		


	            
				          </div>
				          
				          <div class="mycol-md-6 mycol-md-pull-3 frame">
				            <div class="myrow">
				              <div class="mycol-xs-12 selection-info">
				                <br>
				                <div style="width:20px; height:20px; background-color: red; display:inline-block"></div><span style="color:white; font-weight:bold"> 선택</span>
				                <div style="width:20px; height:20px; background-color: #070289; display:inline-block"></div><span style="color:white; font-weight:bold"> 선택 불가</span>
				                <div style="width:20px; height:20px; background-color: white; display:inline-block"></div><span style="color:white; font-weight:bold"> 선택 가능</span>
				                <div style="width:20px; height:20px; background-color: #FFDE00; display:inline-block"></div><span style="color:white; font-weight:bold"> 내 사물함</span>
				                <div style="display:inline-block; color:white; font-weight:bold; margin-left:10px"> 남은 좌석  : <%=remainedLocker %></div>
				                <div><p id="selInfo" style="color:white; font-weight: bold; margin:0 auto; width:200px; font-size:15px">
				                  	몇 번 사물함 배치도입니다.
				                </div>
				              </div>
				            </div>
				            <div class="myrow selection-window">
				              <div class="sel-win">
				                <!-- 여기에 사물함들이 들어온다.-->
				              </div>
				            </div>
				          </div><!-- col-md-5 -->

				      </div><!--row-->
				      
				    <c:if test="${sessionScope.loginedStudentName=='관리자'}">
						<div class="myrow" style="margin:10px 0;">
							<div class="mycol-md-2 mycol-md-offset-10">
								<div style="margin:0 auto">
									<button style="color:white" onclick="deleteAll()">모두 삭제</button>
								</div>
							</div>
						</div>
					</c:if>
					
					<!-- 200623 사물함신청 수정버튼 -->
					<c:if test="${sessionScope.loginedStudentName=='관리자'}">
						<div class="myrow" style="margin:10px 0;">
							<div class="mycol-md-2 mycol-md-offset-10">
								<div style="margin:0 auto">									
									<button style="color:white" onclick="location.href='modifyLocker?area=<%=area%>'">정보 수정</button>
								</div>
							</div>
						</div>
					</c:if> 					
					
					
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
									<input type="hidden" name="nowpage" value="locker">
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
						            
							  
					<!-- 제이쿼리 로그인 모달. -->
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
											<input type="hidden" name="nowpage" value="locker">
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
				</div><!-- container -->
			
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
			<script src="resources/assets/js/util.js?ver=1"></script>
			<script src="resources/assets/js/main.js"></script>
			<script src="resources/assets/js/locker_namgwang.js"></script>

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
			  //console.log("my_id : " + my_id);

		      var isSelpos = 1; //사물함을 이미 신청했는지 아닌지를 확인하기 위한 변수.
		      var selNum = -1; //이전에 선택한 개별 사물함 번호.
		      var selLocker = -1; //이전에 선택한 전체 사물함 번호.
		      var samePage = 0; //동일한 전체 사물함 번호여야 이전 값을 가져올 수 있다.
		      var selInfo = document.querySelector("#selInfo"); //몇 번 사물함인지를 알려주는 글 넣는 곳.
		      var selectedMyLocker = -1; //내가 선택하고 신청 완료한 사물함 번호.     
		      var selectedOthersLocker = []; //다른 사람들이 신청한 사물함 번호들 저장.
			  var dt = <%=dateCheck%>;
		      
		      //데이터베이스에서 사물함 테이블의 값을 가져온다.
			  var sid = "<%=sid %>";
			  var lid = "<%=lid%>";
			  sid = sid.split(" ");
			  lid = lid.split(" ");
			  for(var i = 0; i < lid.length; i++){
				//String으로 저장했기 때문에 숫자로 변환한다. 자바스크립트에서 문자열을 숫자로 변환하는 것은 parseInt를 쓴다.
				selectedOthersLocker.push(parseInt(lid[i]));
			  }

			  //이미 사물함 신청을 한 학생인지 확인.
			  console.log("sid.indexOf(my_id) : " + sid.indexOf(my_id));			  
			  if(sid.indexOf(my_id)!== -1){
				  var idx = sid.indexOf(my_id);
				  //어차피 같은 순서로 오기 때문에 id의 인덱스로 locker 번호를 얻어왔다.
				  selectedMyLocker = lid[idx]; //내 번호를 저장한다.
				  isSelpos = 0; //이미 선택을 완료했다.
				  console.log("isSelpos: " + isSelpos);
			  }
			  
		      //원하는 사물함 번호를 클릭했을 때 사물함의 색을 변경해준다.
		      function myclick(num){
		        console.log(num + " 번 사물함을 클릭했습니다.");
		        var b = document.getElementsByName(num);
		
		        //같은 페이지 내에 있어야 이전 값을 가져올 수 있다. 그래서 samePage가 1이어야만 한다.
		        if(selNum != -1 && samePage == 1){
		          var before = document.getElementsByName(selNum);
		          before[0].style.backgroundColor ='white';
		        }
		
		        b[0].style.backgroundColor = 'red';
		        selNum = num;
		        samePage = 1;
		        //중복 클릭했을 때 바꾸게 해주는 건 안해뒀다..
		      }
		
		      //오른쪽에 있는 사물함 배치도에서 선택한 사물함 번호를 노랑으로 바꾸고, 이전에 선택한 것을 남색으로 바꾼다.
		      function miniLockerChange(beforeSel, num){
		        var myId = "locker" + num;
		        if(beforeSel != -1){ //이전에 선택한 게 있다면
		          var beforeId = "locker" + beforeSel;
		          var target = document.querySelector("#" + beforeId);
		          target.style.backgroundColor = "#070289";
		          target.style.color = "white";
		        }
		
		        var target = document.querySelector("#" + myId);
		        //console.log(target);
		        target.style.backgroundColor="#FFDE00";
		        target.style.color="black";
		      }
		
		      //선택한 사물함 배치도를 보여준다.
		      function showLocker(lockerNum){
		        //오류를 막기 위해 다시 selNum을 초기화 하는 걸로 하자.
		        selNum = -1;
		
		        var myLockerNum = lockerNum + 1 ;//0번부터라 1을 더해준다.
		        selInfo.innerHTML = myLockerNum+ "번 사물함 배치도입니다.";
		
		        //사물함 배치도 색 변경.
		        miniLockerChange(selLocker, lockerNum);
		        selLocker = lockerNum;//배치 후 현재 사물함 번호를 저장한다. 후에 이전번호로 쓰인다.
		
		        console.log("선택한 사물함 배치 번호: " + lockerNum);
		        //다른 화면으로 넘어왔음을 표시한다.
		        samePage = 0;
		
		        //각 사물함마다 크기가 달라서 중간에 보이기 위해서 다른 크기가 필요.
		        var lockerSizeTable = [255+20, 255+20, 420+20, 340+20];
		        //console.log(lockerNum);
		        var lockerSize = lockerSizeTable[lockerNum] + "px";
		        //console.log(lockerSize);
		
		        var target = document.querySelector(".sel-win");
		        target.style.width = lockerSize; //가로 크기를 변경해준다.
		
		        //사물함을 한 칸 한 칸씩 보여준다.
		        var lockerCol = [6, 6, 10, 8];
		        var lockerStartNum = [1, 31, 61, 111];
		        var num = lockerStartNum[lockerNum];
		        var htmlVal = "";
		
		        //console.log(target.innerHTML);
		        for(var floor = 0; floor < 5;floor++){
		          for(var garo = 0; garo<lockerCol[lockerNum];garo++){
		            var locker = num + floor + 5*garo;
		
		            if(locker == selectedMyLocker){ //내가 신청한 사물함은 노란색에 disabled.
		              htmlVal += "<button class='mylocker' style='background-color:#FFDE00' disabled name='"+locker+"' "+"onClick='myclick(" + locker + ")'>" + locker + "</button>";
		            }
		            else if(selectedOthersLocker.indexOf(locker)!==-1){//다른 사람이 선택한 사물함은 파란 색에 disabled.
		              htmlVal += "<button class='mylocker' style='background-color:blue; color:white;' disabled name='"+locker+"' "+"onClick='myclick(" + locker + ")'>" + locker + "</button>";
		            }
		            else{//신청 가능한 사물함은 하얀색.
		              htmlVal += "<button class='mylocker' name='"+locker+"' "+"onClick='myclick(" + locker + ")'>" + locker + "</button>";
		            }
		          }
		          htmlVal += "<br>"
		        }
		        htmlVal += "</div>";
		        target.innerHTML = htmlVal;
		      }
		
		      //초기화 함수. 처음에 1번째 사물함 배치를 보여주며, 신청일인지 아닌지 판단한다. 
		      function init(){
		    	//0405
				//postmapping으로 해당 사물함을 신청할 수 있는지 판단.
				//lockerApplyPos 라는 값에 가능하면 1, 불가능하면 -1을 넣었다.
				 var possible = "${lockerApplyPos}";
				if(possible == 1){
			          var content = selectedMyLocker + "번 사물함 신청이 완료되었습니다.";
			          alert(content);
				}
				else if(possible == -1){
					var content = "이미 선택이 완료된 좌석입니다. 다른 좌석을 선택하세요.";
					alert(content);
				}
				
				//사물함 신청 버튼.
			    var applyBtn = document.querySelector("#applyBtn");

		        showLocker(0);
		        /*var isDay = document.querySelector(".regiDay");
		        var year = new Date().toISOString().slice(0,4);
		        var month = new Date().toISOString().slice(5,7);
		        var day = new Date().toISOString().slice(8, 10)
		
		        console.log(year);
		        console.log(month);
		        console.log(day);
		
		        //아니면 굳이 이렇게 하지않고 날짜가 되면 관리자가 바꿔줘도 될듯..
		        //여기에 사실 함수(날짜가 맞는지 확인하는 함수 등..)
		        if(1){
		          isDay.innerHTML = "오늘은 신청일 입니다.";
		        }
		        else
		        {
		          isDay.innerHTML = "오늘은 신청일이 아닙니다.";
		          applyBtn.disabled = "true;"
		          //사실 신청하기 버튼도 비활성화 해야하는 걸로 압니다. 이거 날짜 어떻게 하지..?
		        }*/

		        //로그인을 하지 않았다면 사물함을 신청할 수 없다.
		        if(my_id == "-1"){
		        	applyBtn.disabled = "true;"
		        	applyBtn.innerText = "로그인이 필요합니다";
		        	console.log("아직 로그인을 하지 않았어요.");
		        }
		        else if(my_id === "admin"){
		        	applyBtn.disabled = "true;"
		        	applyBtn.style.backgroundColor="grey";
		        	applyBtn.innerText = "관리자";
		        }
		        else{
					//로그인 한 학생인데 신청일이 아닐 때.
					if(dt === 0){
						applyBtn.disabled = "true;"
						applyBtn.style.backgroundColor="grey";
						applyBtn.innerText = "신청일 아님";
					}		        	
		        }
		        
		        //취소되는 거를 동일 버튼이 처리하게 하고싶었다.
		        if(isSelpos == 0 && dt === 1){ //어차피 신청을 했어야 이 값이 0이 되는 거라 위의 if에 영향 없음.
		        	applyBtn.innerText = "취소하기";
		        	//applyBtn.disabled = "false;"
		        	//삭제기능 안쓰려면 여기1
			        var content = document.querySelector(".modal-ask");
			        content.innerHTML = "사물함 신청을 취소하시겠습니까?";//selNum+"번 사물함을 신청하시겠습니까?";
			        console.log("사물함 사물함22~");
		        }
		      }
		
		      //실제 데이터베이스에 저장합니다.
		      function saveDatabase(lockerid, studentid){
		    	  var form = document.createElement("form");
		    	  form.setAttribute("method", "Post");
		    	  form.setAttribute("action", "applyLocker");
		    	  
		    	  var hiddenField = document.createElement("input");
		    	  hiddenField.setAttribute("name", "lockerId");
		    	  hiddenField.setAttribute("value", lockerid);
		    	  form.appendChild(hiddenField);
		    	  
		    	  hiddenField = document.createElement("input");
		    	  hiddenField.setAttribute("name", "studentId");
		    	  hiddenField.setAttribute("value", studentid);
		    	  form.appendChild(hiddenField);
		    	  document.body.appendChild(form);
		    	  form.submit();
		    	  
		    	  //다른 방법이 있는지 모르겠는데 결국 리다이렉트를 한 후에 알려줌.
		      }
		      
		      //생각해보니 어차피 redirect를 할거라 서버에서 보면 필요없는 함수다.
		      function selectMyLocker(num){
		        var myLocker = document.getElementsByName(num);
		        
		        //리다이렉트 후에 색을 바꿀거라 색 변경 바로 안했다.
		        //myCabi[0].style.backgroundColor="yellow";
		
		        //선택을 완료했으면 변경 못하도록 disabled를 시킨다.
		        //얘도 데이터베이스에서 가져와서 하기 떄문에 필요 없다..
		        myLocker[0].disabled = "true";
		        
		        saveDatabase(num, my_id);
		      }
		
		      //200411. 삭제.
		      //flow를 정리해보자면, 맨 처음에 내가 선택한 좌석이 있으면(isSelpos 값에 따라)
		      //취소하기 버튼이 보인다. 이 버튼을 클릭하면 모달이 뜨도록 모달 내에서 설정이 돼있는데
		      //거기에 나오는 텍스트를 init에서 바꿔줌.
		      //그리고 '예'를 선택하면 myAlert 함수를 부르는데 isSelpos 값에 따라서
		      //deleteMyLocker를 하든가 selecMyLocker를 호출해 saveDatabase를 부르든가 한다.
		      function deleteMyLocker(lockerid){
		    	  console.log("delete my locker");
		    	  console.log(typeof(lockerid));
		    	  lockerid *=1;//숫자로 바꿔야되니까...
		    	  console.log(typeof(lockerid));
		    	  
		    	  var form = document.createElement("form");
		    	  form.setAttribute("method", "Post");
		    	  form.setAttribute("action", "cancelLocker");
		    	  
		    	  var hiddenField = document.createElement("input");
		    	  hiddenField.setAttribute("name", "lockerid");
		    	  hiddenField.setAttribute("value", lockerid);
		    	  form.appendChild(hiddenField);
		    	  
		    	  document.body.appendChild(form);
		    	  form.submit();
		    	  
		    	  alert("사물함 신청 취소를 완료했습니다.");
		      }
		      
		      //사물함 신청 시 경고창.
		      function myAlert(){
		        if(isSelpos == 0){
		          //alert("이미 사물함 신청을 완료했습니다.");
		          
		          //삭제기능 안하려면 여기. 위에거 주석 해제하고.
		          //나중에 변수명이랑 이런 거 다 손봐야겠음. cabi라고 한 것도 고쳐야될 것 같고
		          //그리고 저 밑에는 selNum을 굳이 할 필요가 없지 않나 싶어서.. 하지만 난리날 것 같아서 일단 놔둠.
		          deleteMyLocker(selectedMyLocker);
		          
		          return ;
		        }
		
		        if(selNum != -1){
				  //var content = selNum + "번 사물함 신청이 완료되었습니다.";
		          //alert(content);
		        	
		          selectMyLocker(selNum);//saveDatabase로 redirect가 된다.

		          //내가 신청한 사물함 번호를 저장한다.
		          //얘도 마찬가지..ㅋㅋ 서버에서 할 땐 의미없다. 새로고침하면 없어짐. 여기서 저장한건.
		          selectedMyLocker = selNum;
		         
		         //0405. redirect 완료 전에 값을 가져올 수 없어서 결국 다 주석처리함.
		         /*var possible = "${lockerApplyPos}";//과연 이게 될 것인가. 안됩니다...
		         if(possible == 1){
		          var content = selNum + "번 사물함 신청이 완료되었습니다. 오바오바";
		          alert(content);
		         }
		         else if(possible== -1){
		         	var content = "이미 신청 완료된 좌석입니다. ㅇㅇ..";
		         	alert(content);
		         }
		         else if(possible == 0){
			          var content = "아니 설마 여기라구요..????";
			          alert(content);
		         }*/
		         
		          //함수를 호출하고나서야 하는걸로 일단 바꿔봤습니다.
		          //이것도 사실 나중에서는 필요없는 거 아니니?
		          selNum = -1;
		          isSelpos = 0; //더이상 선택 불가입니다.		          
		        }
		        else
		        {
		          alert("아직 사물함이 선택되지 않았습니다. 사물함을 선택해주세요.");
		        }
		      }
		
		      //모달 내용도 바꿀 수 있네요..^0^
		      /*function cancelLocker(){
		        var content = document.querySelector(".modal-ask");
		        content.innerHTML = "사물함 신청을 취소하시겠습니까?";//selNum+"번 사물함을 신청하시겠습니까?";
		        console.log("사물함 사물함22~");
		      }*/
		
		      //처음에 함수를 호출.
		      init();
		      //if(isSelpos == 0) cancelLocker();
		
		      /*
				해야할 것. 오늘은 03 30 
				-로그인 구현해서 신청했을 때 데이터베이스에 저장되고 내 사물함 노란색으로 바꾸는 거.
				다른 사람들에게는 파란색으로 보이겠지만 나한테는 노란색으로 보여야 해.
				생각해보니 if문으로 다 쓴게 아니고 if, else if 이렇게 써놓아서 문제 생길 것 같지는 않음.
				
				-그리고 로그아웃하면 그냥 파란색으로 보이면 되는건가..
				
				-로그인하면 로그인 한 정보를 가져와서 디비에 있는지 확인해야겠네. 대충 그려보면.
				아 근데 또 엄청 험난함이 예상된다 ㅋㅋㅋㅋㅋ..미치겠네.
				
				-신청하면 남은 좌석 개수 바꾸기.
				
				호호 다했네요.
				
				오늘은 4월 2일
				위에서 말한 거 다 했고.
				이걸 근데 진짜 다른 사람들이 다 쓸 수 있도록 하는 건 어떻게 하는거지?
				그리고 우리가 같은 데이터베이스를 써야되는데 어떻게 해야하는걸까?
				그리고 동시성 제어요.
				팀원들끼리는 데이터베이스 속성 값에 대해서 이야기를 해야될 것 같구요.
				
				오늘은 4월 5일
				동시성 제어했다.	이 말이 맞는지는 모르겠지만...
				아무튼 다른 사람이 먼저 자리 신청하면 신청 안되도록 했음.
				redirect 후에 화면을 확인할 수밖에 없는 게 아쉽지만 값 저장이 안되어서.
				그럴 수 밖에.
		      */
		
		      function popup(){
					console.log("팝업창을 띄우고싶다.");
					window.open("loginform2", "a", "width=400, height=200, left=100, top=50");
				}
		      
		      //모두 삭제하기 버튼
		      function deleteAll(){
		    	  var form = document.createElement("form");
		    	  form.setAttribute("method", "Post");
		    	  form.setAttribute("action", "deleteAllLocker");

		    	  document.body.appendChild(form);
		    	  form.submit();
		      }
		      
		      //---안씀---
		      function updateLockerDay(){
					var info = document.querySelector(".lockerday").innerText;
					console.log(info);
					
					var form = '<form action="updateLockerDay" method="post"> <div class="inputWrap"> <input type="hidden" name="area" value="lockerDay">';
					form += '<div> <span> 내용 </span> <textarea cols="15" rows="2" name="content">';
					form += info;
					form += '</textarea><br/></div> </div>';
					form += '<input type="submit" value ="수정 완료"> </form>';	    
				    
				    var target = document.querySelector(".lockerday");
				    target.innerHTML = form;
		      }
		      
		    </script> 

			<script>
				$('.logBtn').click(function(e){
					$('#log').modal('show');
					console.log("아니 좀 띄우라고~~~~ 이자식아~~~")
				});
			</script>

<!--  제이쿼리 -->
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
