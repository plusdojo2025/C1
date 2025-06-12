package dto;

import java.io.Serializable;

public class EmotionsDto extends CustomTemplateDto implements Serializable{
	private int emoStamp;
	private String action;
	private int emotion;
	
	public EmotionsDto(int emoStamp, String action, int emotion) {
		super();
		this.emoStamp = emoStamp;
		this.action = action;
		this.emotion = emotion;
	}

	public EmotionsDto() {
		this(0, "", 0);
	}

	public int getEmoStamp() {
		return emoStamp;
	}

	public void setEmoStamp(int emoStamp) {
		this.emoStamp = emoStamp;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getEmotion() {
		return emotion;
	}

	public void setEmotion(int emotion) {
		this.emotion = emotion;
	}
	
	
	
	


}
