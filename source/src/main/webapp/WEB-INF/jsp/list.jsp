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
	href="${pageContext.request.contextPath}/css/list.css">
	<link rel="icon" href="images/favicon1.ico" id="favicon">
</head>
<body>
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<jsp:include page="Mindshift_navigation.jsp" />
		<!-- ヘッダー（ここまで） -->
		<u><h2 style="text-align: center;">登録一覧</h2></u>

		<main>
	<div class="term">
        <p>2025-06-01 ～ 2025-06-07</p>
    </div>
		
	     <c:forEach var="item" items="${result}">
	

    <hr>
    <p><fmt:formatDate value="${item.createdAt}" pattern="yyyy-MM-dd"/></p>
    <div class="form-container">
  <form>
  <div class="form-row">
  <div class="form-group">
    <label>感情スタンプ</label>
    <p${item.emoStampId == '1' ? 'selected' : ''}>(^▽^)/</p>
  </div>

  <div class="form-group">
    <label>${item.emotionId}</label>
    <input type="text" name="emotion">
  </div>
</div>

  <div class="form-group">
    <label>${item.action}</label>
    <textarea name="action" cols="20" rows="3" readonly></textarea>
  </div>

  <div class="form-group">
    <label>${item.feedbacksId}</label>
     <textarea name="feedback" cols="20" rows="3" readonly></textarea>
  </div>
</form>

<!-- 画像を右側に表示 -->
  <div class="image-box" style="background-image: url('${pageContext.request.contextPath}/images/gotop_circle_light.png');">
  </div>
</div>
</c:forEach>
	
		</main>

		<!-- フッター（ここから） -->
		<jsp:include page="Mindshift_footer.jsp" />

		<!-- フッター（ここまで） -->
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/list.js"></script>

</body>
</html>