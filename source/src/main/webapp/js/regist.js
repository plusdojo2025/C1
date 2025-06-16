// 2.文字数をカウントするShowLength関数
function ShowLength( str ) {
   document.getElementById("inputlength").innerHTML = str.length + "文字";
}


// ラジオボタンの選択でプルダウン内容が変化する
// プルダウンの中身を配列に入れる
    var happyArr = [
      {value: "", label: "感情を選択"},
      {value: "19", label: "満足"},
      {value: "20", label: "幸せ"},
      {value: "21", label: "好き"},
      {value: "22", label: "安心"},
      {value: "23", label: "リラックス"},
      {value: "24", label: "元気"},
    ];

    var enjoyArr = [
      {value: "", label: "感情を選択"},
      {value: "13", label: "満足"},
      {value: "14", label: "幸せ"},
      {value: "15", label: "好き"},
      {value: "16", label: "安心"},
      {value: "17", label: "リラックス"},
      {value: "18", label: "元気"},
    ];

        var angryArr = [
      {value: "", label: "感情を選択"},
      {value: "9", label: "憤り"},
      {value: "10", label: "嫉妬"},
      {value: "11", label: "不満"},
      {value: "12", label: "嫌悪"},
    ];

        var sadArr = [
      {value: "", label: "感情を選択"},
      {value: "5", label: "切なさ"},
      {value: "6", label: "寂しさ"},
      {value: "7", label: "絶望"},
      {value: "8", label: "後悔"},
    ];

        var fearArr = [
      {value: "", label: "感情を選択"},
      {value: "1", label: "不安"},
      {value: "2", label: "恐怖"},
      {value: "3", label: "焦り"},
      {value: "4", label: "後悔"},
    ];

    var otherArr = [
      {value: "", label: "▼"}
    ];
    // ラジオボタンのvalueによって使う配列を決める
    function setOption(radio) {
      var target;
      var pullObj;
      var i;
       if ((radio.value) == '5') {
        target = happyArr;
      } else if ((radio.value) == '4') {
        target = enjoyArr;
        } else if ((radio.value) == '3') {
        target = angryArr;
        } else if ((radio.value) == '2') {
        target = sadArr;
        } else if ((radio.value) == '1') {
        target = fearArr;
      } else {
        target = otherArr;
      }
      // 元々のプルダウンの中身を削除する
      pullObj = document.getElementById('box');
      while (pullObj.lastChild) {
        pullObj.removeChild(pullObj.lastChild);
      }
      // プルダウンの中身に配列の中身を入れる
       for (i = 0; i < target.length; i++) {
        let option = document.createElement('option');
        option.value = target[i].value;
        option.text = target[i].label;
        pullObj.appendChild(option);
      }
    }

    // エラーメッセージ
// submitボタンが推されると、emo_formの中身が変数に代入される
document.getElementById('emo_form').onsubmit = function(event) {
    let emo_stamp = document.getElementById('emo_form').emo_stamp.value;
    let action = document.getElementById('emo_form').action.value;
    let emotion = document.getElementById('emo_form').emotion.value;
    //変数の中身がNULLだったらエラーメッセージを表示する
    if (emo_stamp === '' || action === '' || emotion === '' ) {
        document.getElementById('error').textContent = '1.2.3すべて入力してください！';
        event.preventDefault();
        // 出来事が100文字以上だったらエラーメッセージを表示する
      } else if (action.length > 100){
          document.getElementById('error').textContent = '出来事は100文字以内で入力してください！';
        event.preventDefault();
        }
    };
