package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AllListDao;
import dto.AllListDto;
import dto.stampsDto;

//ページのURLの名前を入れる
@WebServlet("/MindShift-home")
public class HomeServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

	@Override
	//「checkNoneLogin」の処理を加えてください。
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		AllListDao allListsDao = new AllListDao();
		AllListDto allListsDto = new AllListDto();
		
		allListsDto.setEmoStampId(0);
		allListsDto.setAction("setAction");
		allListsDto.setEmotionId(0);
		allListsDto.setFeedbacksId(0);
		allListsDto.setCreatedAt(new Date());
		allListsDto.setPlant("setPlant");
		
		
		allListsDao.insert(allListsDto);
		allListsDao.select(allListsDto);
		allListsDao.update(allListsDto);
		allListsDao.delete(allListsDto);
		
			
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin(request, response)) {
			return;
		}
		//セッションの取得
		HttpSession session = request.getSession();
		Integer userId = (Integer) request.getSession().getAttribute("user_id");
		
		//ホームページ　オブジェクト表示用 AllListテーブルから件数とスコア
		AllListDao sDao = new AllListDao();
	    stampsDto summary = sDao.selectWeeklySummary(userId);
		    request.setAttribute("stampCount",  summary.getCnt());
		    request.setAttribute("totalScore",  summary.getTotalScore());
		        
		  //コンソールにテスト表示
		    System.out.println("stampCount = " + summary.getCnt());
		    System.out.println("totalScore = " + summary.getTotalScore());
		     
		    
		    String gazou="";
		    if(summary.getCnt()==0) {
		    	 gazou = "uekibati.png";
		    }else if(summary.getCnt() >= 1 && summary.getCnt() <= 3) {
		    	 gazou = "me.png";
		    }else if(summary.getCnt() >= 4 && summary.getCnt() <= 6) {
		    	 gazou = "me.png";
		    }   
		    if(summary.getCnt()==7) {
		    	if(summary.getTotalScore()<= 10) {
		    		 gazou = "lavender.png";
		    	}else if(summary.getTotalScore()<= 14) {
		    		 gazou = "rindou.png";
		    	}else if(summary.getTotalScore()<= 18) {
		    		 gazou = "nemophila.png";
		    	}else if(summary.getTotalScore()<= 22) {
		    		 gazou = "dandelion.png";
		    	}else if(summary.getTotalScore()<= 26) {
		    		 gazou = "sunflower.png";
		    	}else if(summary.getTotalScore()<= 30) {
		    		 gazou = "tulips.png";
		    	}else if(summary.getTotalScore()<= 30) {
		    		 gazou = "roses.png";
		    	}
		    	
		    }
		    
		    System.out.println(gazou);
		    

		    // スタンプ集計表（1か月分）
		    AllListDao dao = new AllListDao();
		    Map<Integer, Integer> stampCounts = dao.getStampCountsThisMonth(userId);  
		    request.setAttribute("stampCounts", stampCounts);

		    //コンソールにテスト
		    System.out.println("stampCounts = " + stampCounts);
		    
		    
		    AllListDao allstamps = new AllListDao();   
		    List<AllListDto> allStamp = allstamps.select_stamp(userId);
		    
		    request.setAttribute("allStamp", allStamp);
		    
		    //ホームのカレンダーに植物表示
		    AllListDao plant = new AllListDao();   
		    List<AllListDto> result_plant = plant.plant_display(userId);
		    
		    request.setAttribute("result_plant", result_plant);
		    

	    // ホームページにフォワードする
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		dispatcher.forward(request, response);
		
	}
			    
			   

	
		

	
	


	@Override
	//「checkNoneLogin」、「logout」の処理を加えてください。(logoutはナビゲーションがあるページのみに適用する。)
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin(request, response)) {
			return;
		}	
		//ログアウト処理(HomeServletをそのままコピーしてもらって大丈夫です。)
		if (logout(request, response)) {
			return;
		}
		
		if (account_del(request, response)) {
			return;
		}
		
		
	}
	  

	   
	


}
