<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon1.ico">
<title>ホーム | MindShift</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@500&display=swap" rel="stylesheet">
</head>
<body data-context="${pageContext.request.contextPath}">
	
	<!-- ヘッダー（ここから） -->
	<jsp:include page="Mindshift_header.jsp" />
	<jsp:include page="Mindshift_navigation.jsp" />
	<!-- ヘッダー（ここまで） -->
	
<div class="character-icon-wrapper">
  <div class="speech-bubble" id="speechText">ようこそ！</div>
  <img src="image/original_char.png" alt="キャラクター">
</div>

<script>
  const messages = {
    section1: "今育てている花です！",
    section2: "まとめてみよう！",
    section3: "今月の合計スタンプだよ！"
  };

  window.addEventListener("scroll", () => {
    const speech = document.getElementById("speechText");

    // 各セクションの位置を取得
    for (const id in messages) {
      const section = document.getElementById(id);
      const rect = section.getBoundingClientRect();

      // セクションが画面の中央に近いときにメッセージを表示
      if (rect.top <= window.innerHeight / 2 && rect.bottom >= window.innerHeight / 2) {
        speech.textContent = messages[id];
        break;
      }
    }
  });
</script>


	
	<div class="wrapper">
		<main>
		<section id="section1" class="page-section">&nbsp;</section>
		<!-- この部分を差し替える -->
		<h2 style="text-align:center;">あなたの今週の植物</h2>
		  <div class="rectangle">
		    <div class="plantimg"><img id="plantImage" src="" width="100" height="150" alt="植物の画像"></div>
		  </div>
		
		<!--カレンダー表示エリア-->
		<div id="calendar"></div>
    <main>
      <!--ページの中心となる内容をまとめるためのタグ --> 
    <section id="section2" class="page-section">&nbsp;</section>  
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
  <section id="section3" class="page-section">&nbsp;</section>  
  <!-- ✅ スタンプ集計表ここから -->
   <h2 style="text-align:center;">スタンプ集計表</h2>
   <div id="stamp-summary">
    <table class="stamptable">
        <tr>
            <th>😆<br>楽しみ</th>
            <th>😊<br>喜び</th>
            <th>😠<br>怒り</th>
            <th>😢<br>悲しみ</th>          
            <th>😨<br>恐れ</th>
        </tr>
        <tr>
            <td id="stamp-5">0</td>
            <td id="stamp-4">0</td>
            <td id="stamp-3">0</td>
            <td id="stamp-2">0</td>
            <td id="stamp-1">0</td>
        </tr>
    </table>
  </div>
  <!--スタンプ集計表終わり-->

</main>
	
	</div>
	<!--javascriptのファイルの読み込み-->
	<script>
		const stampCount = Number("${stampCount != null ? stampCount : 0}");
		const totalScore = Number("${totalScore != null ? totalScore : 0}");
		
		const stampData = [];
		<c:forEach var="e" items="${stampCounts}">
		    stampData.push({ id: ${e.key}, count: ${e.value} });
		</c:forEach>
		
		stampData.forEach(item => {
		    const cell = document.getElementById(`stamp-${item.id}`);
		    if (cell) {
		      cell.textContent = item.count;
		    }
		  });
	</script> 
	<script src="js/home.js"></script>
	
	
	  
	
	
	<script>
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
        const emojiMap = {
        	    "1": "😨",
        	    "2": "😢",
        	    "3": "😠",
        	    "4": "😊",
        	    "5": "😆"
        	};
        
        const stampDates = {
        	  <c:forEach var="stamp" items="${allStamp}">
        	    "<fmt:formatDate value='${stamp.createdAt}' pattern='yyyy-MM-dd'/>": emojiMap["${stamp.emoStampId}"],
        	  </c:forEach>
        	};
        
        for ( var i = 0; i < 6; i++ ) {
            var row = document.createElement("tr");
            var isRowEmpty = true; // 行に今月の日付があるかチェック
            var isCrossMonthRow = false; // 今月の日付と翌月の日付が混じっている行か判定用
            
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
                    isCrossMonthRow = true; // 日付またぎの行と判定            
  
                    
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

                    function padZero(n) {
                    	  return n < 10 ? '0' + n : n;
                    	}
                    let thisDateStr = year + '-' + padZero(month + 1) + '-' + padZero(date);
                    console.log("thisDateStr（フォーマット確認）:", thisDateStr);
                    var stampDiv = document.createElement('div');
                    stampDiv.setAttribute('data-date', thisDateStr);

                    if (stampDates[thisDateStr]) {
                      stampDiv.textContent = '　'+stampDates[thisDateStr]; // 対応した絵文字を表示
                      
                      cell.appendChild(stampDiv);
                      console.log('年: ' + year + ', 月: ' + (month + 1) + ', 日: ' + thisDate);
                      cell.addEventListener("click", (function(y, m, d) {
                          return function() {
                          	const dateUrl = "MindShift-list?year=" + y + "&month=" + m + "&day=" + d;
                              console.log("Navigate to", dateUrl);
                              window.location.href = dateUrl;
                          };
                      })(year, month + 1, thisDate));
                      
                    } else {
                      stampDiv.textContent = '　　　'; // 何も表示しない
                      cell.appendChild(stampDiv); 
                    }

                    

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
            
            const plantImagesByDate = {
            		<c:forEach var="plant" items="${result_plant}" varStatus="status">
            	    "<fmt:formatDate value='${plant.createdAt}' pattern='yyyy-MM-dd'/>": "${plant.plant}"<c:if test="${!status.last}">,</c:if>
            	</c:forEach>
            		};
         // ★土曜日のセルの隣に画像セルを追加
          if(!isCrossMonthRow){
            let saturdayCell = row.children[6]; // 7列目（0開始）

            if (saturdayCell) {
                let year = saturdayCell.getAttribute("data-year");
                let month = saturdayCell.getAttribute("data-month");
                let day = saturdayCell.getAttribute("data-date");

                function padZero(n) {
                	  return n < 10 ? '0' + n : n;
                	}

                let dateStr = year + '-' + padZero(Number(month)) + '-' + padZero(Number(day));
                
                console.log("dateStr:", dateStr);
                console.log("plantImagesByDate[dateStr]:", plantImagesByDate[dateStr]);

                let imgCell = document.createElement("td");
                imgCell.className = "plant";
               

                if (plantImagesByDate[dateStr]) {
                    let img = document.createElement("img");
                    img.src = "${pageContext.request.contextPath}/image/" + plantImagesByDate[dateStr];
                    img.alt = "植物の画像";
                    img.width = 100;
                    img.height = 100;
                    imgCell.appendChild(img);
                } else {
                    imgCell.textContent = ""; // 画像なしは空セル
                }
                row.appendChild(imgCell);
            }

            if (!isRowEmpty) {
                tbl.appendChild(row);
            } else {
                break;
            }
          }else{
           
                const newCell = document.createElement('td');
                newCell.className = 'plant';

                const img = document.createElement('img');
                img.src = '${pageContext.request.contextPath}/image/logo_circle.png';   // 画像のパスを指定
                img.alt = '植物の画像';          // 代替テキスト
                img.width = 100;                 // 幅（必要に応じて調整）
                img.height = 100;     
                newCell.appendChild(img);
                row.appendChild(newCell);	
                	
                }
                   
           /* const contextPath = "${pageContext.request.contextPath}";
            const plantList = [
                <c:forEach var="item" items="${result_plant}" varStatus="status">
                    "${item.plant}"<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ];
            const plantName = plantList[i];
           

            
            if (!isCrossMonthRow) {
            	
            	
               
            	const newCell = document.createElement('td');
                newCell.className = 'plant';

                const img = document.createElement('img');
                img.src = contextPath + '/image/'+plantName; 
                img.width = 100;
                img.height = 100;

                newCell.appendChild(img);
                row.appendChild(newCell);
            	
            	
            	/*const newCell = document.createElement('td');
                newCell.className = 'plant';
                row.appendChild(newCell);*/
            	
            	
                
         /*   }else
            if(isCrossMonthRow){
            const newCell = document.createElement('td');
            newCell.className = 'plant';

            const img = document.createElement('img');
            img.src = '${pageContext.request.contextPath}/image/logo_circle.png';   // 画像のパスを指定
            img.alt = '植物の画像';          // 代替テキスト
            img.width = 100;                 // 幅（必要に応じて調整）
            img.height = 100;     
            newCell.appendChild(img);
            row.appendChild(newCell);	
            	
            }*/
        }

        }

        /*定の月と年における日数を返す*/
        function daysInMonth(iMonth, iYear) {
        return 32 - new Date(iYear, iMonth, 32).getDate();
        }
	</script>
	
	<!-- フッター（ここから） -->
	<jsp:include page="Mindshift_footer.jsp" />
	<!-- フッター（ここまで） -->
		
</body>
</html>