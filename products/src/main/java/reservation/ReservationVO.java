package reservation;

public class ReservationVO {
	private String rno;//예약번호
	private String rproduct;//상품명
	private String rclient;//거래처
	private String rdate;//마감일
	private String runit;//단가
	private String rsupply;//공급가격
	private String rtax;//부가세
	private String rsum;//합계
	private String rquantity;//수량
	public String getRproduct() {
		return rproduct;
	}
	public String getRunit() {
		return runit;
	}
	public String getRsupply() {
		return rsupply;
	}
	public String getRtax() {
		return rtax;
	}
	public void setRunit(String runit) {
		this.runit = runit;
	}
	public void setRsupply(String rsupply) {
		this.rsupply = rsupply;
	}
	public void setRtax(String rtax) {
		this.rtax = rtax;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getRclient() {
		return rclient;
	}
	public String getRdate() {
		return rdate;
	}
	public String getRsum() {
		return rsum;
	}
	public String getRquantity() {
		return rquantity;
	}
	public void setRproduct(String rproduct) {
		this.rproduct = rproduct;
	}
	public void setRclient(String rclient) {
		this.rclient = rclient;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public void setRsum(String rsum) {
		this.rsum = rsum;
	}
	public void setRquantity(String rquantity) {
		this.rquantity = rquantity;
	}
}
