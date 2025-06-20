package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.AllListDto;
import dto.stampsDto;

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
					value(?, ?, ?, ?, ?, NOW(), ?)
					""";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			
			pStmt.setInt(1, dto.getuserId());
			pStmt.setInt(2, dto.getEmoStampId());
			pStmt.setString(3, dto.getAction());
			pStmt.setInt(4, dto.getEmotionId());
			pStmt.setInt(5, dto.getFeedbacksId());
//			pStmt.setDate(6, new java.sql.Date(dto.getCreatedAt().getTime()));
			pStmt.setString(6, dto.getPlant());

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
	
	//ページネーション用にデータを分ける(今月)
	public List<AllListDto> selectWithPaging( int limit, int offset,Integer userId) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    List<AllListDto> cardList = new ArrayList<>();

	    try {
	        conn = conn();

	        // 検索条件を使ったSQL（created_atは今月の範囲で固定）
	        String sql = """
	            SELECT * FROM allList
	            WHERE user_id= ? AND created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
	              AND created_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
	              -- ここに他の条件あれば追加できます
	            ORDER BY created_at
	            LIMIT ? OFFSET ?
	            """;

	        pStmt = conn.prepareStatement(sql);

	        // limit, offset は最後の2つのパラメータ
	        pStmt.setInt(1, userId);
	        pStmt.setInt(2, limit);
	        pStmt.setInt(3, offset);

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
	
	//ページネーション用にデータを分ける(過去のデータ用)
	public List<AllListDto> selectWithPaging_history( int limit, int offset, String year, String month, String day, Integer userId) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    List<AllListDto> cardList = new ArrayList<>();

	    try {
	        conn = conn();
	        
	        String dateStr = String.format("%s-%s-%s", year, month, day); // 例: "2025-06-01"
	        java.sql.Date targetDate = java.sql.Date.valueOf(dateStr);

	        // 検索条件を使ったSQL（created_atは今月の範囲で固定）
	        String sql = """
	            SELECT * FROM allList
	            WHERE  user_id= ? AND created_at >= DATE_FORMAT(?, '%Y-%m-01') 
	              AND created_at < DATE_FORMAT(DATE_ADD(?, INTERVAL 1 MONTH), '%Y-%m-01')
	              -- ここに他の条件あれば追加できます
	            ORDER BY created_at
	            LIMIT ? OFFSET ?
	            """;

	        pStmt = conn.prepareStatement(sql);

	        // limit, offset は最後の2つのパラメータ
	        pStmt.setInt(1, userId);
	        pStmt.setDate(2, targetDate);
	        pStmt.setDate(3, targetDate);
	        pStmt.setInt(4, limit);
	        pStmt.setInt(5, offset);

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


	
	//データのカウント(今月)
	public int count(Integer userId) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    int count = 0;

	    try {
	        conn = conn();

	        String sql = """
	            SELECT COUNT(*) FROM allList
	            WHERE user_id= ? AND created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
	              AND created_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
	              -- ここに他の条件あれば追加できます
	            """;

	        pStmt = conn.prepareStatement(sql);
	        pStmt.setInt(1, userId);

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

    //データのカウント(過去のデータ用)
	public int count_history(String year, String month, String day,Integer userId) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    int count = 0;

	    try {
	        conn = conn();
	        
	        String countStr = String.format("%s-%s-%s", year, month, day); // 例: "2025-06-01"
	        java.sql.Date countDate = java.sql.Date.valueOf(countStr);

	        String sql = """
	            SELECT COUNT(*) FROM allList
	            WHERE user_id= ? AND created_at >= DATE_FORMAT(?, '%Y-%m-01') 
	              AND created_at < DATE_FORMAT(DATE_ADD(?, INTERVAL 1 MONTH), '%Y-%m-01')
	              -- ここに他の条件あれば追加できます
	            """;

	        pStmt = conn.prepareStatement(sql);
	        pStmt.setInt(1, userId);
	        pStmt.setDate(2, countDate);
	        pStmt.setDate(3, countDate);

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

	//アカウント削除時のデータ削除
	public boolean delete_date(Integer userId) {
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
			pStmt.setInt(1,userId);

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
	
	public List<AllListDto> select_stamp(Integer userId) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    List<AllListDto> cardList = new ArrayList<>();

	    try {
	        conn = conn();
	        
	        
	        // 検索条件を使ったSQL（created_atは今月の範囲で固定）
	        String sql = """
	            SELECT * FROM allList
	            WHERE  user_id= ? 
	            ORDER BY created_at
	            
	            """;

	        pStmt = conn.prepareStatement(sql);

	        // limit, offset は最後の2つのパラメータ
	        pStmt.setInt(1, userId);
	       	      
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
	
	
	public List<AllListDto> plant_display(Integer userId) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	    ResultSet rs = null;
	    List<AllListDto> cardList = new ArrayList<>();

	    try {
	        conn = conn();

	        // 検索条件を使ったSQL（created_atは今月の範囲で固定）
	        String sql = """
	            SELECT *
				FROM allList
				WHERE user_id=? AND DATE(created_at) = DATE_ADD(
				    DATE_SUB(DATE(created_at), INTERVAL WEEKDAY(created_at) DAY),
				    INTERVAL 5 DAY
				);

	            """;

	        pStmt = conn.prepareStatement(sql);

	        // limit, offset は最後の2つのパラメータ
	        pStmt.setInt(1, userId);
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
	
	
	
	
	

		// ****************スタンプ集計表　指定ユーザーの「今月分」のスタンプ件数をemo_stamp_idごとに取得*************
	public Map<Integer, Integer> getStampCountsThisMonth(int userId) {
	    Map<Integer, Integer> map = new HashMap<>();
	    Connection conn = null;

	    try {
	        conn = conn();  // DB接続

	        String sql = """
	            SELECT emo_stamp_id, COUNT(*) AS cnt
	        FROM allList
	        WHERE created_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
	          AND created_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
	          AND user_id = ?
	          GROUP BY emo_stamp_id
	        """;

	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt("emo_stamp_id");
	            int count = rs.getInt("cnt");
	            map.put(id, count);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(conn);
	    }

	    return map;
	}
	
	/*植物オブジェクト表示　1週間分のデータを計算するメソッド*/
		public stampsDto selectWeeklySummary(int userId) {
		    stampsDto summary = new stampsDto();
		    Connection conn = null;

		    try {
		        conn = conn();
		        String sql = """
		            SELECT COUNT(*) AS cnt,
		               COALESCE(SUM(emo_stamp_id), 0) AS total
		        FROM allList
		        WHERE user_id = ?
		          AND created_at >= DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY)
		          AND created_at <  DATE_ADD(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY), INTERVAL 7 DAY)

		        """;
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, userId);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		        	//
		        	System.out.println("DAO内のSQL結果 cnt = " + rs.getInt("cnt"));
		        	System.out.println("DAO内のSQL結果 total = " + rs.getInt("total"));
		            summary.setCnt(rs.getInt("cnt"));
		            summary.setTotalScore(rs.getInt("total"));
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        close(conn);
		    }

		    return summary;
		}
}
	





