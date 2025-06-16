package dto;

import java.io.Serializable;

public class ErrorDto implements Serializable{
	private String title; // タイトル
	private String message; // メッセージ
	private String backTo; // 戻り先
	
	

	public ErrorDto(String title, String message, String backTo) {
		super();
		this.title = title;
		this.message = message;
		this.backTo = backTo;
	}
	
	public ErrorDto() {
		this("", "", "");
	}


	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getBackTo() {
		return backTo;
	}



	public void setBackTo(String backTo) {
		this.backTo = backTo;
	}




}