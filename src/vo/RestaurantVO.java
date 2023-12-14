package vo;

public class RestaurantVO {
	
	private String rs_no;
	private String rs_name;
	private String rs_con;
	private String rs_addr;
	private String rs_tel;
	private double rs_lat;
	private double rs_long;
	private int rs_good;
	private int rs_bad;
	private int rs_hit;
	private String rs_date;
	private String mg_no;
	
	private String origin_file_name;
	private String save_file_name;
	
	public String getRs_no() {
		return rs_no;
	}
	public void setRs_no(String rs_no) {
		this.rs_no = rs_no;
	}
	public String getRs_name() {
		return rs_name;
	}
	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}
	public String getRs_con() {
		return rs_con;
	}
	public void setRs_con(String rs_con) {
		this.rs_con = rs_con;
	}
	public String getRs_addr() {
		return rs_addr;
	}
	public void setRs_addr(String rs_addr) {
		this.rs_addr = rs_addr;
	}
	public String getRs_tel() {
		return rs_tel;
	}
	public void setRs_tel(String rs_tel) {
		this.rs_tel = rs_tel;
	}
	public double getRs_lat() {
		return rs_lat;
	}
	public void setRs_lat(double rs_lat) {
		this.rs_lat = rs_lat;
	}
	public double getRs_long() {
		return rs_long;
	}
	public void setRs_long(double rs_long) {
		this.rs_long = rs_long;
	}
	public int getRs_good() {
		return rs_good;
	}
	public void setRs_good(int rs_good) {
		this.rs_good = rs_good;
	}
	public int getRs_bad() {
		return rs_bad;
	}
	public void setRs_bad(int rs_bad) {
		this.rs_bad = rs_bad;
	}
	public int getRs_hit() {
		return rs_hit;
	}
	public void setRs_hit(int rs_hit) {
		this.rs_hit = rs_hit;
	}
	public String getRs_date() {
		return rs_date;
	}
	public void setRs_date(String rs_date) {
		this.rs_date = rs_date;
	}
	public String getMg_no() {
		return mg_no;
	}
	public void setMg_no(String mg_no) {
		this.mg_no = mg_no;
	}		
	public String getOrigin_file_name() {
		return origin_file_name;
	}
	public void setOrigin_file_name(String origin_file_name) {
		this.origin_file_name = origin_file_name;
	}
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	@Override
	public String toString() {
		return "RestaurantVO [rs_no=" + rs_no + ", rs_name=" + rs_name + ", rs_con=" + rs_con + ", rs_addr=" + rs_addr
				+ ", rs_tel=" + rs_tel + ", rs_lat=" + rs_lat + ", rs_long=" + rs_long + ", rs_good=" + rs_good
				+ ", rs_bad=" + rs_bad + ", rs_hit=" + rs_hit + ", rs_date=" + rs_date + ", mg_no=" + mg_no + "]";
	}
	
	

}
