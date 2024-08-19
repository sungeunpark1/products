package user;

public class UserVO {
	private String userno;//会員番号
	private String username;//会員名前
	private int usergrade;//グレード
	private String userphonenumber;//携帯電話
	private String userpassword;
	private String userdeleteyn;
	public String getUserdeleteyn() {
		return userdeleteyn;
	}
	public void setUserdeleteyn(String userdeleteyn) {
		this.userdeleteyn = userdeleteyn;
	}
	public String getUserphonenumber() {
		return userphonenumber;
	}
	public void setUserphonenumber(String userphonenumber) {
		this.userphonenumber = userphonenumber;
	}
	public String getUserno() {
		return userno;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsername() {
		return username;
	}
	public int getUsergrade() {
		return usergrade;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setUsergrade(int usergrade) {
		this.usergrade = usergrade;
	}
	
}
