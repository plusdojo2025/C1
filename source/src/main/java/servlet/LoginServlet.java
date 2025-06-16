package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDao;
import dto.UsersDto;
import util.ConfigUtil;

@WebServlet("/MindShift-login")
public class LoginServlet extends CustomTemplateServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		UsersDao userDao = new UsersDao();
//		UsersDto userDto = new UsersDto();
//		
//		//AIのカラム以外を記載
//		userDto.setLoginId("setLoginId");
//		userDto.setPasswordHash("setPasswordHash");
//		
//		userDao.insert(userDto);
//		userDao.select(userDto);
//		userDao.update(userDto);
//		userDao.delete(userDto);
		
//		if(checkDoneLogin(request, response)) {
//			return;
//		}
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        	
        	//フォームから送られてきた情報を取得
            String loginId = request.getParameter("loginid");
            String password = request.getParameter("password");
            //パスワードをハッシュ化
            String hashedPassword = hashPassword(password);
            
            //データベースアクセス用DAO
            UsersDao dao = new UsersDao();
            //ユーザー情報、login_idチェック
            UsersDto user = dao.findUser(loginId);

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<html><head><title>ログイン結果</title>");
            out.println("<script type='text/javascript'>");
            
            //ログイン判定
            if (user == null) {
                // メールアドレス(login_id)が違う
                out.println("alert('メールアドレスが違います');");
                out.println("window.location.href = 'MindShift-login';");
            } else if (!user.getPasswordHash().equals(hashedPassword)) {
                // パスワードが違う
                out.println("alert('パスワードが違います');");
                out.println("window.location.href = 'MindShift-login';");
            } else {
                // ログイン成功
            	// セッションを作成して、ユーザー情報を保存
                HttpSession session = request.getSession();
                session.setAttribute("user_id", user.getUserId());
                session.setAttribute("login_id", user.getLoginId());

                out.println("alert('ログイン成功！');");
                //homeのservletのマッピング名に変更してください
                out.println("window.location.href = 'MindShift-home';");
                session.setAttribute("loginid", "password");
            }

            out.println("</script>");
            out.println("</head><body></body></html>");
        }
	
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            String combined = password + ConfigUtil.getPepper(); // pepper付き
            byte[] bytes = md.digest(combined.getBytes("UTF-8"));

            // バイト配列 → 16進数文字列
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
