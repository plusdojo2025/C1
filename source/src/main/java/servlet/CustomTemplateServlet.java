package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public abstract class CustomTemplateServlet extends HttpServlet {
	
	//ログアウト処理（セッションのidを削除）
	public boolean logout(HttpServletRequest request, HttpServletResponse response) 
		throws IOException {
		String logout = request.getParameter("logout");
		boolean result = (logout != null);
		if (logout != null) {
			/*ログアウトボタンが押された*/
			HttpSession session = request.getSession();
			session.removeAttribute("id");
			checkNoneLogin(request, response);
		}
		return result;
	}
	
	//未ログインならログイン画面へリダイレクト
	protected final boolean checkNoneLogin(HttpServletRequest request, HttpServletResponse response) 
			   throws IOException {
		HttpSession session = request.getSession();
		boolean result = (session.getAttribute("id") == null);
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
		boolean result = (session.getAttribute("id") != null);
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
