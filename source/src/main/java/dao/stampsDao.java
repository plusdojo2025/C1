package dao;

import java.sql.Connection;
import java.sql.DriverManager;
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
					SELECT COUNT(*) AS count, SUM(weekstamps) AS total 
					FROM stamps WHERE user_id = ? 
					AND created_at >= NOW() - INTERVAL 7 DAY
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				stampsDto stamp = new stampsDto(rs.getInt("user_id"),
						rs.getInt("weekstamps"),
						new java.util.Date(rs.getDate("created_at").getTime()));
				stamps.add(stamp);
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
		Connection conn = null;
		boolean result = false;
		
		try {
			conn = conn();

			// SQL文を準備する
			String sql = """
					INSERT INTO stamps (user_id, weekstamps, created_at) 
					VALUES (?, ?, new Timestamp(System.currentTimeMillis()); 
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getUserId());
			pStmt.setInt(2, dto.getWeekStamps());
			pStmt.setDate(3, new java.sql.Date(dto.getCreatedAt().getTime()));

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
					CREATE EVENT IF NOT EXISTS delete_old_stamps_per_user ON 
					SCHEDULE EVERY 1 DAY DO DELETE FROM stamps WHERE id IN 
					( SELECT id FROM ( SELECT id, ROW_NUMBER() OVER 
					(PARTITION BY user_id ORDER BY created_at DESC) 
					AS rn FROM stamps ) AS numbered WHERE rn > 7 ); 
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
	
	public stampsDto selectWeeklySummary(int userId) {
	    stampsDto dto = new stampsDto();
	    String sql = """
	        SELECT COUNT(*) AS cnt,
	               COALESCE(SUM(weekstamps), 0) AS total
	        FROM stamps
	        WHERE user_id = ?
	          AND created_at >= CURDATE() - INTERVAL 7 DAY
	    """;

	    try (Connection conn = DriverManager.getConnection(
	    	    "jdbc:mysql://localhost:3306/your_database_name?serverTimezone=Asia/Tokyo",
	    	    "your_username",
	    	    "your_password"
	    		);
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            dto.setUserId(userId);
	            dto.setCount(rs.getInt("cnt"));
	            dto.setTotalScore(rs.getInt("total"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return dto;
	}
	
		

	
	
	

}
