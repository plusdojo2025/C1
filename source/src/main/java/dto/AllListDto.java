package dto;

import java.io.Serializable;
import java.util.Date;


public class AllListDto extends CustomTemplateDto implements Serializable{
	private int id;
	private int userId;
	private int emoStampId;
	private String action;
	private int emotionId;
	private int FeedbacksId;
	private Date createdAt;
	private String plant;
	
	public AllListDto(int id, int userId, int emoStampId, String action, int emotionId, int feedbacksId, Date createdAt,
			String plant) {
		super();
		this.id = id;
		this.userId = userId;
		this.emoStampId = emoStampId;
		this.action = action;
		this.emotionId = emotionId;
		FeedbacksId = feedbacksId;
		this.createdAt = createdAt;
		this.plant = plant;
	}

	public AllListDto() {
		this(0,0,0,"", 0, 0, new Date(), "");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getuserId() {
		return userId;
	}

	public void setuserId(int userId) {
		this.userId = userId;
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

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getPlant() {
		return plant;
	}

	public void setPlant(String plant) {
		this.plant = plant;
	}
	

}
