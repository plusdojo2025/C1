<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>エラー | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/error.css">
<link rel="icon" href="image/favicon1.ico">
<style>
@import url('https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap');
</style>
</head>
<body>

	<!-- ヘッダー（ここから） -->
		<div id="logo">
		<img src="${pageContext.request.contextPath}/image/logo_slogan.png"
			alt="LOGO" width="300" height="300" style="margin-top: -30px; margin-bottom: -40px;">
	</div>
	<p class="bar"></p>
	<!-- ヘッダー（ここまで） -->
	<div class="wrapper">

		
		<main>
		 <div  class="main">
		     <h2 style="text-align:center;"><c:out value="${systemError.title}"/></h2>
		     <p></p>
		     <p></p>
		     <p></p>
		     <p></p>
		    <div class="content">
		     <p class="nav1"><c:out value="${systemError.message}" /></p>
		     <p class="nav2"><a href="${systemError.backTo}">ホームに戻る</a></p>
	        </div>
	    </div>
	
	
		</main>

	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/template.js"></script>
	
	<!-- フッター（ここから） -->
	<jsp:include page="Mindshift_footer.jsp" />
	<!-- フッター（ここまで） -->
</body>
</html>