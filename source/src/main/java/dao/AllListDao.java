package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AllListDto;

public class AllListDao extends CustomTemplateDao<AllListDto> {
	
	@Override
	public List<AllListDto> select(AllListDto dto) {
		Connection conn = null;
		List<AllListDto> allList = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = "SELECT emo_stamp_id, action, emotion_id, feedbacks_id, created_at from allList WHERE created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') AND created_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01'); ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getId());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				AllListDto allLists = new AllListDto(rs.getInt("id"),
						rs.getInt("emo_stamp_id"),
						rs.getString("action"),
						rs.getInt("emotion_id"),
						rs.getInt("feedbacks_id"),
						rs.getTimestamp("created_at"),
						rs.getString("plant")
				);
				allList.add(allLists);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			allList = null;
		} finally {
			// データベースを切断
			close(conn);
		}

		// 結果を返す
		return allList;
	}

	@Override
	public boolean insert(AllListDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean update(AllListDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean delete(AllListDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

}



