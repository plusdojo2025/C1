package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;
import dto.UsersDto;

@WebServlet("/MindShift-login")
public class LoginServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersDao userDao = new UsersDao();
		UsersDto userDto = new UsersDto();
		
		//AIのカラム以外を記載
		userDto.setLoginId("setLoginId");
		userDto.setPasswordHash("setPasswordHash");
		
		userDao.insert(userDto);
		userDao.select(userDto);
		userDao.update(userDto);
		userDao.delete(userDto);
		
		if(checkDoneLogin(request, response)) {
			return;
		}
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		if(checkDoneLogin(request, response)) {
			return;
		}
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");	
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		response.sendRedirect("MindShift-home");
		
	}
}
