// アクセス日時表示
  document.getElementById('time').textContent = new Date().toLocaleString();

//ログアウト
var btn = document.getElementById('logout');//id、ログアウトの情報をbtnに読み込み

        btn.addEventListener('click', function(event) { //対象要素.addEventListener(種類(clickはマウスボタンをクリックした時), function() {}

          var confirmLogout = confirm("本当にログアウトしますか？");

        // ユーザーが「OK」を押した場合、ログアウト処理を実行
        if (!confirmLogout) {
            // 「キャンセル」が押された場合、リンクのデフォルト動作をキャンセル
            event.preventDefault();
        }

        })


        /* submitボタンをクリックしたときの処理 */
        function submitClick() {
        /* 確認ダイアログボックスを表示します */
        if (!window.confirm('実行します。よろしいですか？')) {
            return false;
        }
        }

//アカウント削除
var btn_del = document.getElementById('account_del');

        btn_del.addEventListener('click', function(e) { //対象要素.addEventListener(種類(clickはマウスボタンをクリックした時), function() {}

          var confirmLogout = confirm("アカウント削除しますか？");

        // ユーザーが「OK」を押した場合、処理を実行
        if (!confirmLogout) {
            // 「キャンセル」が押された場合、リンクのデフォルト動作をキャンセル
            e.preventDefault();
        }else{
          alert("アカウントを削除しました。");
        }
        })
        /* submitボタンをクリックしたときの処理 */
        function submitClick() {
        /* 確認ダイアログボックスを表示します */
        if (!window.confirm('実行します。よろしいですか？')) {
            return false;
        }
        }


// 感情スタンプをint型から顔文字に変換して表示
switch("${emotionsList.emoStamp}") {
  case 5:
    document.getElementById('emo_stamp').textContent = '😆';
    break;
  case 4:
    document.getElementById('emo_stamp').textContent = '😊';
    break;
  case 3:
    document.getElementById('emo_stamp').textContent = '😠';
    break;
  case 2:
    document.getElementById('emo_stamp').textContent = '😢';
    break;
  case 1:
    document.getElementById('emo_stamp').textContent = '😨';
    break;
  default:
    document.getElementById('emo_stamp').textContent = '';
    break;
}

// その時の感情をint型から文字列にして表示 
switch("${emotionsList.emotion}") {
  case 18,24:
    document.getElementById('emotion').textContent = '感情：元気';
    break;
  case 17,23:
    document.getElementById('emotion').textContent = '感情：リラックス';
    break;
  case 16,22:
    document.getElementById('emotion').textContent = '感情：安心';
    break;
  case 15,21:
    document.getElementById('emotion').textContent = '感情：好き';
    break;
  case 14,20:
    document.getElementById('emotion').textContent = '感情：幸せ';
    break;
  case 13,19:
    document.getElementById('emotion').textContent = '感情：満足';
    break;
  case 12:
    document.getElementById('emotion').textContent = '感情：嫌悪';
    break;
  case 11:
    document.getElementById('emotion').textContent = '感情：不満';
    break;
  case 10:
    document.getElementById('emotion').textContent = '感情：嫉妬';
    break;
  case 9:
    document.getElementById('emotion').textContent = '感情：憤り';
    break;
  case 4,8:
    document.getElementById('emotion').textContent = '感情：後悔';
    break;
  case 7:
    document.getElementById('emotion').textContent = '感情：絶望';
    break;
  case 6:
    document.getElementById('emotion').textContent = '感情：寂しさ';
    break;
  case 5:
    document.getElementById('emotion').textContent = '感情：切なさ';
    break;
  case 3:
    document.getElementById('emotion').textContent = '感情：焦り';
    break;
  case 2:
    document.getElementById('emotion').textContent = '感情：恐怖';
    break;
  case 1:
    document.getElementById('emotion').textContent = '感情：不安';
    break;
  default:
    document.getElementById('emotion').textContent = '';
    break;
}


// 登録確認アラートを表示する
document.getElementById('feedback_form').onsubmit = function(event) {
    if (window.confirm("この内容で登録しますか？")) {
      // アラートを表示してから、画面遷移（URLだけ変更必要あり）
      alert("登録が完了しました。");
      window.location.href='emo_regist.html';
    }
    else {
      // 遷移せず留まる
      return false;
    }
}

// 登録画面に戻る確認アラートを表示する
document.getElementById('back_button').onclick = function(event) {
    if (window.confirm("登録内容を破棄して感情登録へ戻りますか？")) {
      // アラートを表示してから、画面遷移（URLだけ変更必要あり）
      window.location.href='emo_regist.html';
    }
    else {
      // 遷移せず留まる
      return false;
    }
}

