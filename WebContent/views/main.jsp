<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<script>
function init() {
	var accessForm = document.getElementById("accessForm");
	var loginForm = document.getElementById("loginForm");
	var userInfo = document.getElementById("userInfo");
	var userGeneralInfo = document.getElementById("userGeneralInfo");
	var state = '${mbid}';

	if (state == "") {
		accessForm.style.display = "block";
		loginForm.style.display = "block";
		userInfo.style.display = "none";
		userGeneralInfo.style.display = "none";
	} else {		
		accessForm.style.display = "none";
		loginForm.style.display = "none";
		userInfo.style.display = "block";
		userGeneralInfo.style.display = "block";
	}
}
</script>
</head>
<body onLoad="init()">
	<%@ include file="nav.jsp"%>
	<div id = "userMainInfo">
		${userMainInfo }
	</div>
	<div id="userInfo">
		<table>
			<tr>
				<td>${userInfo }</td>
			</tr>
		</table>
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>발생일</th>
					<th>정보명</th>
					<th>상세설명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="history" items="${history}">
					<tr>
						<td>${history.mbid}</td>
						<td>${history.date}</td>
						<td>${history.info}</td>
						<td>${history.comment}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="loginfo">
		<table>
			<tr>
				<td>${userInfo }</td>
			</tr>
		</table>
	</div>
	<form action="Mail" method="post">
		<input type="submit" value="메일 보내기">
	</form>
</body>
</html>