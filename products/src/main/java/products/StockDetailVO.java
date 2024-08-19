package products;

public class StockDetailVO {
	private String sdno;//제품 번호製品登録番号
	private String sdname;//제품 이름製品名前
	private String sddescription;//제품 설명製品説明
	private String sddeleteyn;//제품 삭제여부
	private String sdinsertdate;//제품 등록 일자
	private String sdphoto;//제품 사진 製品写真
	public String getSdno() {
		return sdno;
	}
	public String getSdphoto() {
		return sdphoto;
	}
	public void setSdphoto(String sdphoto) {
		this.sdphoto = sdphoto;
	}
	public String getSdname() {
		return sdname;
	}
	public String getSddescription() {
		return sddescription;
	}
	public String getSddeleteyn() {
		return sddeleteyn;
	}
	public String getSdinsertdate() {
		return sdinsertdate;
	}
	public void setSdno(String sdno) {
		this.sdno = sdno;
	}
	public void setSdname(String sdname) {
		this.sdname = sdname;
	}
	public void setSddescription(String sddescription) {
		this.sddescription = sddescription;
	}
	public void setSddeleteyn(String sddeleteyn) {
		this.sddeleteyn = sddeleteyn;
	}
	public void setSdinsertdate(String sdinsertdate) {
		this.sdinsertdate = sdinsertdate;
	}
	
}
