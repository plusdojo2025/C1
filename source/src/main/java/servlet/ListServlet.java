package servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllListDao;
import dto.AllListDto;

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
		AllListDao AllListDao = new AllListDao();
		AllListDto AllListDto = new AllListDto();
		
		//AIのカラム以外を記載
		AllListDto.setId(Integer.parseInt(request.getParameter("id")));
		AllListDto.setEmoStampId(Integer.parseInt(request.getParameter("emo_stamp_id")));
		AllListDto.setAction("action");
		AllListDto.setEmotionId(Integer.parseInt(request.getParameter("emotion_id")));
		AllListDto.setFeedbacksId(Integer.parseInt(request.getParameter("feedbacks_id")));
		String createdAtStr = request.getParameter("created_at"); // フォーム名に合わせる
		Timestamp createdAt = Timestamp.valueOf(createdAtStr);    // 文字列 → Timestamp
		AllListDto.setCreated_at(createdAt);  
		AllListDto.setPlant("plant");
		
		 
		
		//userDto.setUserId(23);
		
		AllListDao.insert(AllListDto);
		AllListDao.select(AllListDto);
		AllListDao.update(AllListDto);
		AllListDao.delete(AllListDto);
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
