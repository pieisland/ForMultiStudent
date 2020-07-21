<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>	
		.formWrap {
			border:1px solid red;
			width:250px;
			margin:0 auto;
		}
	</style>


</head>
<body>

 <div class="formWrap">	
	<form action="login2" method="post" id="myform">
	<!--  나중에 action값을 홈으로 바꿔야겠죠..?  근데 일단 내 페이지로 해둘게용.. 흑.-->
        <div class="inputWrap">
            <div class="email">
                <span> 학번 </span> <input type="text" name="studentid"><br/>
            </div>
            <div class="password">
                <span> 이름 </span> <input type="text" name="studentname"><br/>
            </div>
        </div>
        <input class="sendbtn" type="submit" value ="로그인">
    </form>
 </div>

	<input type="button" value="이동 후 닫기" onclick="moveClose();" />

	<section class="result"></section>
	
	<!-- 플래시맵에 저장한 값입니다. -->
	${errorMessage}<br>
	
	<script>
	
	/*
		로그인 판업창으로 바꾸려고 시도하는 부분. 팝업창 테스트 클릭했을 때 연결되는 페이지임.
	*/
	
	
		var btn = document.querySelector(".sendbtn");
		var result = document.querySelector(".result");
		btn.addEventListener("click", function(evt) {
		    evt.preventDefault();
		    var sidValue = document.querySelector("[name='studentid']").value;
		    var bValid = (/\d{10}/).test(sidValue);
		    if(!bValid)  { 
  		      result.innerHTML = "올바르지 않은 학번입니다";
  		      console.log("틀렸어여..");
		    } else {
        		result.innerHTML = "학번 정보가 올바릅니다~";
        		document.querySelector("#myform").submit();
	  			//window.opener.location.reload(); 
				//self.close();
 		   }
		});

		function closeme(){
			console.log("닫았다궁");
			  self.close();
		}
		
		function moveClose(){
			  
			  document.querySelector("#myform").submit();
			  //opener.location.href="locker";
			  //self.close();
			  
			  //window.opener.location.reload(); //얘는 잘 안되는데
			  //opener.location.href="locker";//얘는 잘 안됨.
			//정보 전달 전에 꺼짐.
			  
				//session에 값이 저장되기 전에 가져온 것 같음. 그래서 있다는 게 판단이 안됨..
				//결국 팝업창에서 이동함..;
				<c:if test="${sessionScope.isAdmin == 'true'}">
				//window.opener.location.reload(); 	
				opener.location.href="locker";
					self.close();
				</c:if>
			  //어떻게 받아들여야 되는건데..?
			  /*window.setTimeout(function() {
				  console.log("dd");
				  self.close();
			  }, 1000);*/
			  //window.setTimeout(closeme(), 5000);
		}
	</script>


</body>
</html>