package dto;

import java.io.Serializable;
import java.util.Date;

public class stampsDto extends CustomTemplateDto implements Serializable{
	private int userId;
	private int weekStamps;
	private Date createdAt;
	
	// 件数（1週間の登録数）
	private int count;

	// 合計スコア（1週間のスコア）
	private int totalScore;
	
	public stampsDto(int userId, int weekStamps, Date createdAt) {
		super();
		this.userId = userId;
		this.weekStamps = weekStamps;
		this.createdAt = createdAt;
	}
	
	public stampsDto() {
		this(0, 0, new Date());
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getWeekStamps() {
		return weekStamps;
	}

	public void setWeekStamps(int weekStamps) {
		this.weekStamps = weekStamps;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public int getCount() {
	    return count;
	}
	public void setCount(int count) {
	    this.count = count;
	}

	public int getTotalScore() {
	    return totalScore;
	}
	public void setTotalScore(int totalScore) {
	    this.totalScore = totalScore;
	}
	
	
}
