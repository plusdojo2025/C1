<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon1.ico">
<title>ポジティブ変換 | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\css\positive.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
</head>
<body class="zen-maru-gothic-medium">
	<!-- ヘッダー（ここから） -->
	<jsp:include page="Mindshift_header.jsp" />
	<jsp:include page="Mindshift_navigation.jsp" />
	<!-- ヘッダー（ここまで） -->
	<div class="wrapper">

  
  <main>
    <div id="regist_text">
        <h2>登録内容</h2>
         <div class="form-group">
   <c:if test="${feedbacksList.emo_stamp_id == '5'}">
    <span class="emostamp">😆</span>
   </c:if>
   
   <c:if test="${feedbacksList.emo_stamp_id == '4'}">
    <span class="emostamp">😊</span>
   </c:if>
   
   <c:if test="${feedbacksList.emo_stamp_id == '3'}">
    <span class="emostamp">😠</span>
   </c:if>
   
   <c:if test="${feedbacksList.emo_stamp_id == '2'}">
    <span class="emostamp">😢</span>
   </c:if>
   
   <c:if test="${feedbacksList.emo_stamp_id == '1'}">
    <span class="emostamp">😨</span>
   </c:if>
 
  
        <p id="action">出来事：<c:out value="${emotionsList.action}" /></p>      
        
 <c:choose>
  <c:when test="${emotionsList.emotion == '24' || emotionsList.emotion == '18'}"> <c:set var="emotionLabel" value="元気" /></c:when>
  <c:when test="${emotionsList.emotion == '23' || emotionsList.emotion == '17'}"> <c:set var="emotionLabel" value="リラックス" /></c:when>
  <c:when test="${emotionsList.emotion == '22' || emotionsList.emotion == '16'}"> <c:set var="emotionLabel" value="安心" /></c:when>
  <c:when test="${emotionsList.emotion == '21' || emotionsList.emotion == '15'}"> <c:set var="emotionLabel" value="好き" /></c:when>
  <c:when test="${emotionsList.emotion == '20' || emotionsList.emotion == '14'}"> <c:set var="emotionLabel" value="幸せ" /></c:when>
  <c:when test="${emotionsList.emotion == '19' || emotionsList.emotion == '13'}"> <c:set var="emotionLabel" value="満足" /></c:when>
  <c:when test="${emotionsList.emotion == '12'}"> <c:set var="emotionLabel" value="嫌悪" /></c:when>
  <c:when test="${emotionsList.emotion == '11'}"> <c:set var="emotionLabel" value="不満" /></c:when>
  <c:when test="${emotionsList.emotion == '10'}"> <c:set var="emotionLabel" value="嫉妬" /></c:when>
  <c:when test="${emotionsList.emotion == '9'}"> <c:set var="emotionLabel" value="憤り" /></c:when>
  <c:when test="${emotionsList.emotion == '8' || emotionsList.emotion == '4'}"> <c:set var="emotionLabel" value="後悔" /></c:when>
  <c:when test="${emotionsList.emotion == '7'}"> <c:set var="emotionLabel" value="絶望" /></c:when>
  <c:when test="${emotionsList.emotion == '6'}"> <c:set var="emotionLabel" value="寂しさ" /></c:when>
  <c:when test="${emotionsList.emotion == '5'}"> <c:set var="emotionLabel" value="切なさ" /></c:when>
  <c:when test="${emotionsList.emotion == '3'}"> <c:set var="emotionLabel" value="焦り" /></c:when>
  <c:when test="${emotionsList.emotion == '2'}"> <c:set var="emotionLabel" value="恐怖" /></c:when>
  <c:when test="${emotionsList.emotion == '1'}"> <c:set var="emotionLabel" value="不安" /></c:when>
</c:choose>


 <p id="emotion">その時の感情：<c:out value="${emotionLabel}" /></p>
</div>
</div>

    <div id="feedback_text">
        <h2>フィードバック</h2>
        <p id="feedback"><c:out value="${feedbacksList.feedbacks}" /></p>
    </div>

    <form id="feedback_form" method="POST" action="MindShift-positive">
    	<input type="hidden" name="emo_stamp" value="${feedbacksList.emo_stamp_id}">
    	<input type="hidden" name="action" value="${emotionsList.action}">
    	<input type="hidden" name="emotion" value="${emotionsList.emotion}">
    	<input type="hidden" name="feedbacks_id" value="${feedbacksList.id}">
    	<input type="hidden" name="feedbacks" value="${feedbacksList.feedbacks}">
        <input type="submit" name="abutton" value="登録">
    </form>
    
    <form id="back" method="GET" action="MindShift-regist">
    <input type="button" id="back_button" name="abutton" value="感情登録に戻る">
    </form>
  </main>


	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/positive.js"></script>
	
	<!-- フッター（ここから） -->
	<jsp:include page="Mindshift_footer.jsp" />
	<!-- フッター（ここまで） -->
</body>
</html>