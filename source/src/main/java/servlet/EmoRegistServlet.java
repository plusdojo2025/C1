package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmotionsDao;
import dto.EmotionsDto;


/**
 * Servlet implementation class EmoRegistServlet
 */
@WebServlet("/MindShift-regist")
public class EmoRegistServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EmoRegistServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin (request, response)) {
			return;
		}	
		// ホームページにフォワードする
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	// TODO 自動生成されたメソッド・スタブ
	
	//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。
	if(checkNoneLogin(request, response)) {
		return;
	}	
	request.setCharacterEncoding("UTF-8");
	
	EmotionsDao EmotionDao = new EmotionsDao();
	EmotionsDto EmotionDto = new EmotionsDto();
	
//	int emo
	
//	EmotionDto.setEmoStamp(0);
//	EmotionDto.setAction("action");
//	EmotionDto.setEmotion(0);
	
//	EmotionDao.insert(0,action,0);
//	EmotionDao.select(EmotionDto);
//	EmotionDao.update(EmotionDto);
//	EmotionDao.delete(EmotionDto);
	response.getWriter().append("Served at: ").append(request.getContextPath());
	
	//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。
	if(checkNoneLogin(request, response)) {
		return;
	}	
	//ログアウト処理
	if (logout(request, response)) {
		return;
	}
	// アカウント削除処理
	if (account_del(request, response)) {
		return;
	}
	
}

}
