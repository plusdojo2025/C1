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