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
			String sql = """
					SELECT * from allList WHERE created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
					AND created_at 
					< DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01') 
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				AllListDto allLists = new AllListDto(rs.getInt("id"),
						rs.getInt("user_id"),
						rs.getInt("emo_stamp_id"),
						rs.getString("action"),
						rs.getInt("emotion_id"),
						rs.getInt("feedbacks_id"),
						new java.util.Date(rs.getDate("created_at").getTime()),
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
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = """
					insert allList(user_id,
					emo_stamp_id, 
					action, 
					emotion_id, 
					feedbacks_id, 
					created_at, 
					plant)
					value(?,?,0,?,?,new Timestamp(System.currentTimeMillis(),?)
					user_id = ?
					emo_stamp_id= ?
					action= ?
					emotion_id= ?
					feedbacks_id= ?
					created_at= ?
					plant= ?
					where id = ?
					
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			
			pStmt.setInt(1, dto.getuserId());
			pStmt.setInt(2, dto.getEmoStampId());
			pStmt.setString(3, dto.getAction());
			pStmt.setInt(4, dto.getEmotionId());
			pStmt.setInt(5, dto.getFeedbacksId());
			pStmt.setDate(6, new java.sql.Date(dto.getCreatedAt().getTime()));
			pStmt.setString(7, dto.getPlant());

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
	public boolean update(AllListDto dto)  {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			// データベースに接続する
			conn = conn();

			// SQL文を準備する
			String sql = """
					update allList set
					user_id = ?
					emo_stamp_id= ?
					action= ?
					emotion_id= ?
					feedbacks_id= ?
					created_at= ?
					plant= ?
					where id = ?
					
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, dto.getuserId());
			pStmt.setInt(2, dto.getEmoStampId());
			pStmt.setString(3, dto.getAction());
			pStmt.setInt(4, dto.getEmotionId());
			pStmt.setInt(5, dto.getFeedbacksId());
			pStmt.setDate(6, new java.sql.Date(dto.getCreatedAt().getTime()));
			pStmt.setString(7, dto.getPlant());
			pStmt.setInt(8, dto.getId());

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
	public boolean delete(AllListDto dto) {
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
			pStmt.setInt(1, dto.getId());

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
	
	//今日だけ登録しているのかを調べる
	public boolean hasTodayEntry(int userId) {
	    Connection conn = null;
	    boolean exists = false;

	    try {
	        conn = conn();
	        String sql = "SELECT 1 FROM alllist WHERE user_id = ? AND DATE(created_at) = CURDATE() LIMIT 1";
	        PreparedStatement pStmt = conn.prepareStatement(sql);
	        pStmt.setInt(1, userId);
	        ResultSet rs = pStmt.executeQuery();
	        //1件でもあればtrue
	        exists = rs.next();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(conn);
	    }

	    return exists;
	}
	
	
	public List<AllListDto> selectWithPaging( int limit, int offset) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    List<AllListDto> cardList = new ArrayList<>();

	    try {
	        conn = conn();

	        // 検索条件を使ったSQL（created_atは今月の範囲で固定）
	        String sql = """
	            SELECT * FROM allList
	            WHERE created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
	              AND created_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
	              -- ここに他の条件あれば追加できます
	            ORDER BY created_at
	            LIMIT ? OFFSET ?
	            """;

	        pStmt = conn.prepareStatement(sql);

	        // limit, offset は最後の2つのパラメータ
	        pStmt.setInt(1, limit);
	        pStmt.setInt(2, offset);

	        rs = pStmt.executeQuery();

	        while (rs.next()) {
	            AllListDto allLists = new AllListDto(
	                rs.getInt("id"),
	                rs.getInt("user_id"),
	                rs.getInt("emo_stamp_id"),
	                rs.getString("action"),
	                rs.getInt("emotion_id"),
	                rs.getInt("feedbacks_id"),
	                new java.util.Date(rs.getDate("created_at").getTime()),
	                rs.getString("plant")
	            );
	            cardList.add(allLists);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(conn);
	    }

	    return cardList;
	}


	
	
	public int count() {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    int count = 0;

	    try {
	        conn = conn();

	        String sql = """
	            SELECT COUNT(*) FROM allList
	            WHERE created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
	              AND created_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
	              -- ここに他の条件あれば追加できます
	            """;

	        pStmt = conn.prepareStatement(sql);

	        rs = pStmt.executeQuery();

	        if (rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(conn);
	    }

	    return count;
	}



}



