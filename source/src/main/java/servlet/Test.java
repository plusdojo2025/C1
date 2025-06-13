package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import dto.UsersDto;

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
		UsersDao userDao = new UsersDao();
		UsersDto userDto = new UsersDto();
		
		userDto.setLoginId("setLoginId");
		userDto.setPasswordHash("setPasswordHash");
		
		//userDto.setUserId(23);
		
		userDao.insert(userDto);
		userDao.select(userDto);
		userDao.update(userDto);
		userDao.delete(userDto);
		
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
