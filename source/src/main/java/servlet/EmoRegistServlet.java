package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllListDao;
import dao.EmotionsDao;
import dto.EmotionsDto;


/**
 * Servlet implementation class EmoRegistServlet
 */
@WebServlet("/MindShift-regist")
public class EmoRegistServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		//セッションuser_id取得
	    Integer userId = (Integer) request.getSession().getAttribute("user_id");
		
	    //ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin (request, response)) {
			return;
		}
		
	    // 今日すでに登録があるかチェック
	    AllListDao allListDao = new AllListDao();
	    boolean hasTodayEntry = allListDao.hasTodayEntry(userId);

	    if (hasTodayEntry) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('登録は1日1回までです');");
	        out.println("window.location.href = 'MindShift-home';");
	        out.println("</script>");
	        out.close();
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
	// リクエストパラメータを取得（入力された内容を取得する）
	request.setCharacterEncoding("UTF-8");
//	int emo_stamp = Integer.parseInt(request.getParameter("emoStamp"));
	String action = request.getParameter("action");
	int emotion = Integer.parseInt(request.getParameter("emotion"));
	
//	EmotionDto.setEmoStamp(0);
//	EmotionDto.setAction("action");
//	EmotionDto.setEmotion(0);
	
	// EmotionsDaoのinsert文を呼び出して登録処理をする
	EmotionsDao EmotionDao = new EmotionsDao();
    int userId = Integer.parseInt(request.getSession().getAttribute("user_id").toString());
	EmotionDao.insert(new EmotionsDto(userId, action, emotion));
	
//	EmotionDao.select(EmotionDto);
//	EmotionDao.update(EmotionDto);
//	EmotionDao.delete(EmotionDto);
	
	// フィードバック画面にリダイレクトする
	response.sendRedirect("MindShift-positive");
	
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
