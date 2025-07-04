package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.EmotionsDto;

public class EmotionsDao extends CustomTemplateDao<EmotionsDto> {
	
	// 感情登録内容を指定し取り出す（select文）
	@Override
	public List<EmotionsDto> select(EmotionsDto dto) {
		Connection conn = null;
		List<EmotionsDto> emotions = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = "Select * from emotions where emo_stamp = ? order by id desc limit 1";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, dto.getEmoStamp());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				EmotionsDto emotion = new EmotionsDto(rs.getInt("emo_stamp"),
						rs.getString("action"),
						rs.getInt("emotion")
				);
				emotions.add(emotion);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			emotions = null;
		} finally {
			// データベースを切断
			close(conn);
		}

		// 結果を返す
		return emotions;
	}

	// ユーザーの入力した感情を登録する（insert文）
	@Override
	public boolean insert(EmotionsDto dto) {
		Connection conn = null;
		boolean result = false;

		try {
			conn = conn();

			// SQL文を準備する
			String sql = """
					insert emotions(emo_stamp, action, emotion)
							value(?,?,?)
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getEmoStamp());
			pStmt.setString(2, dto.getAction());
			pStmt.setInt(3, dto.getEmotion());

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
	/*
	public boolean insert(EmotionsDto dto)  {
		{
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				// データベースに接続する
				conn = conn();

				// SQL文を準備する
				String sql = """
						insert emotions(action, emotion )
								value(?, ?)
						""";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, dto.getAction());
				pStmt.setInt(2, dto.getEmotion());


				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					ResultSet res = pStmt.getGeneratedKeys();
					res.next();
					dto.setEmoStamp(res.getInt(1));
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
	}
	*/

	@Override
	public boolean update(EmotionsDto dto) {
		boolean result = false;
/*
		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = """
					update emotions set
					emoStamp = ?  
					action = ? 
					emotion = ? 
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getEmoStamp());
			pStmt.setString(2, dto.getAction());
			pStmt.setInt(3, dto.getEmotion());

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
		*/
		// 結果を返す
		return result;
	}

	@Override
	// all list登録タイミングでdeleteするためのdelete文
	public boolean delete(EmotionsDto dto) {
		Connection conn = null;
		boolean result = false;

		try {
			conn = conn();

			// SQL文を準備する
			String sql = "delete from emotions";
			PreparedStatement pStmt = conn.prepareStatement(sql);

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
}
