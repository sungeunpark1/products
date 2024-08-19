package client;

public class ClientVO {
	private String cno;//고객번호 顧客番号
	private String cproduct;//고객 구입 제품  購入製品
	private String cname;//고객 이름 顧客名
	private String cphonenumber;//고객전화번호 お客様の電話番号
	private String cbuydate;//구입일자 購入日
	private String casdate;//as  AS期間
	private String cnote;//비고 備考
	private String cdeleteyn;//삭제여부
	
	private String cbuydate2;//그래프 가져올 때 일자
	public String getCbuydate2() {
		return cbuydate2;
	}
	public void setCbuydate2(String cbuydate2) {
		this.cbuydate2 = cbuydate2;
	}
	public String getCno() {
		return cno;
	}
	public String getCproduct() {
		return cproduct;
	}
	public String getCname() {
		return cname;
	}
	public String getCphonenumber() {
		return cphonenumber;
	}
	public String getCbuydate() {
		return cbuydate;
	}
	public String getCasdate() {
		return casdate;
	}
	public String getCnote() {
		return cnote;
	}
	public String getCdeleteyn() {
		return cdeleteyn;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public void setCproduct(String cproduct) {
		this.cproduct = cproduct;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public void setCphonenumber(String cphonenumber) {
		this.cphonenumber = cphonenumber;
	}
	public void setCbuydate(String cbuydate) {
		this.cbuydate = cbuydate;
	}
	public void setCasdate(String casdate) {
		this.casdate = casdate;
	}
	public void setCnote(String cnote) {
		this.cnote = cnote;
	}
	public void setCdeleteyn(String cdeleteyn) {
		this.cdeleteyn = cdeleteyn;
	}
}
