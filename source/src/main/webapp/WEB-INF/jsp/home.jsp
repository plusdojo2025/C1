<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ホーム | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
	<div class="wrapper">
		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<jsp:include page="Mindshift_navigation.jsp" />
		<!-- ヘッダー（ここまで） -->
		<main>
		<h2 style="text-align:center;">オブジェクト表示（仮）</h2>
		  <div class="rectangle">
		    <div class="plantimg"><img src="image/dandelion.png" width="100" height="150" alt="植物の画像"></div>
		  </div>
		
		<!--カレンダー表示エリア-->
		<div id="calendar"></div>
		<main>
		<h2>カレンダー</h2> 
     	 <div class="container-calendar">
            <h4 id="monthAndYear"></h4>
            <div class="button-container-calendar">
                <button id="previous" onclick="previous()">‹</button>
                <button id="next" onclick="next()">›</button>
            </div>
            
            <table class="table-calendar" id="calendar" data-lang="ja">
                <thead id="thead-month"></thead>
                <tbody id="calendar-body"></tbody>
            </table>
            
            <div class="footer-container-calendar">
                <label for="month">日付指定：</label>
                <select id="month" onchange="jump()">
                    <option value=0>1月</option>
                    <option value=1>2月</option>
                    <option value=2>3月</option>
                    <option value=3>4月</option>
                    <option value=4>5月</option>
                    <option value=5>6月</option>
                    <option value=6>7月</option>
                    <option value=7>8月</option>
                    <option value=8>9月</option>
                    <option value=9>10月</option>
                    <option value=10>11月</option>
                    <option value=11>12月</option>
                </select>
                <select id="year" onchange="jump()"></select>
            </div>
      </div>  
    </main>
  <!-- ✅ スタンプ集計表ここから -->
   <h2 style="text-align:center;">スタンプ集計表</h2>
   <div id="stamp-summary">
    <table class="stamptable">
        <tr>
            <th>😆<br>楽しみ</th>
            <th>😊<br>喜び</th>
            <th>😨<br>恐れ</th>
            <th>😢<br>悲しみ</th>
            <th>😠<br>怒り</th>
        </tr>
        <tr>
            <td id="stamp-1">0</td>
            <td id="stamp-2">0</td>
            <td id="stamp-3">0</td>
            <td id="stamp-4">0</td>
            <td id="stamp-5">0</td>
        </tr>
    </table>
  </div>
  <!--スタンプ集計表終わり-->
	</main>
	

		<!-- フッター（ここから） -->
		<jsp:include page="Mindshift_footer.jsp" />
		
		<!-- フッター（ここまで） -->
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/home.js"></script>
	<script>
	  const stampCount = ${stampCount};     // スタンプ件数
	  const totalScore = ${totalScore};     // スコア合計
	</script>
</body>
</html>