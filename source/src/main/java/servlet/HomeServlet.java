package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllListDao;
import dto.AllListDto;

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
		
	}

}
