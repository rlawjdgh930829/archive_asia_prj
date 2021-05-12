package com.spring.archive.domain;

import javax.validation.constraints.NotEmpty;

public class MemberDTO {
	
	private int memberNo;
	@NotEmpty(message = "아이디를 입력해주세요.")
	private String memberId;
	@NotEmpty(message = "비밀번호를 입력해주세요.")
	private String memberPwd;
	@NotEmpty(message = "이메일을 입력해주세요.")
	private String memberEmail;
	private int authorityNo;
	private String authorityName;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}

}
