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
	
	//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
	if(checkNoneLogin(request, response)) {
		return;
	}	
	
	EmotionsDao EmotionDao = new EmotionsDao();
	EmotionsDto EmotionDto = new EmotionsDto();
	
	EmotionDto.setEmoStamp(0);
	EmotionDto.setAction("setAction");
	EmotionDto.setEmotion(0);
	
	EmotionDao.insert(EmotionDto);
	EmotionDao.select(EmotionDto);
	EmotionDao.update(EmotionDto);
	EmotionDao.delete(EmotionDto);
	response.getWriter().append("Served at: ").append(request.getContextPath());
	
	//ログアウト処理(HomeServletをそのままコピーしてもらって大丈夫です。)
	if (logout(request, response)) {
		return;
	}
	
}

}
