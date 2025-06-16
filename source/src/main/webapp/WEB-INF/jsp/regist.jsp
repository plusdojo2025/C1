<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>感情登録 | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/regist.css">
</head>
<body>
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<jsp:include page="Mindshift_navigation.jsp" />
		<!-- ヘッダー（ここまで） -->
        <u><h2 style="text-align:center;">感情登録</h2></u>
  
  <main>
	<form id="emo_form" method="POST" action="/C1/EmoRegistServlet"> 
      <p class="radio">
          1.感情スタンプを選んでね<br>
          <div class="radio_edit">
          <input type="radio" name="emo_stamp" value="5" onchange="setOption(this);"/>😆　
          <input type="radio" name="emo_stamp" value="4" onchange="setOption(this);"/>😊　
          <input type="radio" name="emo_stamp" value="3" onchange="setOption(this);"/>😠　
          <input type="radio" name="emo_stamp" value="2" onchange="setOption(this);"/>😢　
          <input type="radio" name="emo_stamp" value="1" onchange="setOption(this);"/>😨
          </div>
      </p>
      <p class="textarea">
          2.出来事を入力してね<br>
          <textarea name="action" placeholder="100文字以内で入力してね" onkeyup="ShowLength(value);"></textarea>
          <p id="inputlength">0文字</p>
     	</p>
      <p class="select">
          3.どんな気持ちだったか選んでね<br>
          <select name="emotion" id="box">
              <option value="">感情を選択</option>
          </select>
      </p>

      <!-- エラーメッセージエリア -->
      <div class="submit">
      <p id="error"></p>
      <input type="submit" value="登録">
      </div>
    </form>
  </main>

		<!-- フッター（ここから） -->
		<jsp:include page="Mindshift_footer.jsp" />

		<!-- フッター（ここまで） -->
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/regist.js"></script>

</body>
</html>