package genobot;

public class qnaVO {
	
	String user_name;
	String phone_num;
	String comment;
	String call_state;
	int boardnum;
	String reg_date;
	String ck_date;
	String call_result;
	
	public qnaVO(String user_name, String phone_num, String comment, String call_state, int boardnum, String reg_date,
			String ck_date, String call_result) {
		super();
		this.user_name = user_name;
		this.phone_num = phone_num;
		this.comment = comment;
		this.call_state = call_state;
		this.boardnum = boardnum;
		this.reg_date = reg_date;
		this.ck_date = ck_date;
		this.call_result = call_result;
	}
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCall_state() {
		return call_state;
	}
	public void setCall_state(String call_state) {
		this.call_state = call_state;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getCk_date() {
		return ck_date;
	}
	public void setCk_date(String ck_date) {
		this.ck_date = ck_date;
	}
	public String getCall_result() {
		return call_result;
	}
	public void setCall_result(String call_result) {
		this.call_result = call_result;
	}
	
	
	

	
	

	

}
