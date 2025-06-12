package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.EmotionsDto;

public class EmotionsDao extends CustomTemplateDao<EmotionsDto> {
	
	@Override
	public List<EmotionsDto> select(EmotionsDto dto) {
		Connection conn = null;
		List<EmotionsDto> emotions = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = "Select * from emotions";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
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

	@Override
	public boolean insert(EmotionsDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean update(EmotionsDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean delete(EmotionsDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

}
