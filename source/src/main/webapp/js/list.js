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
      
        