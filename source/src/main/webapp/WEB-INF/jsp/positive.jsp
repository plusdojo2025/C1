<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>フィードバック | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\css\positive.css">
</head>
<body>
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<jsp:include page="Mindshift_navigation.jsp" />
		<!-- ヘッダー（ここまで） -->

  
  <main>
    <div id="regist_text">
        <h2>登録内容</h2>
        <p id="emo_stamp">😊</p>
        <p id="action">出来事：今日先生に褒められた</p>
        <p id="emotion">感情：満足</p>
    </div>

    <div id="feedback_text">
        <h2>フィードバック</h2>
        <p id="feedback">それはいい事だね！！自分らしく取り組んだ結果だね。この調子で行こう！！</p>
    </div>

    <form id="feedback_form" action="名刺管理アプリ試作品/result.html">
        <input type="button" id="back_button" value="感情登録に戻る">
        <input type="submit" value="登録">
    </form>
  </main>


		<!-- フッター（ここから） -->
		<jsp:include page="Mindshift_footer.jsp" />

		<!-- フッター（ここまで） -->
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/positive.js"></script>

</body>
</html>