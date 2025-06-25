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
<link rel="icon" href="${pageContext.request.contextPath}/image/favicon1.ico" id="favicon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/list.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="Mindshift_header.jsp" />
	<jsp:include page="Mindshift_navigation.jsp" />
	<div class="wrapper">

		<!-- ヘッダー（ここから） -->
		<!-- ヘッダー（ここまで） -->
		<c:if test="${empty month}">
		<h2 style="text-align: center;">今月の登録一覧</h2>
        </c:if>
        
        <c:if test="${not empty month}">
		  <fmt:formatDate value="${cardList[0].createdAt}" pattern="M" var="createdMonth" />
		  <c:choose>
		    <c:when test="${createdMonth == month}">
		      <h2 style="text-align: center;">登録一覧</h2>
		    </c:when>
		    <c:otherwise>
		      <h2 style="text-align: center;">${year}年-${month}月の登録一覧</h2>
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
    <span class="emostamp"><font size="+4">😆</font></span>
   </c:if>
   
   <c:if test="${item.emoStampId == '4'}">
    <span class="emostamp"><font size="+4">😊</font></span>
   </c:if>
   
   <c:if test="${item.emoStampId == '3'}">
    <span class="emostamp"><font size="+4">😠</font></span>
   </c:if>
   
   <c:if test="${item.emoStampId == '2'}">
    <span class="emostamp"><font size="+4">😢</font></span>
   </c:if>
   
   <c:if test="${item.emoStampId == '1'}">
    <span class="emostamp"><font size="+4">😨</font></span>
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
    <p class="FB">${item.action}</p>
  </div>

  <c:choose>
  <c:when test="${item.feedbacksId == '52' || item.feedbacksId == '69'}"> <c:set var="feedbackLabel" value="元気をしっかりチャージできたみたいですね！少しでも心が軽くなったなら本当に良かったです。そのエネルギーを大切にして、明日からもうひと踏ん張りしていきましょう！今のあなたなら大丈夫です！" /></c:when>
  <c:when test="${item.feedbacksId == '53' || item.feedbacksId == '71'}"> <c:set var="feedbackLabel" value="自分らしさを少しずつ取り戻せたのではないでしょうか？自分のペースで前に進むことが一番大切です。明日もこの調子で無理せず一歩ずつ進んでいきましょうね。" /></c:when>
  <c:when test="${item.feedbacksId == '54' || item.feedbacksId == '72'}"> <c:set var="feedbackLabel" value="元気が出てきたようで良かったです！これで少しでも気持ちが前向きになっていたら、嬉しいです。どんな小さな一歩でも、自分を信じて進めば、きっと大きな力になりますよ。" /></c:when>
  
  <c:when test="${item.feedbacksId == '49' || item.feedbacksId == '66'}"> <c:set var="feedbackLabel" value="リフレッシュできたようで良かったですね。忙しい毎日の中で、しっかり休むことはとても大切です。リラックスできた自分をたくさん褒めてあげましょう。" /></c:when>
  <c:when test="${item.feedbacksId == '50' || item.feedbacksId == '67'}"> <c:set var="feedbackLabel" value="毎日一生懸命頑張っているからこそ、リラックスタイムはとても重要な時間になります。無理せず、今のようにリラックスできる時間を意識していきましょう。たくさん自分を癒してあげてくださいね。" /></c:when>
  <c:when test="${item.feedbacksId == '51' || item.feedbacksId == '68'}"> <c:set var="feedbackLabel" value="リラックスできてよかったです！自分がどんなことでリラックスできるのかメモしておくと、気分転換したいときに役立ちますよ。自分の気分転換リストを作ってみるのもおすすめですよ。" /></c:when>
  
  <c:when test="${item.feedbacksId == '46' || item.feedbacksId == '63'}"> <c:set var="feedbackLabel" value="一息つけたようで安心しました！頑張ったかいがありましたね。今日は一度休息をとって、明日からもこの調子で自分のペースで進んでいきましょう。お疲れさまでした。" /></c:when>
  <c:when test="${item.feedbacksId == '47' || item.feedbacksId == '64'}"> <c:set var="feedbackLabel" value="一安心ですね。ぜひ、ここまで頑張った自分をたくさん褒めてあげてください。そして、あなたの頑張りを周りは理解してくれていますよ。本当にお疲れ様です。" /></c:when>
  <c:when test="${item.feedbacksId == '48' || item.feedbacksId == '65'}"> <c:set var="feedbackLabel" value="心が休まったようで良かったです。頑張っている姿をいつも見ていますから安心してくださいね。今日は、お家で溜まっているドラマを見てゆっくりするのはどうしょうか？" /></c:when>
  
  <c:when test="${item.feedbacksId == '43' || item.feedbacksId == '60'}"> <c:set var="feedbackLabel" value="本当に好きなんですね。その気持ちがよく伝わりましたよ。それだけ夢中になれるのは本当に素晴らしいです！その気持ちをだれかに共有してみませんか？" /></c:when>
  <c:when test="${item.feedbacksId == '44' || item.feedbacksId == '61'}"> <c:set var="feedbackLabel" value="ぜひその気持ちを大切にしてくださいね。きっともっと素敵なことに繋がります。そして、今の気持ちを覚えていると将来役に立つのではないでしょうか。" /></c:when>
  <c:when test="${item.feedbacksId == '45' || item.feedbacksId == '62'}"> <c:set var="feedbackLabel" value="すごく魅力的ですね。あなたの目が輝いてますよ。その気持ちを大切にしましょう！そして何が好きなのか詳しく考えてみるともっと好きになるかもしれません。" /></c:when>
  
  <c:when test="${item.feedbacksId == '40' || item.feedbacksId == '57'}"> <c:set var="feedbackLabel" value="とても幸せそうでよかったです。これから先も、きっとたくさんの素敵なことが待っていますよ。新たな幸せを掴めるように、これからも応援しています。" /></c:when>
  <c:when test="${item.feedbacksId == '41' || item.feedbacksId == '58'}"> <c:set var="feedbackLabel" value="それは素敵でしたね。幸せは舞い込んでくるものではなく、自分でつかみ取るものです。明日からも幸せを捕まえられるように、積極的に動いていきましょう！" /></c:when>
  <c:when test="${item.feedbacksId == '42' || item.feedbacksId == '59'}"> <c:set var="feedbackLabel" value="素晴らしいことですね。幸せを感じられる日々が続くと心もどんどん元気になるので、心の栄養を補給していきましょうね。この幸せをエネルギーにして、明日からも頑張りましょう！" /></c:when>
  
  <c:when test="${item.feedbacksId == '37' || item.feedbacksId == '54'}"> <c:set var="feedbackLabel" value="それはいい事ですね。きっと自分らしく取り組んだ結果が形になったのですね。この満足した気持ちを忘れずに、これからも少しずつ進んでいきましょう！" /></c:when>
  <c:when test="${item.feedbacksId == '38' || item.feedbacksId == '55'}"> <c:set var="feedbackLabel" value="さすがですね、満足できる結果になって本当によかったです。きっとあなたの頑張りを周りの人も見てくれているはずですよ！満足いくまで取り組めた自分を認めてあげてくださいね。" /></c:when>
  <c:when test="${item.feedbacksId == '39' || item.feedbacksId == '56'}"> <c:set var="feedbackLabel" value="本当に嬉しそうで安心しました。今までの努力を振り返って、頑張った自分を褒めましょう！再び頑張るのはその後でも大丈夫ですよ。これからも前向きに行きましょう。" /></c:when>
  
  <c:when test="${item.feedbacksId == '34'}"> <c:set var="feedbackLabel" value="イライラしてしまうのも無理はありません。それだけ一生懸命向き合っていた証です。深呼吸をして、まずは好きなことに数分だけ集中してみましょう。少し気が紛れるだけでも、心が軽くなりますよ。" /></c:when>
  <c:when test="${item.feedbacksId == '35'}"> <c:set var="feedbackLabel" value="怒りって、思っている以上にエネルギーを消耗しますよね。でも、その感情をずっと抱えているのもつらいものです。好きな音楽を聞いたり、心が落ち着く時間を作ることが大切かもしれません。" /></c:when>
  <c:when test="${item.feedbacksId == '36'}"> <c:set var="feedbackLabel" value="気持ちがごちゃごちゃしてるときは、思いきって一度寝てしまうのもひとつの方法です。眠ることで脳と心がリセットされて、起きたときには少しだけ気持ちが楽になっているかもしれませんよ。'" /></c:when>
  
  <c:when test="${item.feedbacksId == '31'}"> <c:set var="feedbackLabel" value="我慢を続けるのは、本当につらいことですよね。無理に頑張りすぎず、一度立ち止まって深呼吸をしてみましょう。少しの休息だけでも、気持ちが軽くなることがあります。心の声を大切にしてくださいね。" /></c:when>
  <c:when test="${item.feedbacksId == '32'}"> <c:set var="feedbackLabel" value="今感じているそのモヤモヤした気持ちを、無理にポジティブに変えなくても大丈夫です。まずは美味しいものを食べて、ゆっくりと体を休めてみましょう。心にもエネルギーが戻ってくるはずですよ。" /></c:when>
  <c:when test="${item.feedbacksId == '33'}"> <c:set var="feedbackLabel" value="その不満は、あなた自身の大切な感情のひとつです。無理に抱え込まず、思い切って信頼できる人に相談してみてください。誰かに話すだけで、気持ちが整理されたり、新しい道が見えてくることがありますよ。" /></c:when>
  
  <c:when test="${item.feedbacksId == '28'}"> <c:set var="feedbackLabel" value="思い通りにいかない日もありますし、落ち込んでしまうこともありますよね。でも、あなたにしかない魅力や強みが必ずあります。まずは、自分の好きなところや頑張っていることを書き出してみませんか。 " /></c:when>
  <c:when test="${item.feedbacksId == '29'}"> <c:set var="feedbackLabel" value="嫉妬という気持ちは、実は自分ももっと成長したいという前向きなエネルギーのサインでもあります。自分に足りないと感じる部分を、少しずつ磨いていきましょう。きっと成長につながっていきますよ。" /></c:when>
  <c:when test="${item.feedbacksId == '30'}"> <c:set var="feedbackLabel" value="気持ちが落ち着かないときは、正直な感情を紙に書き出してみてください。書いてみることで、自分でも気づいていなかった思いや願いに出会えることがありますし、気持ちの整理にもつながっていくはずです。" /></c:when>
  
  <c:when test="${item.feedbacksId == '25'}"> <c:set var="feedbackLabel" value="大変なことがあったのですね。つらい気持ちを抑える必要はありませんし、感情を出すことは決して悪いことではありません。まずは深呼吸をして、少しずつでいいので前を向いて進んでいきましょう！" /></c:when>
  <c:when test="${item.feedbacksId == '26'}"> <c:set var="feedbackLabel" value="怒りを感じるのはとても自然なことです。無理に抑え込もうとせずに、まずは落ち着ける時間を作ってみましょう。しっかり休んで気持ちを整えることで、きっと前向きなエネルギーへと変わっていきますよ。" /></c:when>
  <c:when test="${item.feedbacksId == '27'}"> <c:set var="feedbackLabel" value="つらい気持ちがあるときは、深呼吸をしたり、ゆっくり眠るだけでも心と体が軽くなります。あなたの心と体は、日々がんばっています。まずはそのことをねぎらってあげてくださいね。" /></c:when>
  
  <c:when test="${item.feedbacksId == '22'}"> <c:set var="feedbackLabel" value="つらい思いをしたのですね。本当によく頑張りました。後悔という気持ちは、次に進むための大切なヒントでもあります。まずは好きな音楽を聴いて、心と体を少しだけ休ませてあげましょう。" /></c:when>
  <c:when test="${item.feedbacksId == '23'}"> <c:set var="feedbackLabel" value="落ち込んでしまうことも当然のことです。それはあなたがしっかりと自分の気持ちに向き合っている証です。無理に元気になろうとせずに、甘いものでも食べて、ゆっくり気分を整えてみてくださいね。" /></c:when>
  <c:when test="${item.feedbacksId == '24'}"> <c:set var="feedbackLabel" value="後悔してるというその気持ちも、きっと未来の自分があのときの自分、よくやったと振り返るための大切な伏線です。今はまだ途中ですが、きっとその思いは意味のあるものに変わっていきますよ。" /></c:when>
  
  <c:when test="${item.feedbacksId == '19'}"> <c:set var="feedbackLabel" value="本当に大変だったのですね。今は苦しく悪い考えが頭を巡らせると思いますが、必ず楽になるときが来ます。まずはゆっくり休んで疲れをとりましょう。考えるのはそのあとです。" /></c:when>
  <c:when test="${item.feedbacksId == '20'}"> <c:set var="feedbackLabel" value="自分の気持ちを吐き出せて偉いです！この瞬間生きてくれているだけで素晴らしいです。信頼できる人に話してみると、もっと気持ちが楽になるかもしれません。" /></c:when>
  <c:when test="${item.feedbacksId == '21'}"> <c:set var="feedbackLabel" value="正直な気持ちを教えてくれてありがとう。今の気持ちを無理に乗り越えなくてもいいと思います。ありのままのあなたが一番大切です。まずは、ゆっくり休んで気持ちの切り替えてみるといいかもしれません。" /></c:when>
  
  <c:when test="${item.feedbacksId == '16'}"> <c:set var="feedbackLabel" value="今日も頑張りましたね。寂しさを感じるのは、あなたがとても優しい人だからです。あなたの優しさで救われている人がきっといます。暖かい飲み物を飲んで、気持ちを和らげてくださいね。" /></c:when>
  <c:when test="${item.feedbacksId == '17'}"> <c:set var="feedbackLabel" value="なんだか寂しく感じるときもありますよね。でも、あなたは決して一人ではありません。ノートに感情を書き出してみたり、思い切って誰かに話してみたりするのはどうですか？'" /></c:when>
  <c:when test="${item.feedbacksId == '18'}"> <c:set var="feedbackLabel" value="寂しいと感じると苦しくなりますよね。でもあなたの気持ちは決して悪いものではありません。ありのままの自分を受け止めてあげてください。きっと良い状況に好転しますよ。" /></c:when>
  
  <c:when test="${item.feedbacksId == '13'}"> <c:set var="feedbackLabel" value="話してくれてありがとうございます。そう感じられる心は豊かさは、あなたの長所です。その気持ちもあなたの糧になりますよ。今日はゆっくりお風呂に入ってリラックスしましょう。" /></c:when>
  <c:when test="${item.feedbacksId == '14'}"> <c:set var="feedbackLabel" value="お疲れさまです。切ないと感じることができるのは、あなたが何かを大切にできる素敵な人だということです！今日は自分の好きなものを食べて、自分を大切にしてみませんか？" /></c:when>
  <c:when test="${item.feedbacksId == '15'}"> <c:set var="feedbackLabel" value="そういう日もありますよね。その気持ちはあなたをより素敵な人に変えてくれます。感情を出してすっきりしてみましょう。そして、今はしっかり休みましょう。" /></c:when>
  
  <c:when test="${item.feedbacksId == '10'}"> <c:set var="feedbackLabel" value="話してくれてありがとうございます。後悔するのは、それだけ真剣だった証拠です。真剣に取り組めていて素敵です。今の気持ちをノートに書きだしてみると気持ちの整理がつくと思いますよ。" /></c:when>
  <c:when test="${item.feedbacksId == '11'}"> <c:set var="feedbackLabel" value="そんなことがあったんですね。ただ後悔は、過去の自分が一生懸命だったことの裏返しだと思います。一度頑張った自分を褒めて、コンビニスイーツ買ってみるのはどうですか？" /></c:when>
  <c:when test="${item.feedbacksId == '12'}"> <c:set var="feedbackLabel" value="誰でもそう感じてしまうことはありますよ。きっと大丈夫です。前向きに、今できる小さなことをひとつだけやってみませんか。それが次の一歩につながるはずです。" /></c:when>
  
  <c:when test="${item.feedbacksId == '7'}"> <c:set var="feedbackLabel" value="教えてくれてありがとうございます。その感覚は、ちゃんと前に進もうとしている証拠です。素晴らしいですね。一度手を止めて、深呼吸してみてください。やるべきことが明確になりますよ。" /></c:when>
  <c:when test="${item.feedbacksId == '8'}"> <c:set var="feedbackLabel" value="焦ってしまうのは当然のことです。それだけ責任感を持っていて素晴らしいですね。まずは小さなことからひとつずつ片づけてみましょう。流れに乗る感覚が戻ってくるはずです。" /></c:when>
  <c:when test="${item.feedbacksId == '9'}"> <c:set var="feedbackLabel" value="焦るのは悪いことではありませんよ。それだけ本気なんですね。5分間だけ目を閉じて、何もしない時間をつくってみてください。頭の中が少しずつ整ってくると思います。" /></c:when>
  
  <c:when test="${item.feedbacksId == '4'}"> <c:set var="feedbackLabel" value="伝えてくれてありがとうございます。恐怖を感じたのは、物事を真剣に考えている証拠だと思います。深呼吸しながら、あたたかい飲み物をゆっくり飲んでみてください。" /></c:when>
  <c:when test="${item.feedbacksId == '5'}"> <c:set var="feedbackLabel" value="共有してくれてありがとうございます。怖いと感じられるのは、あなたがしっかりリスクを察知できているということですよ。ストレッチをして脳をリフレッシュしてみるのはどうですか？" /></c:when>
  <c:when test="${item.feedbacksId == '6'}"> <c:set var="feedbackLabel" value="打ち明けてくれてありがとうございます。すぐに動かなくても大丈夫です、自分の感覚を信じてくださいね。安心できる場所で、香りのいいアロマを焚いてみてください。気持ちが落ち着きますよ。" /></c:when>
  
  <c:when test="${item.feedbacksId == '1'}"> <c:set var="feedbackLabel" value="教えてくれてありがとうございます。不安なときも一歩ずつ進んでいるあなたは本当にすごいです。その繊細さは、誰かを思いやる力にもなります。好きな音楽で気分転換して、心に少しの余白を作ってみてくださいね。" /></c:when>
  <c:when test="${item.feedbacksId == '2'}"> <c:set var="feedbackLabel" value="不安は危機管理ができている証拠です。過去を振り返ってみて、どれだけ進んでいるか確認してみてください。きっとあなたなら大丈夫ですよ。今日は散歩して帰ってみませんか。" /></c:when>
  <c:when test="${item.feedbacksId == '3'}"> <c:set var="feedbackLabel" value="お疲れ様です。焦る気持ちもわかりますが大丈夫ですよ。先まで見通しをつけて考えられるのはあなたの長所ですね！今日はゆっくりお風呂に入って明日に備えましょう。" /></c:when>
</c:choose>

<br>
<div class="dialog-box right">
  <div class="form-group speech-wrapper">
    <label>はなまるんからのメッセージ</label>
    <p class="FB">${feedbackLabel}</p>
  </div>
  <div class=img>
  <img src="${pageContext.request.contextPath}/image/original_char.png" alt="相手キャラ" class="avatar">
  </div>
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
      <a href="MindShift-list?year=${year}&month=${month}&day=${day}&page=${currentPage - 1}" class="page_before">前へ</a>
    </c:if>

    <!-- ページ番号 -->
    <c:forEach begin="1" end="${totalPages}" var="i">
      <c:choose>
        <c:when test="${currentPage == i}">
          <span class="current" aria-current="page">${i}</span>
        </c:when>
        <c:otherwise>
          <a href="MindShift-list?year=${year}&month=${month}&day=${day}&page=${i}" class="page_num">${i}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <!-- 次へ -->
    <c:if test="${currentPage < totalPages}">
      <a href="MindShift-list?year=${year}&month=${month}&day=${day}&page=${currentPage + 1}" class="page_after">次へ</a>
    </c:if>

  </div>
</c:if>	
<stlye>
<style>
.image-box {
    width: 300px;
    height: 200px;
    border: 2px solid #ccc;
    margin-left: -100px;
    background-size: cover;
    background-position: center;
  }

.avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;       /* 丸く切り抜く */
  object-fit: cover;        /* 中央を切り抜いて枠にフィット */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);  /* 影で立体感 */
}
.img {
  margin-left: 830px;
  margin-top: -100px;  
 
}

.dialog-box.right .speech-wrapper::after {
  left: auto;
  right: -15px;
  border-right: none;
  border-left: 15px solid #b2eecc;
}
/* テキストエリアは柔らかいグリーンと丸み */
.speech-wrapper {
  position: relative;
  width: fit-content;
  max-width: 800px;
}

/* 吹き出し本体 */
.FB {
  width: 800px;
  min-height: 120px;
  padding: 15px 20px;
  font-size: 1.1rem;
  font-family: 'Comic Sans MS', cursive, sans-serif;
  color: #2e7d32;
  background-color: #b2eecc;
  border: 2px solid #4caf50;
  border-radius: 25px;
  box-shadow: 0 6px 15px rgba(76, 175, 80, 0.3);
  box-sizing: border-box;
  margin: 0;
  line-height: 1.6;
}

/* 吹き出しのしっぽ */
.speech-wrapper::after {
  content: "";
  position: absolute;
  top: 50%;
  left: 100%;
  margin-top: -15px;
  border: 15px solid transparent;
  border-left: 15px solid #b2eecc;
}

.image-char {
    width: 100px;
    height: 150px;
    border: 2px solid #ccc;
    margin-left: 750px;
    margin-top: -20px;
    background-size: cover;
    background-position: center;
  }


</style>
</stlye>

		</main>
	</div>
	<!--javascriptのファイルの読み込み-->
	<script src="js/list.js"></script>
	
	<!-- フッター（ここから） -->
	<jsp:include page="Mindshift_footer.jsp" />
	<!-- フッター（ここまで） -->

</body>
</html>