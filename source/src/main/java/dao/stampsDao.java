package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.stampsDto;

public class stampsDao extends CustomTemplateDao<stampsDto> {

	@Override
	public List<stampsDto> select(stampsDto dto) {
		Connection conn = null;
		List<stampsDto> stamps = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = """
					SELECT COUNT(*) AS cnt, COALESCE(SUM(emo_stamp_id), 0) 
					AS total FROM alllist WHERE created_at >= DATE_SUB
					(CURDATE(), INTERVAL (WEEKDAY(CURDATE()) + 1) % 7 DAY) AND created_at < DATE_ADD(
					 DATE_SUB(CURDATE(), INTERVAL (WEEKDAY(CURDATE()) + 1) % 7 DAY), INTERVAL 7 DAY )
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if (rs.next()) {
				stamps.add(new stampsDto(
				  rs.getInt("cnt"),
				  rs.getInt("totalScore")
				  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			stamps = null;
		} finally {
			// データベースを切断
			close(conn);
		}

		// 結果を返す
		return stamps;
	
	}

	@Override
	public boolean insert(stampsDto dto) {
//		Connection conn = null;
		boolean result = false;
//		
//		try {
//			conn = conn();
//
//			// SQL文を準備する
//			String sql = """
//					INSERT INTO stamps (user_id, weekstamps, created_at) 
//					VALUES (?, ?, new Timestamp(System.currentTimeMillis()); 
//					""";
//			PreparedStatement pStmt = conn.prepareStatement(sql);
//
//			// SQL文を完成させる
//			pStmt.setInt(1, dto.getUserId());
//			pStmt.setInt(2, dto.getWeekStamps());
//			pStmt.setDate(3, new java.sql.Date(dto.getCreatedAt().getTime()));
//
//			// SQL文を実行する
//			if (pStmt.executeUpdate() == 1) {
//				result = true;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			// データベースを切断
//			close(conn);
//			}
		
		// 結果を返す
		return result;
	}

	@Override
	public boolean update(stampsDto dto) {
		//Connection conn = null;
		boolean result = false;
		// 結果を返す
		return result;
	}

	@Override
	public boolean delete(stampsDto dto) {
		Connection conn = null;
		boolean result = false;
		
		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = """
					CREATE EVENT delete_last_week_records ON 
					SCHEDULE EVERY 1 WEEK STARTS DATE_ADD(CURRENT_DATE, 
					INTERVAL (7 - WEEKDAY(CURRENT_DATE)) % 7 DAY) 
					-- 次の日曜日スタート DO DELETE FROM alllist WHERE 
					created_at >= DATE_SUB(CURDATE(), INTERVAL 
					((WEEKDAY(CURDATE()) + 1) % 7 + 7) DAY) AND created_at 
					< DATE_SUB(CURDATE(), INTERVAL (WEEKDAY(CURDATE()) + 1) % 7 DAY) 
					""";
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
	
		

	
	
	
