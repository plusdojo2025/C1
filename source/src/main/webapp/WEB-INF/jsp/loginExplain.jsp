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
	<div class="wrapper">

	
    <div id="logo">
		<img src="${pageContext.request.contextPath}/image/logo_circle.png"
			alt="LOGO" width="169" height="160">
	</div>
   

	<main class="main">
		<h2 style="text-align: center;">MindShift</h2>
		<!-- アプリについて -->
		<div class="section">
		 <h3 style="text-align: center;">アプリについて</h3>
		 <p>このアプリは自分のメンタル状況を確認し、マインドをネガティブからポジティブにシフトすることを助けます。1日1回、毎日登録することで、ホームページの植物が育ちます。開花を目指して継続しましょう！</p>
	    </div>
	
	    <h2 style="text-align:center;">使い方</h2>
		<!-- ホーム-->
		<div class="section">
		  <h3 style="text-align:center;">ホーム</h3>
		  <p>1日1回感情登録すると、育てた植物と今月のカレンダー、今月のスタンプの集計が表示されます。カレンダーの日付をクリックすると、一覧表示ページのクリックした日付に移動します。</p>
		</div>
		    
		<!-- 植物-->
		<div class="section1">
		   <h3 style="text-align:center;">植物</h3>
		   <p>1週間のうちに登録した回数によって植物の育ち方が変わります。
また、1週間毎日登録した場合、感情スタンプの種類によって開花する植物の種類が変わります。7種類あります。</p>
		
		   <h3 style="text-align:center;">植物の育ち方</h3>
		   <div><img src="${pageContext.request.contextPath}/image/枠あり育ち方.png" class="images" alt="植物の育ち方"></div>
		
		   <h3 style="text-align:center;">植物の種類</h3>
		   <div><img src="${pageContext.request.contextPath}/image/枠あり種類.png" class="images" alt="植物の種類"></div>
		</div>
		    
		<!-- 感情登録-->
		<div class="section2">
		   <h3 style="text-align:center;">感情登録</h3>
		   <p>感情登録ページから感情スタンプ、出来事、どのような気持ちだったかの3つ全てを入力して登録してください。登録された内容に基づいたフィードバックがあります。</p>
		
		   <h3 style="text-align:center;">感情スタンプ</h3>
		   <div><img src="${pageContext.request.contextPath}/image/枠ありスタンプ.png" class="images" alt="スタンプ"></div>
		</div>
		    
		<!-- 記録一覧-->
	    <div class="section">
		   <h3 style="text-align:center;">登録一覧</h3>
		   <p>今までに登録した感情スタンプ、出来事、気持ち、フィードバック、育てた植物を一覧で確認することができます。</p>
		</div>
		    
		<!-- アカウント-->
		<div class="section">
		   <h3 style="text-align:center;">アカウント</h3>
		   <p>ログアウトとアカウント削除ができます。</p>
		    <img src="${pageContext.request.contextPath}/image/original_char.png" id="char" alt="キャラクター">	
		</div>	
		
	 
          <a href="MindShift-login" class="relogin">ログイン画面に戻る</a>
	      
	     <div class="original">
	      <!-- <img src="${pageContext.request.contextPath}/image/original_char.png" id="char" alt="キャラクター">-->		
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