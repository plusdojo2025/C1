package dto;

import java.io.Serializable;

public class ExplanationDto extends CustomTemplateDto implements Serializable {
	private String title;
	private String content;
	
	public ExplanationDto(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}

	public ExplanationDto() {
		this("","");
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	
	
	
}
