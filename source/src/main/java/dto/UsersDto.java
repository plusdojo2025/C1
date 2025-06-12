package dto;

import java.io.Serializable;

public class UsersDto extends CustomTemplateDto implements Serializable {
	private int userId;
	private String loginId;
	private String passwordHash;

	public UsersDto(int userId, String loginId, String passwordHash) {
		super();
		this.userId = userId;
		this.loginId = loginId;
		this.passwordHash = passwordHash;
	}

	public UsersDto() {
		this(0, "", "");
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}
}
