package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ExplanationDto;

public class ExplanationDao extends CustomTemplateDao<ExplanationDto> {

	@Override
	public List<ExplanationDto> select(ExplanationDto dto) {
		Connection conn = null;
		List<ExplanationDto> explanation = new ArrayList<>();

		try {
			conn = conn();

			// SQL文を準備する
			String sql = "select * from explanation";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, dto.getTitle());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				ExplanationDto explain = new ExplanationDto(rs.getString("title"),
						rs.getString("content")
				);
				explanation.add(explain);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			explanation = null;
		} finally {
			// データベースを切断
			close(conn);
		}

		// 結果を返す
		return explanation;
	}

	@Override
	public boolean insert(ExplanationDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean update(ExplanationDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}

	@Override
	public boolean delete(ExplanationDto dto) {
		// TODO 自動生成されたメソッド・スタブ
		return false;
	}
}
