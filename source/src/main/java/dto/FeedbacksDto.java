package dto;

import java.io.Serializable;

public class FeedbacksDto extends CustomTemplateDto implements Serializable{
	private int id;
	private int emo_stamp_id;
	private int emotionId;
	private String feedbacks;

	public FeedbacksDto(int id, int emo_stamp_id, int emotionId, String feedbacks) {
		super();
		this.id = id;
		this.emo_stamp_id = emo_stamp_id;
		this.emotionId = emotionId;
		this.feedbacks = feedbacks;
	}
	
	public FeedbacksDto() {
		this(0, 0, 0, "");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getEmo_stamp_id() {
		return emo_stamp_id;
	}

	public void setEmo_stamp_id(int emo_stamp_id) {
		this.emo_stamp_id = emo_stamp_id;
	}

	public int getEmotionId() {
		return emotionId;
	}

	public void setEmotionId(int emotionId) {
		this.emotionId = emotionId;
	}

	public String getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(String feedbacks) {
		this.feedbacks = feedbacks;
	}
	
	
}
