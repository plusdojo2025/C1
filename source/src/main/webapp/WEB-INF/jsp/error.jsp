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
	  <link rel="icon" href="images/favicon1.ico" id="favicon">
</head>
<body>
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<!--<jsp:include page="Mindshift_navigation.jsp" />-->
		<!-- ヘッダー（ここまで） -->
		
		<main>
		 <div  class="main">
		     <u><h2 style="text-align:center;"><c:out value="${systemError.title}"/></h2></u>
		     <p></p>
		     <p></p>
		     <p></p>
		     <p></p>
		     <p class="nav1"><c:out value="${systemError.message}" /></p>
		     <p class="nav2"><a href="${systemError.backTo}">ホームに戻る</a></p>
	    </div>
	
	
		</main>

		<!-- フッター（ここから） -->
		<jsp:include page="Mindshift_footer.jsp" />

		<!-- フッター（ここまで） -->
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/template.js"></script>

</body>
</html>