package products;

public class ProductVO {
	private String pno;//제품 번호製品番号
	private String pproduct;//상품명商品名
	private String psize;//규격規格
	private String punit;//단가単価
	private String pquantity;//수량数量
	private String psupply;//공급가격供給価格
	private String ptax;//부가세付加税
	private String psum;//합계合計
	private String pdate;//
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPno() {
		return pno;
	}
	public String getPproduct() {
		return pproduct;
	}
	public String getPsize() {
		return psize;
	}
	public String getPunit() {
		return punit;
	}
	public String getPquantity() {
		return pquantity;
	}
	public String getPsupply() {
		return psupply;
	}
	public String getPtax() {
		return ptax;
	}
	public String getPsum() {
		return psum;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public void setPproduct(String pproduct) {
		this.pproduct = pproduct;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	public void setPquantity(String pquantity) {
		this.pquantity = pquantity;
	}
	public void setPsupply(String psupply) {
		this.psupply = psupply;
	}
	public void setPtax(String ptax) {
		this.ptax = ptax;
	}
	public void setPsum(String psum) {
		this.psum = psum;
	}
}
