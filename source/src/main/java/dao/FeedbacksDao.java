package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.FeedbacksDto;

public class FeedbacksDao extends CustomTemplateDao<FeedbacksDto> {
	
	@Override
	public List<FeedbacksDto> select(FeedbacksDto dto) {
		Connection conn = null;
		List<FeedbacksDto> feedbacks = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = """
					SELECT
e.emo_stamp_id,
e.id AS emotion_id,
e.name AS emotion_name,
em.action,
f.feedbacks,
f.id AS feedbacks_id
FROM feedbacks f
JOIN emotion e ON f.emotion_id = e.id
JOIN emotions em ON e.emo_stamp_id = em.emo_stamp
WHERE e.id = ?
ORDER by rand() limit 1
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getEmotionId());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				FeedbacksDto feedback = new FeedbacksDto(
						rs.getInt("feedbacks_id"),
						rs.getInt("emo_stamp_id"),
						rs.getInt("emotion_id"),
						rs.getString("feedbacks")
				);
				feedbacks.add(feedback);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			feedbacks = null;
		} finally {
			// データベースを切断
			close(conn);
		}

		// 結果を返す
		return feedbacks;
	}


	@Override
	public boolean insert(FeedbacksDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean update(FeedbacksDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean delete(FeedbacksDto dto) {
		//Connection conn = null;
		boolean result = false;

		
		
		// 結果を返す
		return result;
	}
	

}
