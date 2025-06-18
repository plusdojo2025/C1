<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>登録一覧 | MindShift</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon1.ico" id="favicon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/list.css">
	
</head>
<body>
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<jsp:include page="Mindshift_header.jsp" />
		<jsp:include page="Mindshift_navigation.jsp" />
		<!-- ヘッダー（ここまで） -->
		<c:if test="${empty month}">
		 <u><h2 style="text-align: center;">今月の登録一覧</h2></u>
        </c:if>
        
        <c:if test="${not empty month}">
		  <fmt:formatDate value="${cardList[0].createdAt}" pattern="M" var="createdMonth" />
		  <c:choose>
		    <c:when test="${createdMonth == month}">
		      <u><h2 style="text-align: center;">登録一覧</h2></u>
		    </c:when>
		    <c:otherwise>
		      <u><h2 style="text-align: center;">${year}年-${month}月の登録一覧</h2></u>
		    </c:otherwise>
		  </c:choose>
		</c:if>
        
		<main>
	<div class="term">
	   <c:if test="${not empty cardList}">
        <p><fmt:formatDate value="${cardList[0].createdAt}" pattern="yyyy-MM-dd"/> 
        ～  <fmt:formatDate value="${cardList[fn:length(cardList )-1].createdAt}" pattern="yyyy-MM-dd"/></p>
       </c:if>
       
       <c:if test="${empty cardList}">
        <p>登録データがありません</p>
       </c:if>
       
    </div>
<c:forEach var="item" items="${cardList}">
	

    <hr>
    <p><fmt:formatDate value="${item.createdAt}" pattern="yyyy-MM-dd"/></p>
    <div class="form-container">
  <form>
 <div class="form-row">
  <div class="form-group">
    <label>感情スタンプ</label>
   <c:if test="${item.emoStampId == '5'}">
    <span class="emostamp">😆</span>
   </c:if>
   
   <c:if test="${item.emoStampId == '4'}">
    <span class="emostamp">😊</span>
   </c:if>
   
   <c:if test="${item.emoStampId == '3'}">
    <span class="emostamp">😠</span>
   </c:if>
   
   <c:if test="${item.emoStampId == '2'}">
    <span class="emostamp">😢</span>
   </c:if>
   
   <c:if test="${item.emoStampId == '1'}">
    <span class="emostamp">😨</span>
   </c:if>
  </div>
  

<c:choose>
  <c:when test="${item.emotionId == '24' || item.emotionId == '18'}"> <c:set var="emotionLabel" value="元気" /></c:when>
  <c:when test="${item.emotionId == '23' || item.emotionId == '17'}"> <c:set var="emotionLabel" value="リラックス" /></c:when>
  <c:when test="${item.emotionId == '22' || item.emotionId == '16'}"> <c:set var="emotionLabel" value="安心" /></c:when>
  <c:when test="${item.emotionId == '21' || item.emotionId == '15'}"> <c:set var="emotionLabel" value="好き" /></c:when>
  <c:when test="${item.emotionId == '20' || item.emotionId == '14'}"> <c:set var="emotionLabel" value="幸せ" /></c:when>
  <c:when test="${item.emotionId == '19' || item.emotionId == '13'}"> <c:set var="emotionLabel" value="満足" /></c:when>
  <c:when test="${item.emotionId == '12'}"> <c:set var="emotionLabel" value="嫌悪" /></c:when>
  <c:when test="${item.emotionId == '11'}"> <c:set var="emotionLabel" value="不満" /></c:when>
  <c:when test="${item.emotionId == '10'}"> <c:set var="emotionLabel" value="嫉妬" /></c:when>
  <c:when test="${item.emotionId == '9'}"> <c:set var="emotionLabel" value="憤り" /></c:when>
  <c:when test="${item.emotionId == '8' || item.emotionId == '4'}"> <c:set var="emotionLabel" value="後悔" /></c:when>
  <c:when test="${item.emotionId == '7'}"> <c:set var="emotionLabel" value="絶望" /></c:when>
  <c:when test="${item.emotionId == '6'}"> <c:set var="emotionLabel" value="寂しさ" /></c:when>
  <c:when test="${item.emotionId == '5'}"> <c:set var="emotionLabel" value="切なさ" /></c:when>
  <c:when test="${item.emotionId == '3'}"> <c:set var="emotionLabel" value="焦り" /></c:when>
  <c:when test="${item.emotionId == '2'}"> <c:set var="emotionLabel" value="恐怖" /></c:when>
  <c:when test="${item.emotionId == '1'}"> <c:set var="emotionLabel" value="不安" /></c:when>
</c:choose>

<div class="form-group">
  <label>その時の感情</label>
  <input type="text" name="emotion" value="${emotionLabel}" disabled>
</div>
</div>

  <div class="form-group">
    <label>出来事</label>
    <textarea name="action" cols="20" rows="3" readonly>${item.action}</textarea>
  </div>

  <c:choose>
  <c:when test="${(item.emotionId == '24' || item.emotionId == '18') && item.feedbacksId == '1' }"> <c:set var="feedbackLabel" value="元気チャージできたね！このチャージを使って明日からもうひと踏ん張りだ！" /></c:when>
  <c:when test="${(item.emotionId == '24' || item.emotionId == '18') && item.feedbacksId == '2' }"> <c:set var="feedbackLabel" value="自分らしさを取り戻せたかな？明日もこの調子で頑張っていこう！" /></c:when>
  <c:when test="${(item.emotionId == '24' || item.emotionId == '18') && item.feedbacksId == '3' }"> <c:set var="feedbackLabel" value="元気が出てよかったよ！これで少しでも気持ちが前向きなったら嬉しいな！" /></c:when>
  
  <c:when test="${item.emotionId == '23' || item.emotionId == '17' && item.feedbacksId == '1' }"> <c:set var="feedbackLabel" value="リフレッシュできたみたいだね。休息も大事だから、リラックスできた自分を褒めてあげよう！" /></c:when>
  <c:when test="${item.emotionId == '23' || item.emotionId == '17' && item.feedbacksId == '2' }"> <c:set var="feedbackLabel" value="毎日頑張っているからこそ、リラックスタイムは重要だね。たくさん自分を癒してあげてね。" /></c:when>
  <c:when test="${item.emotionId == '23' || item.emotionId == '17' && item.feedbacksId == '3' }"> <c:set var="feedbackLabel" value="リラックスできてよかった！自分がどんなことでリラックスできるのかメモしておくと、気分転換したいときに役立つよ。" /></c:when>
  
  <c:when test="${item.emotionId == '22' || item.emotionId == '16' && item.feedbacksId == '1' }"> <c:set var="feedbackLabel" value="一息つけたみたいでよかった！この調子で自分のペースで進んでいこう。" /></c:when>
  <c:when test="${item.emotionId == '22' || item.emotionId == '16' && item.feedbacksId == '2' }"> <c:set var="feedbackLabel" value="一安心だね。ここまで頑張った自分をたくさん褒めてね！" /></c:when>
  <c:when test="${item.emotionId == '22' || item.emotionId == '16' && item.feedbacksId == '3' }"> <c:set var="feedbackLabel" value="心が休まったね。頑張っている姿をいつも見てるから、今日はゆっくりしよう！" /></c:when>
  
  <c:when test="${item.emotionId == '21' || item.emotionId == '15' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="本当に好きなんですね。それだけ夢中になれるってことは本当に素晴らしいことです！！" /></c:when>
  <c:when test="${item.emotionId == '21' || item.emotionId == '15' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="その気持ちを大切にしてください。きっともっと素敵なことに繋がりますよ！！" /></c:when>
  <c:when test="${item.emotionId == '21' || item.emotionId == '15' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="すごく魅力的ですね。あなたの目が輝いてます。その気持ちを大切にしましょう！！" /></c:when>
  
  <c:when test="${item.emotionId == '20' || item.emotionId == '14' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="最高ですね！！、これからもっと幸せなことが待ってそうですね。応援しています！！" /></c:when>
  <c:when test="${item.emotionId == '20' || item.emotionId == '14' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="素敵ですね！！、その幸せがずっと続くことを願っています。" /></c:when>
  <c:when test="${item.emotionId == '20' || item.emotionId == '14' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="素晴らしいことですね！！、幸せを感じられる日々が続くと心もどんどん元気になりそうですね。" /></c:when>
  
  <c:when test="${item.emotionId == '19' || item.emotionId == '13' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="それはいい事だね！！、自分らしく取り組んだ結果だね。この調子で行こう！！" /></c:when>
  <c:when test="${item.emotionId == '19' || item.emotionId == '13' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="さすがです！！、満足できる結果になって本当によかったです。" /></c:when>
  <c:when test="${item.emotionId == '19' || item.emotionId == '13' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="本当に嬉しそうですね。その気持ちを忘れずに、これからも前向きに行きましょう！！" /></c:when>
  
  <c:when test="${item.emotionId == '12' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="イライラするの、無理もないよ。感情が動くって、それだけ真剣だった証拠。まずは深呼吸して、好きなことに 5 分だけ集中してみて" /></c:when>
  <c:when test="${item.emotionId == '12' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="怒るのってエネルギー使うよね。でもずっと抱えてるのもしんどいし、まずは好きな音楽で気分切り替えよ！" /></c:when>
  <c:when test="${item.emotionId == '12' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="気持ちがごちゃごちゃしてるときは、寝るのが最強説ある。起きたらちょっとマシになってるかもよ？" /></c:when>
  
  <c:when test="${item.emotionId == '11' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="我慢し続けるのはつらいよね。ムリせず、ちょっと休んでみよう！" /></c:when>
  <c:when test="${item.emotionId == '11' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="今の気持ち、無理にポジティブにしなくていいよ。まずは美味しいものを食べて休もう！" /></c:when>
  <c:when test="${item.emotionId == '11' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="お疲れ様。その不満も大切な声だよ！思い切って誰かに相談するだけで、道が開けるかもよ！" /></c:when>
  
  <c:when test="${item.emotionId == '10' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="そんな日もあるよね。あなたにはあなたの良さがある。今日は、自分の良いところをメモしてみてみて" /></c:when>
  <c:when test="${item.emotionId == '10' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="嫉妬は成長のサイン。まずは休んで、自分に足りないものを一歩ずつ磨いていこう" /></c:when>
  <c:when test="${item.emotionId == '10' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="気持ちが落ち着かないときは、正直な感情を書き出してみて。気づきが得られると思うよ！" /></c:when>
  
  <c:when test="${item.emotionId == '9' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="大変だったね。感情を出すことは悪いことじゃないよ。まずは深呼吸して、また前に進もう！" /></c:when>
  <c:when test="${item.emotionId == '9' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="怒りを感じることは当たり前！まずは休んで、前に進むための原動力にしよう！" /></c:when>
  <c:when test="${item.emotionId == '9' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="まずは、深呼吸をして、よく食べて、よく寝てみようよ。体と心にお疲れ様！" /></c:when>
  
  <c:when test="${item.emotionId == '8' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="しんどかったよね、ほんとよく頑張った！後悔って、次に進むヒントだよ。まずは好きな曲でも聴いて、ちょっと一息しよ" /></c:when>
  <c:when test="${item.emotionId == '8' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="落ち込むのも当然だよ。でもそれって、ちゃんと向き合ってる証拠。コンビニで甘いもん買って、気分リセットしよ！" /></c:when>
  <c:when test="${item.emotionId == '8' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="後悔してるって？それ、未来の自分が“あの頃の自分、よくやった！”って言うための伏線だから。今は伏線回収待ち！" /></c:when>
  
  <c:when test="${item.emotionId == '7' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="本当に大変だったね。今は苦しいと思うけど、必ず楽になるときが来るからね。まずはゆっくり休もう。" /></c:when>
  <c:when test="${item.emotionId == '7' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="自分の気持ちを吐き出せてえらい！この瞬間生きてくれているだけで素晴らしいよ。信頼できる人に話してみると、もっと気持ちが楽になるかも" /></c:when>
  <c:when test="${item.emotionId == '7' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="教えてくれてありがとう。無理に乗り越えなくていいし、そのままのあなたが大切だよ。今は自分を最優先にしてね" /></c:when>
  
  <c:when test="${item.emotionId == '6' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="今日も頑張ったね。寂しさを感じるのは、あなたがとっても優しい人だからだよ。暖かい飲み物でも飲んで、気持ちを和らげてね" /></c:when>
  <c:when test="${item.emotionId == '6' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="なんだか寂しく感じるときもあるよね。でも、あなたは決して一人ではないよ。思い切って誰かに話してみるのもいいかもね" /></c:when>
  <c:when test="${item.emotionId == '6' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="寂しいって感じると苦しくなるよね。でもあなたの気持ちは決して悪いものじゃないよ。ありのままの自分を受け止めてあげて" /></c:when>
  
  <c:when test="${item.emotionId == '5' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="話してくれてありがとう。そう感じられるぐらいあなたの心は豊かなんだよ。今日はゆっくりお風呂に入ってリラックスしよう！" /></c:when>
  <c:when test="${item.emotionId == '5' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="お疲れさま。切なく感じられるなんて、あなたは何かを大切にできる素敵な人だね！今日は自分の好きなもの食べちゃう？" /></c:when>
  <c:when test="${item.emotionId == '5' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="そういう日もあるよね。その気持ちはあなたをより素敵な人に変えてくれるから、大事に抱えていてもいいんだよ。今はしっかり休もう！" /></c:when>
  
  <c:when test="${item.emotionId == '4' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="話してくれてありがとう。後悔するってことは、それだけ真剣だった証拠だよ。今の気持ちをノートに書きだしてみると気持ちの整理がつくかも" /></c:when>
  <c:when test="${item.emotionId == '4' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="後悔って、過去の自分が一生懸命だったことの裏返しだと思う！一回頑張った自分を褒めてみよう。" /></c:when>
  <c:when test="${item.emotionId == '4' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="誰にだってそういう瞬間はあるよ。今できる小さなことをひとつだけやってみよう。それが次の一歩につながるから。" /></c:when>
  
  <c:when test="${item.emotionId == '3' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="教えてくれてありがとう。その感覚は、ちゃんと前に進もうとしている証拠だよ。一度手を止めて、深呼吸してみよう。" /></c:when>
  <c:when test="${item.emotionId == '3' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="焦ってしまうのは当然のことだよ。それだけ責任感を持ってるってことだよね。まずは小さなことからひとつずつ片づけてみよう。流れに乗る感覚が戻ってくるはず。" /></c:when>
  <c:when test="${item.emotionId == '3' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="焦るのは悪いことじゃないよ、それだけ本気ってこと。5 分だけ目を閉じて、何もしない時間をつくってみて。頭の中が少しずつ整ってくるから。" /></c:when>
  
  <c:when test="${item.emotionId == '2' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="話してくれてありがとう。不安を感じるのは、それだけ物事を真剣に考えている証拠だよ。深呼吸しながら、あたたかい飲み物をゆっくり飲んでみて" /></c:when>
  <c:when test="${item.emotionId == '2' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="共有してくれてありがとう。怖いって感じられるのは、ちゃんとリスクを察知できる力があるってことだよ。ストレッチをして脳をリフレッシュしてみるのはどう？" /></c:when>
  <c:when test="${item.emotionId == '2' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="打ち明けてくれてありがとう。すぐに動かなくても大丈夫、自分の感覚を信じてね。安心できる場所で、香りのいいアロマを焚いてみると気持ちが落ち着くかもしれないよ。" /></c:when>
  
  <c:when test="${item.emotionId == '1' && item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="教えてくれてありがとう。焦らなくても大丈夫、危機管理能力が長けているね！好きな音楽を聴いてリラックスしてね" /></c:when>
  <c:when test="${item.emotionId == '1' && item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="大丈夫だよ。焦らなくても進んでるよ、周りを見られて優秀！今日は散歩して帰ろう。" /></c:when>
  <c:when test="${item.emotionId == '1' && item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="お疲れ様。焦らなくても大丈夫、先まで考えられてえらい！今日はゆっくりお風呂に入ろう。" /></c:when>
</c:choose>

<div class="form-group">
  <label>フィードバック</label>
  <textarea name="action" cols="20" rows="3" readonly>${feedbackLabel}</textarea>
</div>
  
  
</form>

<!-- 画像を右側に表示 -->
  <div class="image-box" style="background-image: url('${pageContext.request.contextPath}/image/${item.plant}');">
  </div>
</div>
</c:forEach>

<br>
<br>

<c:if test="${totalPages > 1}">
  <div class="pagination">

    <!-- 前へ -->
    <c:if test="${currentPage > 1}">
      <a href="MindShift-list?page=${currentPage - 1}" class="page_before">前へ</a>
    </c:if>

    <!-- ページ番号 -->
    <c:forEach begin="1" end="${totalPages}" var="i">
      <c:choose>
        <c:when test="${currentPage == i}">
          <span class="current" aria-current="page">${i}</span>
        </c:when>
        <c:otherwise>
          <a href="MindShift-list?page=${i}" class="page_num">${i}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <!-- 次へ -->
    <c:if test="${currentPage < totalPages}">
      <a href="MindShift-list?page=${currentPage + 1}" class="page_after">次へ</a>
    </c:if>

  </div>
</c:if>

	
		</main>

		<!-- フッター（ここから） -->
		<jsp:include page="Mindshift_footer.jsp" />

		<!-- フッター（ここまで） -->
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/list.js"></script>
	
	

</body>
</html>