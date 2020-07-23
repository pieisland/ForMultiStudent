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
	<form action="login" method="post" id="myform">
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

	<section class="result"></section>
	
	<!-- 플래시맵에 저장한 값입니다. -->
	${errorMessage}<br>
	
	<script>
		var btn = document.querySelector(".sendbtn");
		var result = document.querySelector(".result");
		btn.addEventListener("click", function(evt) {
		    evt.preventDefault();
		    var sidValue = document.querySelector("[name='studentid']").value;
		    
		    //200414
		    //관리자도 로그인을 동일하게 하나..? 모르겠지만..;
		    //만약에 동일한 곳에서 로그인을 한다면..
		    if(sidValue ==="admin"){
		    	result.innerHTML = "관리자입니다.";
		    	document.querySelector("#myform").submit();
		    }
		    else{
			    var bValid = (/\d{10}/).test(sidValue);
			    if(!bValid)  { 
	  		      result.innerHTML = "올바르지 않은 학번입니다";
	  		      console.log("틀렸어여..");
			    } else {
	        		result.innerHTML = "학번 정보가 올바릅니다~";
	        		document.querySelector("#myform").submit();
	 		   }
		    }
		});

	</script>


</body>
</html>