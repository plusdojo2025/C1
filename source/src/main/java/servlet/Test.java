package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllListDao;
import dto.AllListDto;

/**
 * Servlet implementation class Test
 */
@WebServlet("/test")
public class Test extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Test() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AllListDao MyAllListDao = new AllListDao();
		AllListDto MyAllListDto = new AllListDto();
		
		//AIのカラム以外を記載
		MyAllListDto.setId(0);
		MyAllListDto.setEmoStampId(0);
		MyAllListDto.setAction("setAction");
		MyAllListDto.setEmotionId(0);
		MyAllListDto.setFeedbacksId(0);
		MyAllListDto.setCreatedAt(null);
		MyAllListDto.setPlant("setEmoStampId");
		
		
		//userDto.setUserId(23);
		
		MyAllListDao.insert(MyAllListDto);
		MyAllListDao.select(MyAllListDto);
		MyAllListDao.update(MyAllListDto);
		MyAllListDao.delete(MyAllListDto);
		
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
