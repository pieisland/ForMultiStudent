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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
	</head>
	<body class="is-preload no-sidebar">
	
	<%
		String area = (String)request.getAttribute("area");
		String mtTitle = (String)request.getAttribute("mtTitle");
		String mtContent = (String)request.getAttribute("mtContent");
		//mtContent = mtContent.replaceAll("\n", "<br/>");
		
		//200627	
		String mtimgpath = (String)request.getAttribute("mtimgpath");
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
							<h2>MT 신청 수정</h2>
						</div>
					</div>
				</div>

				<div class="mycontainer" style ="background-color: white">
					<div class = "myrow">
						<!-- 딱 붙이고싶으면 mycol-xs-12만 남기고 지우면 됩니다. -->
						<div class = "mycol-md-10 mycol-md-offset-1 mycol-xs-12">
						<!-- 200627 이미지 바꾸는 것까지 넣으려면.. form data를 넣어야할 것 같아서 넣기는 했는데.. 사실 될 지 모르겠네요. -->
							<form name="mtdatetime" action="updatemtdate" method="post" enctype="multipart/form-data">
								<input type="hidden" name="area" value=<%=area %>>
								<br>
								제목 <input type="text" name="title" value="<%=mtTitle%>"><br>
								신청 시작
								<input type='date' name="startDate">
								<input type='time' name="startTime">
								
								신청 마감
								<input type='date' name="endDate">
								<input type='time' name="endTime">
								<br><br><br>
								
								<!-- 얘는.. 줄맞추기를 하면 안되는 애구나. textarea 영역 연 이후부터 다 따지는 거임.... -->
								<textarea cols="10" rows="10" name="content"><%=mtContent%></textarea>
								
								<!-- 얘는 띄어쓰기가 안되구요... 
								<%=mtContent%>
								-->
								<br>
								<!-- 200627 -->
								이미지(선택하지 않을 경우 기존에 설정한 이미지로 저장됩니다.)
								<input type="file" name="file" id="gdsImg"><br>
									<div class="select_img"><img src="" /></div>							   
		 							<input type="hidden" name="pastimg" value="${mtimgpath}"> 
		 					       
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
								
								<br><br>

								<input type="button" value="수정 취소" onclick="location.href='mt'">
								<input type="submit" value ="수정 완료"> 
							</form>
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
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>

		<script>
		//내 함수
		
		</script>

    	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</body>
</html>