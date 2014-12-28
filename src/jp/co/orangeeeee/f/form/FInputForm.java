package jp.co.orangeeeee.f.form;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jp.co.orageeeee.bean.KintaiBean;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class FInputForm extends ActionForm {

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		super.reset(mapping, request);

		String strKinmListSize = request.getParameter("kinmBeanListSize");

		if(strKinmListSize != null) {

			//listのマッピングを設定する。
			int kinmListSize = Integer.parseInt((String)request.getParameter("kinmBeanListSize"));

			List<KintaiBean> tmpKinmBeanList = new ArrayList<KintaiBean>();

			for(int i=0; i < kinmListSize; i++) {

				tmpKinmBeanList.add(new KintaiBean());
			}
			kinmBeanList = tmpKinmBeanList;

		}
	}

	/** 入力者の名前 */
	private String name;

	List<KintaiBean> kinmBeanList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<KintaiBean> getKinmBeanList() {
		return kinmBeanList;
	}

	public void setKinmBeanList(List<KintaiBean> kinmBeanList) {
		this.kinmBeanList = kinmBeanList;
	}

	/**
	 * バリデーション
	 */
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		final String ERR_REQ = "err_req";
		final String ERR_NUM = "err_num";
		final String ERR_FMT = "err_fmt";
		final String ERR_JP = "err_jp";


		ActionErrors errors=new ActionErrors();

		for(int i=0,listSize=kinmBeanList.size(); i < listSize; i++ ) {

			errors.add("pjName_" + i ,new ActionMessage(ERR_REQ));
			errors.add("team_" + i,new ActionMessage(ERR_NUM));
			errors.add("time_" + i,new ActionMessage(ERR_FMT));
		}
		return errors;
	}

}
