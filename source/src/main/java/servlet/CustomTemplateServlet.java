package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AllListDao;
import dao.UsersDao;
import dto.UsersDto;

public abstract class CustomTemplateServlet extends HttpServlet {
	
	//ログアウト処理（セッションのidを削除）
	public boolean logout(HttpServletRequest request, HttpServletResponse response) 
		throws IOException {
		String logout = request.getParameter("logout");
		boolean result = (logout != null);
		if (logout != null) {
			/*ログアウトボタンが押された*/
			HttpSession session = request.getSession();
			session.removeAttribute("user_id");
			checkNoneLogin(request, response);
		}
		return result;
	}
	
	//アカウント削除処理（セッションのidを削除）
	public boolean account_del(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		String account_del = request.getParameter("account_del");
		boolean result = (account_del != null);
		if (account_del != null) {
			// セッションからuser_idを取得
			HttpSession session = request.getSession();
			Integer userId = (Integer) session.getAttribute("user_id");
			
			if (userId != null) {
				UsersDto dto = new UsersDto();
				dto.setUserId(userId);  // ここが重要
				AllListDao allListDao = new AllListDao();
				boolean delete_date = allListDao.delete_date(userId);
				
				UsersDao dao = new UsersDao();
				boolean deleted = dao.delete(dto);
				
				if (deleted || delete_date) {
					session.invalidate(); // セッション破棄（ログアウト状態に）
					response.sendRedirect("MindShift-login"); // ログイン画面へリダイレクト
				} else {
					// 削除失敗時の処理（必要なら）
				}
			} else {
				// user_idがなければログイン画面へリダイレクト
				response.sendRedirect("MindShift-login");
			}
		}
		return result;
	}

	
	
	//未ログインならログイン画面へリダイレクト
	protected final boolean checkNoneLogin(HttpServletRequest request, HttpServletResponse response) 
			   throws IOException {
		HttpSession session = request.getSession();
		boolean result = (session.getAttribute("user_id") == null);
		if (result) {
			// LOGINにリダイレクトする
			response.sendRedirect("MindShift-login");
		}
		return result;
	}
	
	//ログイン済みかチェックして、済みならMindShift-homeにリダイレクト
	protected final boolean checkDoneLogin(HttpServletRequest request, HttpServletResponse response) 
			   throws IOException {
		HttpSession session = request.getSession();
		boolean result = (session.getAttribute("user_id") != null);
		if (result) {
			// MENUにリダイレクトする
			response.sendRedirect("MindShift-home");
		}
		return result;
	}
	
	@Override
	protected abstract void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	@Override
	protected abstract void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
}
