package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllListDao;
import dao.EmotionsDao;
import dao.FeedbacksDao;
import dto.AllList;
import dto.EmotionsDto;
import dto.ErrorDto;
import dto.FeedbacksDto;



/**
 * Servlet implementation class PositiveServlet
 */
@WebServlet("/MindShift-positive")
public class PositiveServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public PositiveServlet() {
        // TODO Auto-generated constructor stub
    }

    @Override
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
				
				//EmotionsDaoでデータベースから情報を得る
				EmotionsDao eDao = new EmotionsDao();
				EmotionsDto eDto = new EmotionsDto();
				eDto.setEmoStamp(Integer.parseInt(request.getSession().getAttribute("user_id").toString()));
				
				List<EmotionsDto> emotions = eDao.select(eDto);
		        request.setAttribute("emotionsList", emotions.get(0));
				
		       //FeedbacksDaoでデータベースから情報を得る
		       FeedbacksDao fDao = new FeedbacksDao();
		       FeedbacksDto fDto = new FeedbacksDto();
		       fDto.setEmotionId(emotions.get(0).getEmotion());
		       List<FeedbacksDto> feedbacks = fDao.select(fDto);
			   request.setAttribute("feedbacksList", feedbacks.get(0));
		        
				// ポジティブページにフォワードする
			    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/positive.jsp");
				dispatcher.forward(request, response);
			}
	
			@Override
			//「checkNoneLogin」、「logout」の処理を加えてください。(logoutはナビゲーションがあるページのみに適用する。)
			protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
				// TODO 自動生成されたメソッド・スタブ
				request.setCharacterEncoding("UTF-8");

				//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
				if(checkNoneLogin(request, response)) {
					return;
				}	
				//ログアウト処理(HomeServletをそのままコピーしてもらって大丈夫です。)
				if (logout(request, response)) {
					return;
				}
				
				//アカウント削除処理(HomeServletをそのままコピーしてもらって大丈夫です。)
				if (account_del(request, response)) {
					return;
				}
				
      			// リクエストパラメータを取得（入力された内容を取得する）
				Integer userId = (Integer) request.getSession().getAttribute("user_id");
				int emo_stamp = Integer.parseInt(request.getParameter("emo_stamp"));
				String action = request.getParameter("action");
				int emotion = Integer.parseInt(request.getParameter("emotion"));
				int feedbacks_id = Integer.parseInt(request.getParameter("feedbacks_id"));
				String feedbacks = request.getParameter("feedbacks");
				
				
				
				try {
				// AllListDaoのinsert文を呼び出して登録処理をする
				AllList AL = new AllList(0, userId, emo_stamp ,action, emotion, feedbacks_id, new java.util.Date(), "");	
				AL.setFeedbacks(feedbacks);
				AllListDao AllListDAO = new AllListDao();
				AllListDAO.insert(AL);	
		
				// ページ遷移
				response.sendRedirect("MindShift-home");
				}catch(Exception e) {
					//スコープにデータ保存
					request.setAttribute("systemError", new ErrorDto("エラー","何らかのエラーが発生しております。","MindShift-home")); 

					// エラーページにフォワードする
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/error.jsp");
					dispatcher.forward(request, response);
				}
			
			}





}
