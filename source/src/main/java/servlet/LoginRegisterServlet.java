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
import util.MailUtil;

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
		
		if(checkDoneLogin(request, response)) {
			return;
		}
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
                session.setAttribute("user_id", user.getUserId());
                session.setAttribute("login_id", user.getLoginId());
                
    			// メール送信処理
    			String subject = "【MindShift】登録完了のお知らせ";
    			String body = 
    				    "MindShift運営チームよりご案内いたします。\n\n" +
    				    "このたびは、MindShiftへのご登録、誠にありがとうございます。\n" +
    				    "下記の内容で、正常に登録が完了いたしました。\n\n" +
    				    "━━━━━━━━━━━━━━━━━━━━━━\n" +
    				    "■ ご登録メールアドレス\n" +
    				    user.getLoginId() + "\n" +
    				    "━━━━━━━━━━━━━━━━━━━━━━\n\n" +
    				    "ログインに必要な情報となりますので、大切に保管してください。\n\n" +
    				    "今後とも、MindShiftをどうぞよろしくお願いいたします。\n\n" +
    				    "──────────────────────\n" +
    				    "※ 本メールは送信専用です。\n" +
    				    "　ご返信いただいても対応いたしかねますので、ご了承ください。\n" +
    				    "──────────────────────\n\n" +
    				    "FRIYAY Inc.\n" +
    				    "〒102-0083 東京都千代田区麹町1丁目6\n"
    				    ;
    			MailUtil.sendMail(loginId, subject, body);
                
                out.println("alert('登録が完了しました！');");
                out.println("window.location.href = 'MindShift-home';");
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
                
                for (int i = 0; i <= 1000; i++) {
                    bytes = md.digest(bytes);
                }
                
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
