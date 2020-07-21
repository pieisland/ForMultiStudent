<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.or.multi.multiCommunity.dto.Locker" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

안되면 안된다고 보여주기라도 해줘..
데이터베이스 결과 나왔으면 좋겠다.

<c:forEach items="${list}" var="locker">
	${locker.lockerId }<br>
	${locker.studentId }<br>
</c:forEach>

<%
	List<Locker> li= (List<Locker>)request.getAttribute("list");
	int val;
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


<script>
	var sid= "<%=sid %>";
	var lid = "<%=lid%>";
	var selected = [];
	sid = sid.split(" ");
	lid = lid.split(" ");
	for(var i = 0;i<sid.length;i++){
		//console.log(sid[i]);
		//console.log(lid[i]);
		
		//자바스크립트에서 스트링을 숫자로 변환하기.
		selected.push(parseInt(lid[i]));
	}
	
	//for(var i =0;i<selected.length;i++){
	//	console.log(selected[i]);
	//}
	
	for(var i = 0;i<30;i++){
		if(selected.indexOf(i)!=-1){
			var number = selected.indexOf(i);
			console.log(selected[number] + "번 사물함은 이미 선택되었어요.");
		}
		//console.log(i+": ");
		//console.log(selected.indexOf(i));
	}

</script>


</body>
</html>