<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ページ名 | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/explain.css">
    <link rel="icon" href="images/favicon1.ico" id="favicon">
</head>
<body>
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<jsp:include page="Mindshift_navigation.jsp" />
		<!-- ヘッダー（ここまで） -->

		<main class="main">
		 <u><h2 style="text-align:center;">MindShift</h2></u>
			<!--アプリについて -->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[0].title}" /></h3>
		      <p><c:out value="${explainList[0].content}" /></p>
		    </div>
			
		 <u><h2 style="text-align:center;">使い方</h2></u>
			<!-- ホーム-->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[1].title}" /></h3>
		      <p><c:out value="${explainList[1].content}" /></p>
		    </div>
		    
		    <!-- 植物-->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[2].title}" /></h3>
		      <p><c:out value="${explainList[2].content}" /></p>
		
		        <h3 style="text-align:center;">植物の育ち方</h3>
		        <img src="${pageContext.request.contextPath}/image/枠あり育ち方.png" class="images" alt="植物の育ち方">
		
		        <h3 style="text-align:center;">植物の種類</h3>
		        <img src="${pageContext.request.contextPath}/image/枠あり種類.png" class="images" alt="植物の種類">
		    </div>
		    
		    <!-- 感情登録-->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[3].title}" /></h3>
		      <p><c:out value="${explainList[3].content}" /></p>
		
		        <h3 style="text-align:center;">感情スタンプ</h3>
		        <img src="${pageContext.request.contextPath}/image/枠ありスタンプ.png" class="images" alt="スタンプ">
		    </div>
		    
		    <!-- 記録一覧-->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[4].title}" /></h3>
		      <p><c:out value="${explainList[4].content}" /></p>
		    </div>
		    
		    <!-- アカウント-->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[5].title}" /></h3>
		      <p><c:out value="${explainList[5].content}" /></p>
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