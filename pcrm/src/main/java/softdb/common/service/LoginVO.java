package softdb.common.service;

import java.io.Serializable;
import java.util.Map;


public class LoginVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	/** 아이디 */
	private String usrId;
	/** 이름 */
	private String usrNm;
	
	private String loginCode;
	private String extnNo;
	private String ctiUseYn;
	private String ctiLgnId;
	private String cntrCd;
	private String teamCd;
	private String deptCd;
	private String teamNm;
	private String usrGrdCd;
	
	/** 비밀번호 */
	private String password;
	/** 비밀번호 힌트 */
	private String passwordHint;
	/** 비밀번호 정답 */
	private String passwordCnsr;
	
	

	public LoginVO() {
	}
	
	public LoginVO(Map map) {
		if(map != null) {
			this.loginCode = map.get("login_code").toString();
			this.usrId = map.get("usr_id").toString();
			this.usrNm = map.get("usr_nm").toString();
		}
	}


	public String getUsrId() {
		return usrId;
	}



	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}



	public String getUsrNm() {
		return usrNm;
	}



	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}



	public String getLoginCode() {
		return loginCode;
	}



	public void setLoginCode(String loginCode) {
		this.loginCode = loginCode;
	}



	public String getExtnNo() {
		return extnNo;
	}



	public void setExtnNo(String extnNo) {
		this.extnNo = extnNo;
	}



	public String getCtiUseYn() {
		return ctiUseYn;
	}



	public void setCtiUseYn(String ctiUseYn) {
		this.ctiUseYn = ctiUseYn;
	}



	public String getCtiLgnId() {
		return ctiLgnId;
	}



	public void setCtiLgnId(String ctiLgnId) {
		this.ctiLgnId = ctiLgnId;
	}



	public String getCntrCd() {
		return cntrCd;
	}



	public void setCntrCd(String cntrCd) {
		this.cntrCd = cntrCd;
	}



	public String getTeamCd() {
		return teamCd;
	}



	public void setTeamCd(String teamCd) {
		this.teamCd = teamCd;
	}



	public String getDeptCd() {
		return deptCd;
	}



	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}



	public String getTeamNm() {
		return teamNm;
	}



	public void setTeamNm(String teamNm) {
		this.teamNm = teamNm;
	}



	public String getUsrGrdCd() {
		return usrGrdCd;
	}



	public void setUsrGrdCd(String usrGrdCd) {
		this.usrGrdCd = usrGrdCd;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getPasswordHint() {
		return passwordHint;
	}



	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}



	public String getPasswordCnsr() {
		return passwordCnsr;
	}



	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LoginVO [usrId=");
		builder.append(usrId);
		builder.append(", usrNm=");
		builder.append(usrNm);
		builder.append(", loginCode=");
		builder.append(loginCode);
		builder.append(", extnNo=");
		builder.append(extnNo);
		builder.append(", ctiUseYn=");
		builder.append(ctiUseYn);
		builder.append(", ctiLgnId=");
		builder.append(ctiLgnId);
		builder.append(", cntrCd=");
		builder.append(cntrCd);
		builder.append(", teamCd=");
		builder.append(teamCd);
		builder.append(", deptCd=");
		builder.append(deptCd);
		builder.append(", teamNm=");
		builder.append(teamNm);
		builder.append(", usrGrdCd=");
		builder.append(usrGrdCd);
		builder.append(", password=");
		builder.append(password);
		builder.append(", passwordHint=");
		builder.append(passwordHint);
		builder.append(", passwordCnsr=");
		builder.append(passwordCnsr);
		builder.append("]");
		return builder.toString();
	}
	
}
