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
             
        

        
 
 //＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊カレンダー表示＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
 
   /*指定された範囲の年（start と end）に対応する <option> タグを生成する関数*/
            function generate_year_range(start, end) {
            var years = "";
            for (var year = start; year <= end; year++) {
                years += "<option value='" + year + "'>" + year + "</option>";
            }
            return years;
            }
            
            var today = new Date();
            var currentMonth = today.getMonth();
            var currentYear = today.getFullYear();
            var selectYear = document.getElementById("year");
            var selectMonth = document.getElementById("month");

            var createYear = generate_year_range(1970, 2200);

            document.getElementById("year").innerHTML = createYear;

            var calendar = document.getElementById("calendar");
            var lang = calendar.getAttribute('data-lang');

            var months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"];
            var days = ["日", "月", "火", "水", "木", "金", "土"];

            var dayHeader = "<tr>";
            for (day in days) {
            dayHeader += "<th data-days='" + days[day] + "'>" + days[day] + "</th>";
            }
            dayHeader += "</tr>";

            document.getElementById("thead-month").innerHTML = dayHeader;

            monthAndYear = document.getElementById("monthAndYear");
            showCalendar(currentMonth, currentYear);
             
            /*next は、現在が12月なら翌年の1月に、そうでない場合は単純に次の月に移動する
              previous は、現在が1月なら前年の12月に、そうでない場合は前の月に移動する*/
            function next() {
            currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
            currentMonth = (currentMonth + 1) % 12;
            showCalendar(currentMonth, currentYear);
            }

            function previous() {
            currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
            currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
            showCalendar(currentMonth, currentYear);
            }

            /*月や年を選択するための <select> タグの値が変更されたときに、その選択に基づいてカレンダーを更新する*/
            function jump() {
            currentYear = parseInt(selectYear.value);
            currentMonth = parseInt(selectMonth.value);
            showCalendar(currentMonth, currentYear);
            }

            function showCalendar(month, year) {

            var firstDay = ( new Date( year, month ) ).getDay();

            tbl = document.getElementById("calendar-body");

            tbl.innerHTML = "";

            monthAndYear.innerHTML = months[month] + " " + year;
            selectYear.value = year;
            selectMonth.value = month;

            // creating all cells
            /*月の最初の日がどの曜日に当たるかを計算し、その後、カレンダーの日付を順番に並べる*/
            var date = 1;
            var nextMonthDate = 1; 
            //const stampValue = '${stamp}';スタンプ用 
            for ( var i = 0; i < 6; i++ ) {
                var row = document.createElement("tr");
                var isRowEmpty = true; // 行に今月の日付があるかチェック

                for ( var j = 0; j < 7; j++ ) {
                    if ( i === 0 && j < firstDay ) {
                        cell = document.createElement( "td" );
                        cellText = document.createTextNode("");
                        cell. appendChild(cellText);
                        row.appendChild(cell);
                        
                    } else if (date > daysInMonth(month, year)) {//月ごとの日を設定
                        var cell = document.createElement("td");
                                    cell.textContent = nextMonthDate;
                                    cell.classList.add('next-month');
                                    row.appendChild(cell);
                                    nextMonthDate++;
      
                        
                    } else {
                    	let thisDate = date; // ← クリック用に固定した日付を確保
                        
                        cell = document.createElement("td");
                        cell.setAttribute("data-date", date);
                        cell.setAttribute("data-month", month + 1);
                        cell.setAttribute("data-year", year);
                        cell.setAttribute("data-month_name", months[month]);
                        cell.className = "date-picker";
                        cell.innerHTML = "<span>" + date + "</span>";

                        if ( date === today.getDate() && year === today.getFullYear() && month === today.getMonth() ) {
                            cell.className = "date-picker selected";
                        }

                       // if(date<=today.getDate()){
                        var stampDiv = document.createElement('div');
                        stampDiv.setAttribute('data-date', `${year}-${month + 1}-${date}`);
                       // element.classList.add("emostamp");     
                        stampDiv.textContent = '　😊'; 

                        cell.appendChild(stampDiv);
                       // }
                       
                        cell.addEventListener("click", (function(y, m, d) {
                            return function() {
                                const dateUrl = `MindShift-list?year=${y}&month=${m}&day=${d}`;
                                console.log("Navigate to", dateUrl);
                                window.location.href = dateUrl;
                            };
                        })(year, month + 1, thisDate));

                        row.appendChild(cell);
                        isRowEmpty = false; // 今月の日付があるので空じゃない
                        date++;
                    }
                    
                }
                if (!isRowEmpty) { // 今月の日付が1つでもある行だけ追加
                    tbl.appendChild(row);
                } else {
                    break; // 完全に空白行だったらループ終了
                }

                tbl.appendChild(row);
                const newCell = document.createElement('td');
                newCell.className = 'plant';
                newCell.textContent = '';
                row.appendChild(newCell);

            }

            }

            /*定の月と年における日数を返す*/
            function daysInMonth(iMonth, iYear) {
            return 32 - new Date(iYear, iMonth, 32).getDate();
            }


//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊オブジェクト表示＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
// スタンプの数で成長段階を判断

  // stampsテーブルから　スタンプ件数（count）と点数合計（totalScore）
  function getGrowthStage(cnt) {
    if (cnt === 0 || cnt === 1) return "uekibati";       // 植木鉢
    else if (cnt >= 2 && cnt <= 4) return "me";  // 芽
    else if (cnt === 5 || cnt === 6) return "tubomi";   // つぼみ
    else return "flower";                                // 開花
  }

  // スコアに応じた植物種類（7段階）
  function getPlantType(score) {
    if (score <= 7)  return "lavender";
  else if (score <= 11) return "rindou";
  else if (score <= 15) return "nemophila";
  else if (score <= 19) return "dandelion";
  else if (score <= 23) return "sunflower";
  else if (score <= 27) return "tulips";
  else if (score <= 31) return "roses";
}

  
  // オブジェクト画像の切り替え
function updatePlantImage() {
  const cnt = typeof stampCount !== 'undefined' ? stampCount : 0;
  const score = typeof totalScore !== 'undefined' ? totalScore : 0;

  const stage = getGrowthStage(cnt);
  const imageName = stage === "flower" ? getPlantType(score)  // 花 → 種類ごとの画像
                                       : stage;                   // 植木鉢/芽/つぼみ

  // contextPath を付けて 404 を防ぐ
  const contextPath = document.body.getAttribute("data-context"); // JSP で埋め込む
  const plantImg = document.getElementById("plantImage");
  plantImg.src = `${contextPath}/image/${imageName}.png`;
  plantImg.alt = imageName;
}


// DOM読み込み完了時に実行
document.addEventListener("DOMContentLoaded", updatePlantImage);
 
  
//************************************************スタンプ集計表**************************************** */
// IDごとに該当するセルへ集計値を反映（JSPの表に反映）
	stampData.forEach(item => {
	  const cell = document.getElementById(`stamp-${item.id}`);
	  if (cell) cell.textContent = item.count;
	});


 
  
//**********************************************登録済みアラート***********************************::: */
const alreadyRegistered = alreadyRegistered;
  function handleEmotionClick() {
    if (alreadyRegistered) {
      alert("本日はすでに感情登録済みです。");
    } else {
      window.location.href = "emotion.jsp";
    }
  }
  
  
  
  
  
  
  
  
  
  
 
        