package vo;

public class QaVO {

	private String mg_no;
	private String qa_con;
	private String qa_date;
	private int qa_hit;
	private String qa_no;
	private String qa_recon;
	private String qa_title;
	private String users_no;
	private String users_name;
	
	public String getMg_no() {
		return mg_no;
	}
	public void setMg_no(String mg_no) {
		this.mg_no = mg_no;
	}
	public String getQa_con() {
		return qa_con;
	}
	public void setQa_con(String qa_con) {
		this.qa_con = qa_con;
	}
	public String getQa_date() {
		return qa_date;
	}
	public void setQa_date(String qa_date) {
		this.qa_date = qa_date;
	}
	public int getQa_hit() {
		return qa_hit;
	}
	public void setQa_hit(int qa_hit) {
		this.qa_hit = qa_hit;
	}
	public String getQa_no() {
		return qa_no;
	}
	public void setQa_no(String qa_no) {
		this.qa_no = qa_no;
	}
	public String getQa_recon() {
		return qa_recon;
	}
	public void setQa_recon(String qa_recon) {
		this.qa_recon = qa_recon;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getUsers_no() {
		return users_no;
	}
	public void setUsers_no(String users_no) {
		this.users_no = users_no;
	}

	public String getUsers_name() {
		return users_name;
	}
	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}
	
	@Override
	public String toString() {
		return "QaVO [mg_no=" + mg_no + ", qa_con=" + qa_con + ", qa_date=" + qa_date + ", qa_hit=" + qa_hit
				+ ", qa_no=" + qa_no + ", qa_recon=" + qa_recon + ", qa_title=" + qa_title + ", users_no=" + users_no
				+ ", users_name=" + users_name + "]";
	}	
}
