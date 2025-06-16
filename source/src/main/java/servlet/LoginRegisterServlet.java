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

/**
 * Servlet implementation class LoginRegisterServlet
 */
@WebServlet("/MindShift-register")
public class LoginRegisterServlet extends CustomTemplateServlet {
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
		// 新規登録にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp");
		dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        	
        	//フォームから送られてきた情報を取得
            String loginId = request.getParameter("loginid");
            String password = request.getParameter("password");
            //パスワードをハッシュ化
            String hashedPassword = hashPassword(password);
            
            //ユーザー情報をDTOにまとめる
            UsersDto user = new UsersDto();
            user.setLoginId(loginId);
            user.setPasswordHash(hashedPassword);
            
            //データベースに登録
            UsersDao dao = new UsersDao();
            boolean success = dao.registerUser(user);

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<html><head><title>登録結果</title>");
            out.println("<script type='text/javascript'>");
            
            //登録判定
            if (success) {
                // セッションにログインID保存（任意）
                HttpSession session = request.getSession();
                session.setAttribute("login_id", loginId);

                out.println("alert('登録が完了しました！');");
                //homeのservletのマッピング名に変更してください
                out.println("window.location.href = 'MindShift-register';");
            } else {
                out.println("alert('このメールアドレスはすでに存在します');");
                out.println("window.location.href = 'MindShift-register';");
            }

            out.println("</script>");
            out.println("</head><body></body></html>");
        }
        
        private String hashPassword(String password) {
            try {
                MessageDigest md = MessageDigest.getInstance("SHA-512");
                String combined = password + ConfigUtil.getPepper();
                byte[] bytes = md.digest(combined.getBytes("UTF-8"));
                
                //バイト配列を16進数に変換
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
