package servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AllListDao;
import dto.AllListDto;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/MindShift-list")
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
        if (checkNoneLogin(request, response)) {
            return;
        }	
        Calendar calendar = Calendar.getInstance();
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");

        
        HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("user_id");

       
        int recordsPerPage = 7;
	    int currentPage = 1;
	    String pageParam = request.getParameter("page");
	    if (pageParam != null && !pageParam.isEmpty()) {
	        currentPage = Integer.parseInt(pageParam);
	    } else if(year!=null) {
	    	 AllListDao allListDao = new AllListDao();
	        // 指定日のページ番号が計算されている場合、それを初期表示にする
	        int recordIndex = allListDao.countBeforeDateInMonth(year, month, day, userId);
	        currentPage = (recordIndex / recordsPerPage) + 1;
	    }
	    
	    int offset = (currentPage - 1) * recordsPerPage;
	    
	    if (year== null ) {
        AllListDao allListDao = new AllListDao();
        
        int totalRecords = allListDao.count(userId);
	    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
	    
	    List<AllListDto> pagedCards = allListDao.selectWithPaging(recordsPerPage, offset,userId);
	
	    
        // 取得したリストをJSPに渡す
	    request.setAttribute("cardList", pagedCards);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("month", String.valueOf(calendar.get(Calendar.MONTH)+1));
        request.setAttribute("year", String.valueOf(calendar.get(Calendar.YEAR)));
        request.setAttribute("day", String.valueOf(calendar.get(Calendar.DATE)));
	    request.setAttribute("totalPages", totalPages); 
	    }else {
	    
	    AllListDao allListDao = new AllListDao();
	   
	    int totalRecords = allListDao.count_history(year,month,day,userId);
	 	int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
	 	    
	 	List<AllListDto> pagedCards = allListDao.selectWithPaging_history(recordsPerPage, offset,year,month,day,userId);
	 	 
	 	
	    // 取得したリストをJSPに渡す
	 	
	 	request.setAttribute("cardList", pagedCards);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("month", month);
	    request.setAttribute("year", year);
	    request.setAttribute("day", day);
	 	request.setAttribute("totalPages", totalPages); 	
	    		    	
	    }
        
        // list.jspへフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
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
		
		
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
