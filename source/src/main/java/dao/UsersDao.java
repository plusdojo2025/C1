package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import dto.UsersDto;

public class UsersDao extends CustomTemplateDao<UsersDto> {

	@Override
	public List<UsersDto> select(UsersDto dto) {
		Connection conn = null;
		List<UsersDto> users = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = "SELECT * from users where login_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getUserId());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				UsersDto user = new UsersDto(rs.getInt("user_id"),
						rs.getString("login_id"),
						rs.getString("password_hash")
				);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			users = null;
		} finally {
			// データベースを切断
			close(conn);
		}

		// 結果を返す
		return users;
	}

	@Override
	public boolean insert(UsersDto dto)  {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = """
					insert users(login_id, password_hash) 
					 		value(		?,				?)
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, dto.getLoginId());
			pStmt.setString(2, dto.getPasswordHash());

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				ResultSet res = pStmt.getGeneratedKeys();
				res.next();
				dto.setUserId(res.getInt(1));
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			close(conn);
			}
		
		// 結果を返す
		return result;
	}

	@Override
	public boolean update(UsersDto dto) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = """
					update users set
login_id = ?
, password_hash = ?
					 where user_id = ?
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, dto.getLoginId());
			pStmt.setString(2, dto.getPasswordHash());
			pStmt.setInt(3, dto.getUserId());

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			close(conn);
			}
		
		// 結果を返す
		return result;
	}

	@Override
	public boolean delete(UsersDto dto) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = "DELETE FROM users where user_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getUserId());

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			close(conn);
			}
		
		// 結果を返す
		return result;
	}
	
    public UsersDto findUser(String loginId) {
    	Connection conn = null;
    	UsersDto user = null;

        try {
			conn = conn();
            String sql = "SELECT * FROM users WHERE login_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, loginId);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new UsersDto();
                user.setUserId(rs.getInt("user_id"));
                user.setLoginId(rs.getString("login_id"));
                user.setPasswordHash(rs.getString("password_hash"));
            }

            close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean registerUser(UsersDto user) {
    	Connection conn = null;
        try {
			conn = conn();

            String sql = "INSERT INTO users (login_id, password_hash) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getLoginId());
            stmt.setString(2, user.getPasswordHash());

            int rows = stmt.executeUpdate();

            close(conn);

            return rows > 0;
            
        //制約に違反した場合(login_idはunique属性)
        } catch (SQLIntegrityConstraintViolationException e) {
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
