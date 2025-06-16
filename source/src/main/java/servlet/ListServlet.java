package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/Mindshift-list")
public class ListServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ListServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin(request, response)) {
			return;
		}	
		
		/*AllListDao allListDao = new AllListDao();
		AllListDto allListDto = new AllListDto();
		
		//AIのカラム以外を記載
		allListDto.setId(Integer.parseInt(request.getParameter("id")));
		allListDto.setEmoStampId(Integer.parseInt(request.getParameter("emo_stamp_id")));
		allListDto.setAction("action");
		allListDto.setEmotionId(Integer.parseInt(request.getParameter("emotion_id")));
		allListDto.setFeedbacksId(Integer.parseInt(request.getParameter("feedbacks_id")));
		String createdAtStr = request.getParameter("created_at"); // フォーム名に合わせる
		Timestamp createdAt = Timestamp.valueOf(createdAtStr);    // 文字列 → Timestamp
	    allListDto.setCreated_at(createdAt);  
		allListDto.setPlant("plant");*/
		
		 	
		//userDto.setUserId(23);
		
		//allListDao.insert(allListDto);
		//allListDao.select(allListDto);
		//allListDao.update(allListDto);
		//allListDao.delete(allListDto);
		
		//request.setAttribute("result",allListDto);
				
		
		// ホームページにフォワードする
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
		
		dispatcher.forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
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
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
