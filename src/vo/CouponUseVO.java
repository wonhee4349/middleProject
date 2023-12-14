package vo;

public class CouponUseVO {

    private String users_no;
    private String cp_no;
 // 추가: 쿠폰 사용 여부
	public String getUsers_no() {
		return users_no;
	}
	public void setUsers_no(String users_no) {
		this.users_no = users_no;
	}
	public String getCp_no() {
		return cp_no;
	}
	public void setCp_no(String cp_no) {
		this.cp_no = cp_no;
	}
	@Override
	public String toString() {
		return "CouponUseVO [users_no=" + users_no + ", cp_no=" + cp_no + "]";
	}



}
