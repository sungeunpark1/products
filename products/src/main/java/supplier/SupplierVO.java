package supplier;

public class SupplierVO {
	private String sno;//공급처 채번  供給先番号
	private String sclient;//공급처 담당자 이름 担当者名
	private String sphonenumber;//공급처 전화번호 電話番号
	private String saddress;//공급처 주소 住所
	private String snote;//공급처 비고 備考
	private String sinsertdate;//데이터 입력일 入力日
	private String supdatedate;//데이터 수정일 修正日
	private String sdeleteyn;//공급처 삭제여부
	public String getSno() {
		return sno;
	}
	public String getSclient() {
		return sclient;
	}
	public String getSphonenumber() {
		return sphonenumber;
	}
	public String getSaddress() {
		return saddress;
	}
	public String getSnote() {
		return snote;
	}
	public String getSinsertdate() {
		return sinsertdate;
	}
	public String getSupdatedate() {
		return supdatedate;
	}
	public String getSdeleteyn() {
		return sdeleteyn;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public void setSclient(String sclient) {
		this.sclient = sclient;
	}
	public void setSphonenumber(String sphonenumber) {
		this.sphonenumber = sphonenumber;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	public void setSnote(String snote) {
		this.snote = snote;
	}
	public void setSinsertdate(String sinsertdate) {
		this.sinsertdate = sinsertdate;
	}
	public void setSupdatedate(String supdatedate) {
		this.supdatedate = supdatedate;
	}
	public void setSdeleteyn(String sdeleteyn) {
		this.sdeleteyn = sdeleteyn;
	}
}
