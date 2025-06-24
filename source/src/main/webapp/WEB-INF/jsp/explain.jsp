<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>各種説明 | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/explain.css">
    <link rel="icon" href="image/favicon1.ico" id="favicon">
<style>
@import url('https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap');
</style>
</head>
<body>
   	<!-- ヘッダー（ここから） -->
	<jsp:include page="Mindshift_header.jsp" />
	<jsp:include page="Mindshift_navigation.jsp" />
	<!-- ヘッダー（ここまで） -->
	<div class="wrapper">
		<main class="main">
		 <h2 style="text-align:center;">MindShift</h2>
			<!--アプリについて -->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[0].title}" /></h3>
		      <p><c:out value="${explainList[0].content}" /></p>
		    </div>
			
		 <h2 style="text-align:center;">使い方</h2>
			<!-- ホーム-->
		    <div class="section">
		      <h3 style="text-align:center;"><c:out value="${explainList[1].title}" /></h3>
		      <p><c:out value="${explainList[1].content}" /></p>
		    </div>
		    
		    <!-- 植物-->
		 <div class="section1">
		      <h3 style="text-align:center;"><c:out value="${explainList[2].title}" /></h3>
		      <p><c:out value="${explainList[2].content}" /></p>
		   
				
		   <div>
		        <h3 style="text-align:center;">植物の育ち方</h3>
		        <div><img src="${pageContext.request.contextPath}/image/枠あり育ち方.png" class="images" alt="植物の育ち方"></div>
		  </div>	
				
		  <div>
		        <h3 style="text-align:center;">植物の種類</h3>
		        <div><img src="${pageContext.request.contextPath}/image/枠あり種類.png" class="images" alt="植物の種類"></div>
		  </div>
		</div> 
		  
		    
		    <!-- 感情登録-->
		    <div class="section2">
		      <h3 style="text-align:center;"><c:out value="${explainList[3].title}" /></h3>
		      <p><c:out value="${explainList[3].content}" /></p>
		    
		     
		     <div>   
		        <h3 style="text-align:center;">感情スタンプ</h3>
		        <div><img src="${pageContext.request.contextPath}/image/枠ありスタンプ.png" class="images" alt="スタンプ"></div>
		     </div>
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
		      <img src="${pageContext.request.contextPath}/image/original_char.png" id="char" alt="キャラクター">		
		    </div>
		    
		    <!-- オリジナルキャラクター -->
　　　　　　　　   <div class="original">
               <!-- <img src="${pageContext.request.contextPath}/image/original_char.png" id="char" alt="キャラクター">-->		
			 </div>
		   
		</main>


	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/explain.js"></script>
	
	<!-- フッター（ここから） -->
	<jsp:include page="Mindshift_footer.jsp" />
	<!-- フッター（ここまで） -->
</body>
</html>