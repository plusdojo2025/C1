package dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class AllListDto extends CustomTemplateDto implements Serializable{
	private int id;
	private int emoStampId;
	private String action;
	private int emotionId;
	private int FeedbacksId;
	private Timestamp created_at;
	private String plant;
	
	public AllListDto(int id, int emoStampId, String action, int emotionId, int feedbacksId, Timestamp created_at,
			String plant) {
		super();
		this.id = id;
		this.emoStampId = emoStampId;
		this.action = action;
		this.emotionId = emotionId;
		FeedbacksId = feedbacksId;
		this.created_at = created_at;
		this.plant = plant;
	}

	public AllListDto() {
		this(0,0,"", 0, 0, new Timestamp(System.currentTimeMillis()), "");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmoStampId() {
		return emoStampId;
	}

	public void setEmoStampId(int emoStampId) {
		this.emoStampId = emoStampId;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getEmotionId() {
		return emotionId;
	}

	public void setEmotionId(int emotionId) {
		this.emotionId = emotionId;
	}

	public int getFeedbacksId() {
		return FeedbacksId;
	}

	public void setFeedbacksId(int feedbacksId) {
		FeedbacksId = feedbacksId;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public String getPlant() {
		return plant;
	}

	public void setPlant(String plant) {
		this.plant = plant;
	}
	

}
