package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmotionsDao;
import dao.UsersDao;
import dto.EmotionsDto;
import dto.UsersDto;

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
		EmotionsDao emotionDao = new EmotionsDao();
		EmotionsDto emotionDto = new EmotionsDto();
		
		//AIのカラム以外を記載
		emotionDto.setAction("setAction");
		emotionDto.setEmotion(0);
				
		//userDto.setUserId(23);
				
		emotionDao.insert(emotionDto);
		emotionDao.select(emotionDto);
		emotionDao.update(emotionDto);
		emotionDao.delete(emotionDto);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
