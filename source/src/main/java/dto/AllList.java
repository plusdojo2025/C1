package dto;

import java.io.Serializable;
import java.util.Date;


public class AllList extends AllListDto implements Serializable{
	private String feedbacks;

	public String getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(String feedbacks) {
		this.feedbacks = feedbacks;
	}

	public AllList(int id, int userId, int emoStampId, String action, int emotionId, int feedbacksId, Date createdAt,
			String plant) {
		super(id, userId, emoStampId, action, emotionId, feedbacksId, createdAt, plant);
		// TODO 自動生成されたコンストラクター・スタブ
	}
	
	
}
