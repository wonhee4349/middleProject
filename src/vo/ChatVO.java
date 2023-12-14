package vo;

public class ChatVO {
	private String cb_no;
	private String cb_con;
	private String cb_rp;
	private String mg_no;
	
	public ChatVO() {}
	
	public ChatVO(String cb_no, String cb_con, String cb_rp, String mg_no) {
		super();
		this.cb_no = cb_no;
		this.cb_con = cb_con;
		this.cb_rp = cb_rp;
		this.mg_no = mg_no;
	}




	public String getCb_no() {
		return cb_no;
	}
	public void setCb_no(String cb_no) {
		this.cb_no = cb_no;
	}
	public String getCb_con() {
		return cb_con;
	}
	public void setCb_con(String cb_con) {
		this.cb_con = cb_con;
	}
	public String getCb_rp() {
		return cb_rp;
	}
	public void setCb_rp(String cb_rp) {
		this.cb_rp = cb_rp;
	}
	public String getMg_no() {
		return mg_no;
	}
	public void setMg_no(String mg_no) {
		this.mg_no = mg_no;
	}
	
	@Override
	public String toString() {
		return "ChatVO [cb_no=" + cb_no + ", cb_con=" + cb_con + ", cb_rp=" + cb_rp + ", mg_no=" + mg_no + "]";
	}
	
	
	
}
