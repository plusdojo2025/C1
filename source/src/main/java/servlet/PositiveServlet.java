package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import dao.EmotionsDao;
//import dto.EmotionsDto;

/**
 * Servlet implementation class PositiveServlet
 */
@WebServlet("/PositiveServlet")
public class PositiveServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public PositiveServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		EmotionsDao emotionDao = new EmotionsDao();
//		EmotionsDto emotionDto = new EmotionsDto();
//		
//		//AIのカラム以外を記載
//		emotionDto.setAction("setAction");
//		emotionDto.setEmotion(0);
//				
//		//userDto.setUserId(23);
//				
//		emotionDao.insert(emotionDto);
//		allListDao.select(allListDto);
//		emotionDao.update(emotionDto);
//		emotionDao.delete(emotionDto);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
				if(checkNoneLogin(request, response)) {
					return;
				}
				// ホームページにフォワードする
			    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/positive.jsp");
				
				dispatcher.forward(request, response);
			}

			@Override
			//「checkNoneLogin」、「logout」の処理を加えてください。(logoutはナビゲーションがあるページのみに適用する。)
			protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
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
