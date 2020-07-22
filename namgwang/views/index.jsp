<!-- 0. 남광. 여기는 서버관련해서 필요해서 추가했어. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 0. 여기까지. -->

<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>♥멀끼리♥</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<!-- <link rel="stylesheet" href="assets/css/merge.css" /> -->

		<link rel="stylesheet" href="resources/assets/css/myboot.css" />
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->

		<!-- 부가적인 테마 -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	
		<!-- 1. 남광. 제이쿼리 추가. -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<!-- 여기까지. -->

		<style>
			.elephant{
				width:30%;
				margin:0 auto;
				text-align:center;
			}
			
			.line{
				
				width:100%;
				border: thin solid black;
				float:left;
				
			}
		</style>
	
	</head>
	<body class="is-preload right-sidebar">
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
									<li>
										<a href="#">신청</a>
										<ul>
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
										<!-- <a href="#myModal" role="button" class="btn btn-default" data-toggle="modal" >로그인</a> -->
										
										<!-- 2. 남광. 로그인 상태에 따라 로그인 버튼이 뜨거나 로그인 된 사람 이름이 뜸. -->
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
										    </c:otherwise>
										</c:choose>	
										<!-- 2. 여기까지. -->
									</li>									
								</ul>
							</nav>
					</header>
				</div>

<!-- 				로그인 모달 
				<div class = "modal fade" id = "loginModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">x</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>
							<div class = "modal-body">
								<p>모달 몸체</p>
							</div>
							<div class = "modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal"></button>
							</div>
							</div>
						</div>
					</div>
				</div> -->

<!-- Banner -->
				<!-- <div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="col-7 col-12-medium">
								<h2>Hi. This is Verti.</h2>
								<p>It's a free responsive site template by HTML5 UP</p>
							</div>
							<div class="col-5 col-12-medium">
								<ul>
									<li><a href="#" class="button large icon solid fa-arrow-circle-right">Ok let's go</a></li>
									<li><a href="#" class="button alt large icon solid fa-question-circle">More info</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div> -->


<!-- Caraousel -->
<div id="carousel-example-generic" class="carousel slide container" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
    	<a href ="https://www.naver.com">
      		<img src="resources/images/pic02.png" alt="01">
  		</a>
      <div class="carousel-caption">
        01
      </div>
    </div>
    <div class="item">
    	<a href ="https://www.naver.com">
      <img src="resources//images/pic02.png" alt="02">
  </a>
      <div class="carousel-caption">
        02
      </div>
    </div>
    <div class="item">
    	<a href ="https://www.naver.com">
      <img src="resources/images/pic02.png"alt="03">
  </a>
      <div class="carousel-caption">
        03
      </div>
    </div>
    <div class="item">
    	<a href="https://www.naver.com">
      <img src="resources/images/pic02.png"alt="04">
  </a>
      <div class="carousel-caption">
        04
      </div>
    </div>
    <div class="item">
    	<a href ="https://www.naver.com">
      <img src="resources/images/pic01.png"alt="06"> </a>
      <div class="carousel-caption">
        05
      </div>
    </div>
  </div>

  <!-- Controls -->
  <!-- <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> -->
  	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

			<!-- Features -->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<div class="inner image featured">
											<img src="resources/images/locker.png" alt=""/>
											<header>
												<h2>사물함 신청</h2>
											</header>
											<p>2020.03.20 오전 10시<br>신공학관 4층<br>위치확인 필수</p>

										</div>
											<a href="#"><img src="resources/images/main_button.png"/></a>

									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<div class="inner image featured">
											<img src="images/mt.png" alt=""/>
											<header>
												<h2>MT 신청</h2>
											</header>
											<p>2020.04.11 - 04.12<br>대성리 **펜션<br>기한 내 입금 필수</p>

										</div>
											<a href="#"><img src="images/main_button.png"/></a>

									</section>

							</div>
								<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<div class="inner image featured">
											<img src="images/sutdentcouncil.png" alt=""/>
											<header>
												<h2>학생회 신청</h2>
											</header>
											<p>2020.03.10<br>역할 소개 확인 후 선호 부서 선택</p>
										</div>
											<a href="#"><img src="images/main_button.png"/></a>

									</section>

							</div>
						</div>
					</div>
				</div>

			<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-5 col-12-medium">
											<h3 class="title_color">건의사항</h3>
											<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">건의사항 1</a>
											</div>
											<div class="col-3 gray_color">
												익명1
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">건의사항 2</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">건의사항 3</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.13
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">건의사항 4</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">건의사항 5</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>
							</div>

							<div class = "col-1">

							</div>
							<div class="col-5 col-12-medium">

								<h3 class = "title_color">자유게시판</h3>
											<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">최신글 1</a>
											</div>
											<div class="col-3 gray_color">
												익명1
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">최신글 2</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">최신글 3</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.13
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">최신글 4</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>

										<div class = "row index_table">
											
											<div class = "col-7">
												<a href="#" class="black_color">최신글 5</a>
											</div>
											<div class="col-3 gray_color">
												작성자
											</div>
											<div class="col-2 gray_color">
												2020.04.10
											</div>
										</div>
							</div>
						</div>
					</div>
				</div>
	
				<!-- 3.남광. 큰 화면에서의 로그인 모달. -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">로그인 </h4>
				      </div>
				      <div class="modal-body">				        
						 <div class="formWrap">	
							<form action="login" method="post" id="myform">
						        <input type="hidden" name="nowpage" value="index">
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
			
			    <!-- 로그인 제이쿼리 Modal -->
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
						        <div class="formWrap">	
									<form action="login" method="post" id="myform">
								        <input type="hidden" name="nowpage" value="index">
								        <div class="inputWrap">
								            <div class="email">
								                <span> 학번 </span> <input type="text" name="studentid"><br/>
								            </div>
								            <div class="password">
								                <span> 이름 </span> <input type="text" name="studentname"><br/>
								            </div>
								        </div>
								        <!--  <input class="sendbtn" type="submit" value ="로그인">-->
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
				<!-- 4. 여기까지. -->
				
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

<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button> -->

		<!-- Scripts -->
		
			<!-- 5. 남광. 자바스크립트로 모달 띄우기. -->
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
		    <!-- 여기까지야. -->

			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js?ver=123"></script>
			<script src="resources/assets/js/main.js"></script>
			<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</body>
</html>
