<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新規登録 | MindSift</title>
    <link rel="icon" href="image/favicon1.ico">
    <link rel="stylesheet" href="css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=DotGothic16&family=M+PLUS+Rounded+1c&family=Zen+Maru+Gothic&display=swap" rel="stylesheet">
</head>
<body>

    <main class="newlogin-main">
        <div class="login-logo">
            <img src="image/logo_circle.png" alt="MindSift ロゴ">
        </div>
    
        <div class="newlogin-form-container">
            <h1>新規登録</h1>
            <form action="MindShift-register" method="POST">    
                <div class="form-group">
                    <label for="loginid">メールアドレス</label>
                    <input type="email" id="loginid" name="loginid" placeholder="@を必ず含めてください" required>
                </div>
    
                <div class="form-group">
                    <label for="password">パスワード</label>
                    <input type="password" id="password" name="password" required>
                </div>
    
                <!--<div class="form-group">
                    <label for="cpassword">パスワード（確認用）</label>
                    <input type="password" id="cpassword" name="cpassword" required>
                </div>-->
    
                
                <button type="submit" class="newlogin-button">登録する</button>
            </form>
            <div class="character-icon-wrapper">
            <img src="image/original_char.png" alt="キャラクター">
        	</div>
            <div class="login-links">
                <!--<a href="MindShift-login">ログインページへ戻る</a>-->
                <a href="MindShift-loginExplain">各種説明はこちら</a>
            </div>
        </div>
    
    </main>

<!-- フッター（ここから） -->
  <footer>
    <div id="footer">
      	<p class="catchphrase">5分でココロのガーデニング</p>
		<p class="catchphrase">MindShift</p>
		<p>&copy;Copyright FriYay All rights reserved.</p>
      <div class="gotop">
        <!--<a href="#top"><img src="gotop_circle_light.png" alt="ページトップへ戻る"></a>-->
      </div>
    </div>
  </footer>
<!-- フッター（ここまで） -->
</body>
</html>