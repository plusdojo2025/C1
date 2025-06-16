package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AllListDao;
import dto.AllListDto;

//ページのURLの名前を入れる
@WebServlet("/MindShift-home")
public class HomeServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

	@Override
	//「checkNoneLogin」の処理を加えてください。
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		AllListDao allListsDao = new AllListDao();
		AllListDto allListsDto = new AllListDto();
		
		allListsDto.setEmoStampId(0);
		allListsDto.setAction("setAction");
		allListsDto.setEmotionId(0);
		allListsDto.setFeedbacksId(0);
		allListsDto.setCreatedAt(new Date());
		allListsDto.setPlant("setPlant");
		
		allListsDao.insert(allListsDto);
		allListsDao.select(allListsDto);
		allListsDao.update(allListsDto);
		allListsDao.delete(allListsDto);
		
			
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin(request, response)) {
			return;
		}
		// ホームページにフォワードする
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
		
		dispatcher.forward(request, response);
		
	}
	
		//ホームページスタンプ集計表とオブジェクト表示用
		/*<内容>					<実装方法>                                        
		 スタンプ件数とスコア取得      Java + SQL（7日分）                             
		 JavaScriptへの受け渡し 	 `<%= request.getAttribute(...) %>` でJSに変数渡し
		 植物の種類を変える        	 `getPlantType(score)` 関数で制御                 
		 植物の段階を変える        	 `getGrowthStage(count)` 関数で制御               
		 画像ファイル           	 `img/${type}_${stage}.png` 形式で準備 */  
	
		/* int stampCount = 0;
		 int totalScore = 0;

		    try (Connection conn = DBUtil.getConnection()) {
		      String sql = "SELECT COUNT(*) AS count, SUM(weekstamps) AS total FROM stamps " +
		                   "WHERE created_at >= CURDATE() - INTERVAL 7 DAY";

		      PreparedStatement ps = conn.prepareStatement(sql);
		      ResultSet rs = ps.executeQuery();

		      if (rs.next()) {
		        stampCount = rs.getInt("count");
		        totalScore = rs.getInt("total"); // NULL のときは 0 にしたい
		      }

		    } catch (Exception e) {
		      e.printStackTrace();
		    }

		    request.setAttribute("stampCount", stampCount);
		    request.setAttribute("totalScore", totalScore > 0 ? totalScore : 0);

		    RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
		    rd.forward(request, response);*/

	
	


	@Override
	//「checkNoneLogin」、「logout」の処理を加えてください。(logoutはナビゲーションがあるページのみに適用する。)
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		
		//ログインしていなかった場合、ログイン画面にリダイレクト処理をする。(HomeServletをそのままコピーしてもらって大丈夫です。)
		if(checkNoneLogin(request, response)) {
			return;
		}	
		//ログアウト処理(HomeServletをそのままコピーしてもらって大丈夫です。)
		if (logout(request, response)) {
			return;
		}
		
		if (account_del(request, response)) {
			return;
		}
		
		
	}
	  

	   
	


}
