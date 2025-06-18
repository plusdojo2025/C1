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
        <p id="emo_stamp"><c:out value="${emotionsList.emoStamp}" /></p>
        <p id="action">出来事：<c:out value="${emotionsList.action}" /></p>
        <p id="emotion"><c:out value="${emotionsList.emotion}" /></p>
    </div>

    <div id="feedback_text">
        <h2>フィードバック</h2>
        <p id="feedback"><c:out value="${feedbacksList.feedbacks}" /></p>
    </div>

    <form id="feedback_form" method="POST" action="/C1/PositiveSrvlet">
    	<input type="hidden" name="emo_stamp" value="${emotionsList.emoStamp}">
    	<input type="hidden" name="action" value="${emotionsList.action}">
    	<input type="hidden" name="emotion" value="${emotionsList.emotion}">
    	<input type="hidden" name="feedbacks_id" value="${feedbacksList.feedbacks_id}">
    	<input type="hidden" name="feedbacks" value="${feedbacksList.feedbacks}">
        <input type="button" id="back_button" name="abutton" value="感情登録に戻る">
        <input type="submit" name="abutton" value="登録">
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