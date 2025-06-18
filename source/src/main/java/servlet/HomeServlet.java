package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AllListDao;
import dao.stampsDao;
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
		
		//ホームページ　オブジェクト表示用stampsテーブルから件数とスコア
		 stampsDao sDao = new stampsDao();
		    stampsDto summary = sDao.selectWeeklySummary(userId);
		    request.setAttribute("stampCount",  summary.getCount());
		    request.setAttribute("totalScore",  summary.getTotalScore());

		    // スタンプ集計表（1か月分）
		    AllListDao aDao = new AllListDao();
		    request.setAttribute("stampCounts", aDao.getStampCountsThisMonth(userId));
		    
		    //コンソールにテスト表示
		    System.out.println("stampCount = " + summary.getCount());
		    System.out.println("totalScore = " + summary.getCount());
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
