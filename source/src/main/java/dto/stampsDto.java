package dto;

import java.io.Serializable;
import java.util.Date;

public class stampsDto extends CustomTemplateDto implements Serializable{
	private int weekStamps;
	private Date createdAt;

	public stampsDto(int weekStamps, Date createdAt) {
		super();
		this.weekStamps = weekStamps;
		this.createdAt = createdAt;
	}
	
	public stampsDto() {
		this(0, new Date());
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
	
	
}
