<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.Locker" %>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>옮겨봅시다</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<link rel="stylesheet" href="resources/assets/css/myboot.css"/>

<!--
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
-->
    <style>
/* 
.mycontainerfluid{
	  padding-right: 15px;
  padding-left: 15px;
  margin-right: 5%;
  margin-left: 5%;
}


	.mycontainer{
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
	}

		.myrow{
  margin-right: -15px;
  margin-left: -15px;
		} */
		
		.elephant{
			width:30%;
			margin:0 auto;
			text-align:center;
		}		

      .frame{
        border:1px solid transparent;
        height: 400px;
        margin-bottom: 50px;
      }

      nav{
       height: 100px;
      }

      .notice{
        padding:0px;
        margin-bottom: 10px;
      }

      .cabinet-preview{
        height: 200px;
        margin:10px;
        background-color: #DFDFDF;
      }

      .selection-info{
        height:80px;
        background-color: #888888;
      }
      .selection-window{
        height:320px;
        background-color:#E7E7E7;
      }

      .sel-win{
        width:420px;
        margin:0 auto;
        margin-top:50px;
      }

      .cabinet{
        margin:5px;
        height:50px;
        text-align:center;
        color:white;
        background-color: #070289;
        cursor: pointer;
      }

      .mycabinet{
        width:35px;
        height:35px;
        margin:3px;
        border:1px solid grey;
        outline:0;
        font-size:12px;
        background-color:white;
        display:inline-block;
        text-align: center;
        line-height:35px;
      }

      .mycabinet:hover{
        background-color: grey;
      }

      .mycabinet:active{
        background-color: red;
      }

      .modal-header{
        background-color:#070289;
        color:white;
      }

    </style>


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
											<li><a href="#">사물함 신청</a></li>
											<li><a href="#">MT 신청</a></li>
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
									<li class="login"><a href="no-sidebar.html">로그인</a></li>
								</ul>
							</nav>

					</header>
				</div>

			<!-- Main -->
				<div class="mycontainer" style ="background-color: white">
					<div class="myrow notice">
						<br>
				        <div class="mycol-md-10 mycol-md-offset-1 mycol-xs-12">
				          2020년 0학기 사물함 신청 / 신청일시 : 2020년 00월 00일 00시 <br>
				          <p class="regiDay"style="color:red">*오늘은 신청일 입니다.</p>
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
				            <div class="myrow cabinet-preview">
				                <div class="mycol-xs-12">
				                  <div class="myrow">
				                    <br>
				                    <br>
				                    <br>
				                  </div>

				                
				                  <div class="myrow"><!--두번쨰 줄이에요. -->
				                    <div style="margin:0 auto; width:260px"><!-- 중간에 두려고 이거 놔둔거에용.-->
				                      <div class="cabinet" id="cabi0" style="width:30px; height:50px; display:inline-block; cursor: pointer;" onclick="showCabi(0)">1</div>
				                      <div class="cabinet" style="width:40px; height:50px; display:inline-block; background-color: #8FC8ED">-</div>
				                      <div class="cabinet" id="cabi1" style="width:30px; height:50px; display:inline-block; cursor: pointer;" onclick="showCabi(1)">2</div>
				                      <div class="cabinet" id="cabi2" style="width:50px; height:50px; display:inline-block; cursor: pointer;" onclick="showCabi(2)">3</div>                      
				                      <div class="cabinet" id="cabi3" style="width:40px; height:50px; display:inline-block; cursor: pointer;" onclick="showCabi(3)">4</div>
				                    </div>
				                  </div>
				                </div>
				            </div>

				            <div class="myrow" style="margin-top:30px; margin-left:10px; margin-right:10px;">
				              <div class="mycol-xs-4">
				                <button type = "button" data-toggle="modal" class="btn btn-danger btn-block" href="#" role="button" data-target="#attention">주의사항</button>
				              </div>
				              <div class="mycol-xs-8">
				                <button type = "button" data-toggle="modal" class="btn btn-primary btn-block" type="submit" data-target="#applyCabinet">사물함 신청하기</button>
				              </div>
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
				                      <!--날짜 정보가 들어가야합니다.-->
				                      [사물함 신청 안내 및 주의사항]
				                      -학생회비 납부자에 한해 무료입니다.<br>
				                      	휴학생과 학생회비 비납부자에게는  사물함 배정을 하지 않습니다.<br><br>

				                      -연장을 원하는 경우, <br>
				                      	동일 좌석을 선택하시면 됩니다.<br><br>

				                      -현재 사물함을 이용중인 사람들은  00까지 자진 철거 부탁합니다.<br>
				                      	집행부 철거가 00일에 진행 될 예정입니다.

				                   </div>
				                   <div class="modal-footer">
				                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				                   </div>
				                 </div>
				               </div>
				             </div>

				              <!--..아 모달이 필요한가 생각해보니까.. 그냥 알러트 하면 되는 거 아님?
				                암튼 일단은 신청 모달임.-->
				            <div class="modal fade" id="applyCabinet" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				              <div class="modal-dialog">
				                <div class="modal-content">
				                  <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                    <h4 class="modal-title" id="myModalLabel">사물함 신청</h4>
				                  </div>
				                  <div class="modal-body">
				                        사물함을 신청하시겠습니까?
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
				                <div style="width:20px; height:20px; background-color: yellow; display:inline-block"></div><span style="color:white; font-weight:bold"> 내 사물함</span>
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
		      //생각해보니 지금은 이렇게 만들지만.. 나중에 다른 사람이 선택한 좌석에 대해서는
		      //비활성화를 해놔야 되는거잖아..? 그럼 onclick함수를 쓰면 안되는건가?   		  
		    	  
		      var isSelpos = 1; //사물함을 이미 신청했는지 아닌지를 확인하기 위한 변수.
		      var selNum = -1; //이전에 선택한 개별 사물함 번호.
		      var selCabi = -1; //이전에 선택한 전체 사물함 번호.
		      var samePage = 0; //동일한 전체 사물함 번호여야 이전 값을 가져올 수 있다.
		      var selInfo = document.querySelector("#selInfo"); //몇 번 사물함인지를 알려주는 글 넣는 곳.
		      var selectedMyCabi = -1; //내가 선택하고 신청 완료한 사물함 번호 저장.
		      var selectedOthersCabi = []; //다른 사람들이 신청한 사물함 번호들 저장. db에서 받아와서 push로 넣어주면 될 것.
		
		      //데이터베이스 관련.
			  var sid= "<%=sid %>";
			  var lid = "<%=lid%>";
			//var selected = [];
			  sid = sid.split(" ");
			  lid = lid.split(" ");
			  for(var i = 0;i<sid.length;i++){
				//String으로 저장했기 때문에 숫자로 변환한다. 자바스크립트에서 문자열을 숫자로 변환하는 것은 parseInt를 쓴다.
				selectedOthersCabi.push(parseInt(lid[i]));
			  }
		     
		      //원하는 사물함 번호를 클릭했을 때 사물함의 색을 변경해준다.
		      function myclick(num){
		        console.log(num + "함수가 불렸어요ㅣ");
		        var b = document.getElementsByName(num);
		
		        //같은 페이지 내에 있어야 이전 값을 가져올 수 있다. 그래서 samePage가 1이어야만 한다.
		        if(selNum!=-1 && samePage==1){
		          var before = document.getElementsByName(selNum);
		          before[0].style.backgroundColor='white';
		        }
		
		        b[0].style.backgroundColor= 'red';
		        selNum = num;
		        samePage =1;
		        //중복 클릭했을 때 바꾸게 해주는 것도 할까요??
		      }
		
		      //사물함 배치도에서 선택한 사물함 번호를 노랑으로 바꾸고, 이전에 선택한 것을 남색으로 바꾼다.
		      function miniCabiChange(beforeSel, num){
		        var myId = "cabi" + num;
		        console.log(myId);
		
		        console.log(beforeSel)
		        if(beforeSel != -1){ //이전에 선택한 게 있다면
		          var beforeId = "cabi"+beforeSel;
		          var target = document.querySelector("#"+beforeId);
		          target.style.backgroundColor="#070289";
		        }
		
		        var target = document.querySelector("#"+myId);
		        console.log(target);
		        target.style.backgroundColor="yellow";
		      }
		
		      //선택한 사물함 배치도를 보여준다.
		      function showCabi(cabinetNum){
		
		        //오류를 막기 위해 다시 selNum을 초기화 하는 걸로 하자.
		        selNum = -1;
		        //////
		
		        var mycabinetNum = cabinetNum + 1 ;//0번부터라 1을 더해준다.
		        selInfo.innerHTML = mycabinetNum+ "번 사물함 배치도입니다.";
		
		        //사물함 배치도 색 변경.
		        miniCabiChange(selCabi, cabinetNum);
		        selCabi = cabinetNum;//배치 후 현재 사물함 번호를 저장한다. 후에 이전번호로 쓰인다.
		
		        console.log("선택한 사물함 배치 번호: " + cabinetNum);
		        //다른 화면으로 넘어왔음을 표시한다.
		        samePage = 0;
		
		        //각 사물함마다 크기가 달라서 중간에 보이기 위해서 다른 크기가 필요.
		        var cabiSizeTable = [255+20, 255+20, 420+20, 340+20];
		        console.log(cabinetNum);
		        var cabiSize = cabiSizeTable[cabinetNum] + "px";
		        console.log(cabiSize);
		
		        var target = document.querySelector(".sel-win");
		        target.style.width = cabiSize; //가로 크기를 변경해준다.
		
		        //사물함을 한 칸 한 칸씩 보여준다.
		        var cabinetCol = [6, 6, 10, 8];
		        var cabinetStartNum = [1, 31, 61, 111];
		        var num = cabinetStartNum[cabinetNum];
		        var htmlVal = "";
		
		        //나중에 disabled 필요한 애들은 db에서 번호 받아와서
		        //그 번호 값 있으면 따로 만들면 되겠지??
		        //음.. 이렇게 하면 안되나? ^0^ 동시성 처리 이상하게 되면 안되는데.
		
		        console.log(target.innerHTML);
		        for(var floor = 0; floor < 5;floor++){
		          for(var garo = 0; garo<cabinetCol[cabinetNum];garo++){
		            var cabi = num + floor + 5*garo;
		
		            if(cabi == selectedMyCabi){
		              htmlVal += "<button class='mycabinet' style='background-color:yellow' disabled name='"+cabi+"' "+"onClick='myclick(" + cabi + ")'>" + cabi + "</button>";
		            }
		            else if(selectedOthersCabi.indexOf(cabi)!==-1){//다른 사람이 선택한 캐비넷이라면
		              htmlVal += "<button class='mycabinet' style='background-color:blue; color:white;' disabled name='"+cabi+"' "+"onClick='myclick(" + cabi + ")'>" + cabi + "</button>";
		            }
		            else{
		              htmlVal += "<button class='mycabinet' name='"+cabi+"' "+"onClick='myclick(" + cabi + ")'>" + cabi + "</button>";
		            }
		          }
		          htmlVal+="<br>"
		        }
		        htmlVal +="</div>";
		        target.innerHTML= htmlVal;
		        //안먹네...ㅋㅋㅋ
		        //그러면 요소찾기해서 바꿔야되나..??
		      }
		
		      //초기화 함수. 처음에 1번째 사물함 배치를 보여주며, 신청일인지 아닌지 판단한다. 
		      function init(){
		        //여기서 다른사람이 선택한 사물함에 대한 정보를 가져와서 selectedOthersCabi에 넣어줘야 한다.
		        //내가 선택한 사물함 정보에 대해서도 마찬가지이다.
		
		        showCabi(0);
		        var isDay = document.querySelector(".regiDay");
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
		          //사실 신청하기 버튼도 비활성화 해야하는 걸로 압니다.
		        }
		      }
		
		      function selectMyCabi(num){
		        var myCabi = document.getElementsByName(num);
		        myCabi[0].style.backgroundColor="yellow";
		
		        //선택을 완료했으면 변경 못하도록 disabled를 시킨다.
		        myCabi[0].disabled = "true";
		      }
		
		      function myAlert(){
		        if(isSelpos == 0){
		          alert("이미 사물함 신청을 완료했습니다.");
		          return ;
		        }
		
		        if(selNum != -1){
		          var content = selNum + "번 사물함 신청이 완료되었습니다.";
		          alert(content);
		          selectMyCabi(selNum);
		
		          //내가 신청한 사물함 번호를 저장한다.
		          selectedMyCabi = selNum;
		
		          selNum = -1;
		          isSelpos = 0; //더이상 선택 불가입니다.
		        }
		        else
		        {
		          alert("아직 사물함이 선택되지 않았습니다. 사물함을 선택해주세요.");
		        }
		      }
		
		      //이제 의미없는 함수이다. 모달 내의 글을 변경해보려 했으나 되지 않았다.
		      function func(){
		        var content = document.querySelector(".modal-body").innerHTML;
		        content = selNum+"번 사물함을 신청하시겠습니까?";
		        console.log("사물함 사물함~");
		      }
		
		      //처음에 함수를 호출.
		      init();
		
		      /*
		        문제가 몇 개 있다.
		        1번전체사물함에서 다른 걸 선택하고 3번 사물함에 가서 선택 없이 신청을 하면 신청이 완료됐다고 뜬다.
		        selNum 값이 남아있어서 그래. 이걸 없어애될까?
		
		
		        사물함 신청한 거를 다시 showcabi로 할 때 흰색으로 나온다.
		        이거야 번호 가져와서 하면 되는거기는 한데..
		      */
		
		    </script> 

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>

	</body>
</html>
