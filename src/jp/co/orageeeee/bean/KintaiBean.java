package jp.co.orageeeee.bean;

public class KintaiBean {

	/** pk \*/
	private String detailId;

	private String pjName;

	private String team;

	private String time;

	/**
	 *  1：変更あり
	 * -1：削除行
	 */
	private String chgFlg;

	public String getDetailId() {
		return detailId;
	}



	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}



	public String getChgFlg() {
		return chgFlg;
	}



	public void setChgFlg(String chgFlg) {
		this.chgFlg = chgFlg;
	}



	public String getPjName() {
		return pjName;
	}



	public void setPjName(String pjName) {
		this.pjName = pjName;
	}



	public String getTeam() {
		return team;
	}



	public void setTeam(String team) {
		this.team = team;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public KintaiBean() {

	}
}
