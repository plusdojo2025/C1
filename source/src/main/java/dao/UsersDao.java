package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			String sql = "SELECT * from users where user_id = ?";
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
	public boolean insert(UsersDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean update(UsersDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean delete(UsersDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

}
