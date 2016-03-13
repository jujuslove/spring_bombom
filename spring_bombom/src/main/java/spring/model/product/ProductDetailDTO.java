package spring.model.product;

public class ProductDetailDTO {
	private int      product_detail_no;
	private int      product_no;
	private String   product_detail_name;
	private String   bigo;
	private char[]   sell_yn;
	private int      curr_cnt;
	
	
	public int getProduct_detail_no() {
		return product_detail_no;
	}
	public void setProduct_detail_no(int product_detail_no) {
		this.product_detail_no = product_detail_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_detail_name() {
		return product_detail_name;
	}
	public void setProduct_detail_name(String product_detail_name) {
		this.product_detail_name = product_detail_name;
	}
	public String getBigo() {
		return bigo;
	}
	public void setBigo(String bigo) {
		this.bigo = bigo;
	}
	public char[] getSell_yn() {
		return sell_yn;
	}
	public void setSell_yn(char[] sell_yn) {
		this.sell_yn = sell_yn;
	}
	public int getCurr_cnt() {
		return curr_cnt;
	}
	public void setCurr_cnt(int curr_cnt) {
		this.curr_cnt = curr_cnt;
	}
	
	
}
