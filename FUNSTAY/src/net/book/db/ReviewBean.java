package net.book.db;

import java.sql.Date;

public class ReviewBean {
	
	//review�뀒�씠釉� 而щ읆 紐⑸줉
	private String payment_num;
	private String content;
	private Date review_date;
	private String satisfaction;
	private String clean;
	private String access;
	private String member_email;
	private int home_num;
	
	
	
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(String string) {
		this.satisfaction = string;
	}
	public String getClean() {
		return clean;
	}
	public void setClean(String string) {
		this.clean = string;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String string) {
		this.access = string;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getHome_num() {
		return home_num;
	}
	public void setHome_num(int home_num) {
		this.home_num = home_num;
	}
	
	

}
