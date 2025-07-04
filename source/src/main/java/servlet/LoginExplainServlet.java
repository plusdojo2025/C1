package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExplanationDao;
import dto.ExplanationDto;

/**
 * Servlet implementation class ExplainServlet
 */
@WebServlet("/MindShift-loginExplain")
public class LoginExplainServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginExplainServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
		ExplanationDao ExplanationDao = new ExplanationDao();
		ExplanationDto ExplanationDto = new ExplanationDto();
		
		ExplanationDto.setTitle("setTitle");
		ExplanationDto.setContent("setContent");
		
		ExplanationDao.select(ExplanationDto);
		ExplanationDao.insert(ExplanationDto);
		ExplanationDao.update(ExplanationDto);
		ExplanationDao.delete(ExplanationDto);
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
//			if(checkNoneLogin(request, response)) {
//				return;
//			}
//			
			ExplanationDao ExplanationDAO = new ExplanationDao();
			List<ExplanationDto> explanation = ExplanationDAO.select(ExplanationDto);
	        request.setAttribute("explainList", explanation);

		// ホームページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/loginExplain.jsp");	
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
